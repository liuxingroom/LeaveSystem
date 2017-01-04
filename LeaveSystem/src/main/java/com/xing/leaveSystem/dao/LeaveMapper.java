package com.xing.leaveSystem.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xing.leaveSystem.entity.Leave;

public interface LeaveMapper {

	/**
	 * 添加请假信息
	 * @param leave
	 * @return
	 */
	int add(Leave leave);

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

	/**
	 * 通过请假id来获取请假信息
	 * @param leaveId
	 * @return
	 */
	Leave findById(@Param("leaveId")String leaveId);

	/**
	 * 更新请假单
	 * @param leave
	 */
	public void update(Leave leave);
	
	
}
