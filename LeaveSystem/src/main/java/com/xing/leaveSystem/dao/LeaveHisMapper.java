package com.xing.leaveSystem.dao;

import java.util.List;
import java.util.Map;

import com.xing.leaveSystem.entity.Leave;

public interface LeaveHisMapper {

	/**
	 * 分页查询请假信息
	 * @param map
	 * @return
	 */
	List<Leave> list(Map<String, Object> map);

	/**
	 * 获取请假的记录数
	 * @param map
	 * @return
	 */
	long getTotal(Map<String, Object> map);
}
