package com.xing.leaveSystem.service;

import java.util.Date;

import javax.annotation.Resource;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Service;

import com.xing.leaveSystem.dao.TaskAuditMapper;
import com.xing.leaveSystem.entity.Audit;
import com.xing.leaveSystem.utils.UUIDBuild;

@Service
public class TaskAuiditServiceImpl implements TaskAuditService{

	@Resource
	TaskAuditMapper taskAuditMapper;
	
	@Resource
	RuntimeService runtimeService;
	
	@Resource
	TaskService taskService;
	
	@Override
	public int add(Audit audit,String userId,String taskId) {
		String auditId=UUIDBuild.getInstance().generate();
		audit.setAuditId(auditId);
		audit.setCreateTime(new Date());
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
		String leaveId=instance.getActivityId();
		//设置请假单id
		audit.setLeaveId(leaveId);
		int resultTotal=taskAuditMapper.add(audit);
		return resultTotal;
	}
	
	
}
