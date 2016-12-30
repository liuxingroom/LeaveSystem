package com.xing.leaveSystem.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.activiti.engine.HistoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Task;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xing.leaveSystem.entity.Audit;
import com.xing.leaveSystem.entity.MyProcessInstance;
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
	
	@Resource
	HistoryService historyService;
	
	@Resource
	RuntimeService runtimeService;
	
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
		if(flag==1){//flag=1表示该任务已经拾取
			list=taskService.createTaskQuery().
				//processDefinitionKey(processDefinitionKey).   //通过流程定义的key来查询
				taskAssignee(userId).           //通过用户id来查询
				taskNameLike("%"+s_name+"%").        //通过任务名来查询
				listPage(pageBean.getStart(), pageBean.getPageSize()); //返回带分页的结果集合
		}else{//表示该任务还未拾取
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
	
	/**
	 * 查看历史任务
	 * @param userId
	 * @return
	 */
	@RequestMapping("/historyList")
	@ResponseBody
	public ResultObj historyList(String userId){
		ResultObj obj=new ResultObj();
		historyService.createHistoricTaskInstanceQuery();
		String processDefinitionKey=ResourceUtil.getValue("diagram.leavesystem", "studentLeaveProcess");
		return obj;
	}
	
	/**
	 *  查看当前运行的流程实例信息
	 *  
	 */
	@RequestMapping("/queryActivityLeave")
	@ResponseBody
	public ResultObj queryActivityLeave(){
		ResultObj obj=new ResultObj();
		//创建页显示的流程实例的集合
		List<MyProcessInstance> processInstances=new ArrayList<MyProcessInstance>();
		//获取流程定义的key
		String processDefinitionKey=ResourceUtil.getValue("diagram.leavesystem", "studentLeaveProcess");
		//获取流程实例查询对象
		ProcessInstanceQuery processInstanceQuery=runtimeService.createProcessInstanceQuery()
				.processDefinitionKey(processDefinitionKey)
				.orderByProcessInstanceId()
				.desc();
		//查询流程实例信息
		List<ProcessInstance> list=processInstanceQuery.list();
		
		//遍历流程实例对象封装流程实例信息并带到页面显示
		try {
			for(ProcessInstance instance:list){
				
				MyProcessInstance myProcessInstance=new MyProcessInstance();
				BeanUtils.copyProperties(myProcessInstance, instance);
				//获取流程实例创建时间
				Date startTime=historyService.createHistoricProcessInstanceQuery().processInstanceId(myProcessInstance.getProcessInstanceId()).singleResult().getStartTime();
				myProcessInstance.setName(instance.getName());
				myProcessInstance.setCreateTime(startTime);
				processInstances.add(myProcessInstance);
				
			}
		} catch (Exception e) {
			logger.error("流程实例信息复制失败");
			e.printStackTrace();
		} 
		int total=processInstances.size();
		obj.setRows(processInstances);
		obj.setTotal(total);
		return obj;
	}
}
