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
		//���������
		audit.setUserId(userId);
		//��������Ӧ�������Ϣ
		//��ȡ�������
		Task task=taskService.createTaskQuery().taskId(taskId).singleResult();
		//��ȡ����ʵ��id
		String processInstanceId=task.getProcessInstanceId();
		//��ȡ����ʵ����Ϣ
		ProcessInstance instance=runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
		//��ȡ��ٵ�id
		String leaveId=instance.getActivityId();
		//������ٵ�id
		audit.setLeaveId(leaveId);
		int resultTotal=taskAuditMapper.add(audit);
		return resultTotal;
	}
	
	
}
