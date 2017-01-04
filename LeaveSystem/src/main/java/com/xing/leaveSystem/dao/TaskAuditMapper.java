package com.xing.leaveSystem.dao;

import java.util.List;

import com.xing.leaveSystem.entity.Audit;

public interface TaskAuditMapper {

	/**
	 * 添加审核信息
	 * @param audit
	 * @return
	 */
	int add(Audit audit);

	/**
	 * 通过请假单id来获取审核信息
	 * @param leaveId
	 * @param model
	 * @return
	 */
	List<Audit> findAduitMessageByLeaveId(String leaveId);

	

}
