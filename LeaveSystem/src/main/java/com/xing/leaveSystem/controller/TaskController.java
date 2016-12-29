package com.xing.leaveSystem.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xing.leaveSystem.entity.Audit;
import com.xing.leaveSystem.entity.MyTask;
import com.xing.leaveSystem.entity.PageBean;
import com.xing.leaveSystem.service.TaskAuditService;
import com.xing.leaveSystem.utils.MessageObj;
import com.xing.leaveSystem.utils.ResourceUtil;
import com.xing.leaveSystem.utils.ResultObj;

@Controller
@RequestMapping("/task")
public class TaskController {
	Logger logger=Logger.getLogger(TaskController.class);
	
	@Resource
	TaskService taskService;
	
	@Resource
	TaskAuditService taskAuditService;
	
	/***
	 * 
	 * @param page
	 * @param rows
	 * @param s_name  任务名称（通过该参数搜索）
	 * @param userId
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResultObj list(String  page,String rows,String s_name,String userId,int flag){
		ResultObj obj=new ResultObj();
		List<MyTask> taskList=new ArrayList<MyTask>();
		List<Task>  list=null;
		//判断搜索信息是否为空
		if(s_name==null){
			s_name="";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		String processDefinitionKey=ResourceUtil.getValue("diagram.leavesystem", "studentLeaveProcess");
		if(flag==1){
			list=taskService.createTaskQuery().
				//processDefinitionKey(processDefinitionKey).   //通过流程定义的key来查询
				taskAssignee(userId).           //通过用户id来查询
				taskNameLike("%"+s_name+"%").        //通过任务名来查询
				listPage(pageBean.getStart(), pageBean.getPageSize()); //返回带分页的结果集合
		}else{
			list=taskService.createTaskQuery().
				//processDefinitionKey(processDefinitionKey).   //通过流程定义的key来查询
				taskCandidateUser(userId).           //通过用户id来查询
				taskNameLike("%"+s_name+"%").        //通过任务名来查询
				listPage(pageBean.getStart(), pageBean.getPageSize()); //返回带分页的结果集合
		}
		
		try {
			for(Task task:list){
				MyTask myTask=new MyTask();
				BeanUtils.copyProperties(myTask, task);
				taskList.add(myTask);
			}
		} catch (Exception e) {
			logger.error("任务信息复制失败");
			e.printStackTrace();
		} 
		
		int total =list.size();
		obj.setRows(taskList);
		obj.setTotal(total);
		return obj;
	}
	
	/***
	 * 拾取并办理任务
	 * @param taskId
	 * @param userId
	 * @return
	 */
	@RequestMapping("/claimTask")
	@ResponseBody
	public MessageObj claimAndCompleteTask(String taskId,String userId){
		MessageObj obj=new MessageObj();
		//查看该用户的任务是否存在
		Task task=taskService.createTaskQuery()
				.taskId(taskId)
				.taskCandidateUser(userId)
				.singleResult();
		
		if(task!=null){//拾取组任务
			taskService.claim(taskId, userId);
			obj.setSuccess();
		}else{
			obj.setFail();
		}
		return  obj;
	}
	
	/**
	 * 完成审核任务
	 * @param userId
	 * @param taskId
	 * @return
	 */
	@RequestMapping("/completeTask")
	@ResponseBody
	public MessageObj completeTask(String userId,String taskId){
		MessageObj obj=new MessageObj();
		Task task=taskService.createTaskQuery().taskAssignee(userId).taskId(taskId).singleResult();
		if(task!=null){
			Map<String, Object> variables=new HashMap<String, Object>();
			variables.put("msg", "通过");
			variables.put("days", 7);
			taskService.complete(taskId,variables);
			obj.setSuccess();
		}else{
			obj.setFail();
		}
		return obj;
	}
	
	/**
	 * 保存审核信息
	 * @param audit
	 * @return
	 */
	@RequestMapping("/taskAuit")
	@ResponseBody
	public MessageObj taskAuit(Audit audit,HttpSession session,String taskId){
		MessageObj obj=new MessageObj();
		//获取当前登录人
		String userId=(String) session.getAttribute("userId");
		int resultTotal=taskAuditService.add(audit,userId,taskId);
		if(resultTotal>0){
			obj.setSuccess();
		}else{
			obj.setFail();
		}
		return obj;
	}
}
