package com.xing.leaveSystem.service;

import com.xing.leaveSystem.entity.Audit;

public interface TaskAuditService {

	/**
	 * 添加审核信息
	 * @param audit
	 * @return
	 */
	int add(Audit audit,String userId,String taskId);

}
