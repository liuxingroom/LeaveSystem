package com.xing.leaveSystem.service;

import com.xing.leaveSystem.entity.Audit;

public interface TaskAuditService {

	/**
	 * ÃÌº”…Û∫À–≈œ¢
	 * @param audit
	 * @return
	 */
	int add(Audit audit,String userId,String taskId);

}
