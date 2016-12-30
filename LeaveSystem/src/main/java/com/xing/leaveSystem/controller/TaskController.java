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
	 * @param s_name  �������ƣ�ͨ���ò���������
	 * @param userId
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResultObj list(String  page,String rows,String s_name,String userId,int flag){
		ResultObj obj=new ResultObj();
		List<MyTask> taskList=new ArrayList<MyTask>();
		List<Task>  list=null;
		//�ж�������Ϣ�Ƿ�Ϊ��
		if(s_name==null){
			s_name="";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		String processDefinitionKey=ResourceUtil.getValue("diagram.leavesystem", "studentLeaveProcess");
		if(flag==1){//flag=1��ʾ�������Ѿ�ʰȡ
			list=taskService.createTaskQuery().
				//processDefinitionKey(processDefinitionKey).   //ͨ�����̶����key����ѯ
				taskAssignee(userId).           //ͨ���û�id����ѯ
				taskNameLike("%"+s_name+"%").        //ͨ������������ѯ
				listPage(pageBean.getStart(), pageBean.getPageSize()); //���ش���ҳ�Ľ������
		}else{//��ʾ������δʰȡ
			list=taskService.createTaskQuery().
				//processDefinitionKey(processDefinitionKey).   //ͨ�����̶����key����ѯ
				taskCandidateUser(userId).           //ͨ���û�id����ѯ
				taskNameLike("%"+s_name+"%").        //ͨ������������ѯ
				listPage(pageBean.getStart(), pageBean.getPageSize()); //���ش���ҳ�Ľ������
		}
		
		try {
			for(Task task:list){
				MyTask myTask=new MyTask();
				BeanUtils.copyProperties(myTask, task);
				taskList.add(myTask);
			}
		} catch (Exception e) {
			logger.error("������Ϣ����ʧ��");
			e.printStackTrace();
		} 
		
		int total =list.size();
		obj.setRows(taskList);
		obj.setTotal(total);
		return obj;
	}
	
	/***
	 * ʰȡ����������
	 * @param taskId
	 * @param userId
	 * @return
	 */
	@RequestMapping("/claimTask")
	@ResponseBody
	public MessageObj claimAndCompleteTask(String taskId,String userId){
		MessageObj obj=new MessageObj();
		//�鿴���û��������Ƿ����
		Task task=taskService.createTaskQuery()
				.taskId(taskId)
				.taskCandidateUser(userId)
				.singleResult();
		
		if(task!=null){//ʰȡ������
			taskService.claim(taskId, userId);
			obj.setSuccess();
		}else{
			obj.setFail();
		}
		return  obj;
	}
	
	/**
	 * ����������
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
			variables.put("msg", "ͨ��");
			taskService.complete(taskId,variables);
			obj.setSuccess();
		}else{
			obj.setFail();
		}
		return obj;
	}
	
	/**
	 * ���������Ϣ
	 * @param audit
	 * @return
	 */
	@RequestMapping("/taskAuit")
	@ResponseBody
	public MessageObj taskAuit(Audit audit,HttpSession session,String taskId){
		MessageObj obj=new MessageObj();
		//��ȡ��ǰ��¼��
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
	 * �鿴��ʷ����
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
	 *  �鿴��ǰ���е�����ʵ����Ϣ
	 *  
	 */
	@RequestMapping("/queryActivityLeave")
	@ResponseBody
	public ResultObj queryActivityLeave(){
		ResultObj obj=new ResultObj();
		//����ҳ��ʾ������ʵ���ļ���
		List<MyProcessInstance> processInstances=new ArrayList<MyProcessInstance>();
		//��ȡ���̶����key
		String processDefinitionKey=ResourceUtil.getValue("diagram.leavesystem", "studentLeaveProcess");
		//��ȡ����ʵ����ѯ����
		ProcessInstanceQuery processInstanceQuery=runtimeService.createProcessInstanceQuery()
				.processDefinitionKey(processDefinitionKey)
				.orderByProcessInstanceId()
				.desc();
		//��ѯ����ʵ����Ϣ
		List<ProcessInstance> list=processInstanceQuery.list();
		
		//��������ʵ�������װ����ʵ����Ϣ������ҳ����ʾ
		try {
			for(ProcessInstance instance:list){
				
				MyProcessInstance myProcessInstance=new MyProcessInstance();
				BeanUtils.copyProperties(myProcessInstance, instance);
				//��ȡ����ʵ������ʱ��
				Date startTime=historyService.createHistoricProcessInstanceQuery().processInstanceId(myProcessInstance.getProcessInstanceId()).singleResult().getStartTime();
				myProcessInstance.setName(instance.getName());
				myProcessInstance.setCreateTime(startTime);
				processInstances.add(myProcessInstance);
				
			}
		} catch (Exception e) {
			logger.error("����ʵ����Ϣ����ʧ��");
			e.printStackTrace();
		} 
		int total=processInstances.size();
		obj.setRows(processInstances);
		obj.setTotal(total);
		return obj;
	}
}
