package com.xing.leaveSystem.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.activiti.engine.HistoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Service;

import com.xing.leaveSystem.dao.TaskAuditMapper;
import com.xing.leaveSystem.entity.Audit;
import com.xing.leaveSystem.entity.User;
import com.xing.leaveSystem.utils.UUIDBuild;

@Service
public class TaskAuiditServiceImpl implements TaskAuditService{

	@Resource
	TaskAuditMapper taskAuditMapper;
	
	@Resource
	RuntimeService runtimeService;
	
	@Resource
	TaskService taskService;
	
	@Resource
	UserService userService;
	
	@Resource
	HistoryService historyService;
	
	
	@Override
	public int add(Audit audit,String userId,String taskId) {
		String auditId=UUIDBuild.getInstance().generate();
		audit.setAuditId(auditId);
		audit.setCreateTime(new Date());
		audit.setTaskId(taskId);
		//设置审核人
		audit.setUserId(userId);
		//设置所对应的请假信息
		//获取请假任务
		Task task=taskService.createTaskQuery().taskId(taskId).singleResult();
		//获取流程实例id
		String processInstanceId=task.getProcessInstanceId();
		//获取流程实例信息
		ProcessInstance instance=runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
		//获取请假单id
		String leaveId=instance.getBusinessKey();
		//设置请假单id
		audit.setLeaveId(leaveId);
		int resultTotal=taskAuditMapper.add(audit);
		return resultTotal;
	}

	@Override
	public List<Audit> findAduitMessageByLeaveId(String leaveId) {
		List<Audit> auditList=taskAuditMapper.findAduitMessageByLeaveId(leaveId);
		for(Audit audit:auditList){
			User user=userService.findUserById(audit.getUserId());
			//查询历史流程实例
			HistoricTaskInstance historicTaskInstance=historyService.createHistoricTaskInstanceQuery()
					.taskId(audit.getTaskId())
					.singleResult();
			audit.setTaskName(historicTaskInstance.getName());
			audit.setUserName(user.getUserName());
		}
		return auditList;
	}

	@Override
	public Audit findAduitMessageByTaskId(String taskId) {
		Audit audit=taskAuditMapper.findAduitMessageByTaskId(taskId);
		return audit;
	}
	
	
}
