package com.xing.leaveSystem.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Service;

import com.xing.leaveSystem.dao.LeaveMapper;
import com.xing.leaveSystem.entity.Leave;
import com.xing.leaveSystem.utils.CommonConstants;
import com.xing.leaveSystem.utils.MessageObj;
import com.xing.leaveSystem.utils.ResourceUtil;
import com.xing.leaveSystem.utils.UUIDBuild;

@Service
public class LeaveServiceImpl implements LeaveService{

	@Resource
	LeaveMapper leaveMapper;
	
	@Resource
	RuntimeService runtimeService;
	
	@Resource
	TaskService taskService;
	
	@Resource
	IdentityService identityService;
	
	@Override
	public int add(Leave leave ,String userId) {
		
		/**����Ĭ�ϵ������Ϣ*/
		leave.setCreateTime(new Date());
		String leaveId=UUIDBuild.getInstance().generate();
		leave.setLeaveId(leaveId);
		leave.setStatus(CommonConstants.NOT_SUBMIT);
				
		/**���������Ϣ*/
		leave.setUserId(userId);
		String processDefinitionKey=ResourceUtil.getValue("diagram.leavesystem", "studentLeaveProcess");
		
		//��������������
		identityService.setAuthenticatedUserId(userId);
		
		//����ȫ�����̱���
		Map<String, Object> variables=new  HashMap<String, Object>();
		variables.put("days", leave.getLeaveDays());
		
		//��������ʵ��  ͬʱ�������̱��������������
		ProcessInstance processinstance=runtimeService.startProcessInstanceByKey(processDefinitionKey, leaveId,variables);
		//����ٶ�������������ʵ��id
		leave.setProcessinstanceId(processinstance.getProcessInstanceId());
		int resultTotal=leaveMapper.add(leave);
		return resultTotal;
	}

	@Override
	public List<Leave> find(Map<String, Object> map) {
		List<Leave> leaveList=leaveMapper.list(map);
		return leaveList;
	}

	@Override
	public long getTotal(Map<String, Object> map) {
		long total=leaveMapper.getTotal(map);
		return total;
	}

	@Override
	public MessageObj startApply(String processinstanceId,String leaveId) {
		MessageObj obj=new MessageObj();
		
		Leave leave=leaveMapper.findById(leaveId);
		//��ѯ��������
		Task task=taskService.createTaskQuery()
				.processInstanceId(processinstanceId)
				.singleResult();
		
		if(task!=null){//������ڸ�����
			taskService.complete(task.getId());
			//�޸���ٵ�״̬
			leave.setStatus(CommonConstants.AUDIT);
			//������ٵ�
			leaveMapper.update(leave);
			obj.setSuccess();
		}else{
			obj.setFail();
		}
		return obj;
	}

	@Override
	public Leave findLeaveById(String leaveId) {
		Leave leave=leaveMapper.findById(leaveId);
		return leave;
	}
	
}
