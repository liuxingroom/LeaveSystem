package com.xing.leaveSystem.service;

import java.util.List;
import java.util.Map;

import com.xing.leaveSystem.entity.Leave;
import com.xing.leaveSystem.utils.MessageObj;

public interface LeaveHisService {

	/**
	 * 分页查询请假信息
	 * @param map
	 * @return
	 */
	List<Leave> find(Map<String, Object> map);

	/**
	 * 获取请假的记录数
	 * @param map
	 * @return
	 */
	long getTotal(Map<String, Object> map);

	/**
	 * 取消请假信息归档
	 * @param ids
	 * @return
	 */
	MessageObj pigeouthole(String ids);

	/**
	 * 将请假信息归档
	 * @param ids
	 * @return
	 */
	MessageObj pigeinhole(String ids);
}
