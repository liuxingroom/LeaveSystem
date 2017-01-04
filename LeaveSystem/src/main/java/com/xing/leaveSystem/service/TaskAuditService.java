package com.xing.leaveSystem.service;

import java.util.List;

import com.xing.leaveSystem.entity.Audit;

public interface TaskAuditService {

	/**
	 * 添加审核信息
	 * @param audit
	 * @return
	 */
	int add(Audit audit,String userId,String taskId);

	/**
	 * 通过请假单id来获取审核信息
	 * @param leaveId
	 * @param model
	 * @return
	 */
	List<Audit> findAduitMessageByLeaveId(String leaveId);

}
