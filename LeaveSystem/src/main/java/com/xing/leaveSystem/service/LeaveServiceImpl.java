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
		
		/**设置默认的请假信息*/
		leave.setCreateTime(new Date());
		String leaveId=UUIDBuild.getInstance().generate();
		leave.setLeaveId(leaveId);
		leave.setStatus(CommonConstants.NOT_SUBMIT);
				
		/**完善请假信息*/
		leave.setUserId(userId);
		String processDefinitionKey=ResourceUtil.getValue("diagram.leavesystem", "studentLeaveProcess");
		
		//设置流程启动人
		identityService.setAuthenticatedUserId(userId);
		
		//设置全局流程变量
		Map<String, Object> variables=new  HashMap<String, Object>();
		variables.put("days", leave.getLeaveDays());
		
		//启动流程实例  同时设置流程变量（请假天数）
		ProcessInstance processinstance=runtimeService.startProcessInstanceByKey(processDefinitionKey, leaveId,variables);
		//向请假对象中设置流程实例id
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
		//查询代办任务
		Task task=taskService.createTaskQuery()
				.processInstanceId(processinstanceId)
				.singleResult();
		
		if(task!=null){//如果存在改任务
			taskService.complete(task.getId());
			//修改请假单状态
			leave.setStatus(CommonConstants.AUDIT);
			//更新请假单
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
