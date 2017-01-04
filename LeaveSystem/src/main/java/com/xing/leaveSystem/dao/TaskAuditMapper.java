package com.xing.leaveSystem.dao;

import com.xing.leaveSystem.entity.Audit;

public interface TaskAuditMapper {

	/**
	 * 添加审核信息
	 * @param audit
	 * @return
	 */
	int add(Audit audit);

}
