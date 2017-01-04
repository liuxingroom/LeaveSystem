package com.xing.leaveSystem.service;

import java.util.List;
import java.util.Map;

import com.xing.leaveSystem.entity.Leave;
import com.xing.leaveSystem.utils.MessageObj;

public interface LeaveService {

	/**
	 * 添加请假信息
	 * @param leave  封装请加信息的Javabean
 	 * @return
	 */
	int  add(Leave leave,String userId);

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
	 * 提交申请单
	 * @param processinstanceId
	 * @return
	 */
	public MessageObj startApply(String processinstanceId,String leaveId);

	/**
	 * 获取请假信息
	 * @param leaveId
	 * @return
	 */
	Leave findLeaveById(String leaveId);


}
