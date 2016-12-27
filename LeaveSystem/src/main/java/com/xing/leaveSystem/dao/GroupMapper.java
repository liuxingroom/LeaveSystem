package com.xing.leaveSystem.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xing.leaveSystem.entity.Group;

public interface GroupMapper {

	/**
	 * 分页查询角色信息
	 * @param map
	 * @return
	 */
	List<Group> find(Map<String, Object> map);

	/**
	 * 获取角色信息的总记录数
	 * @param map
	 * @return
	 */
	Long getTotal(Map<String, Object> map);

	/**
	 * 添加角色信息
	 * @param group
	 * @return
	 */
	int add(Group group);

	/**
	 * 通过角色名查询角色信息
	 * @param groupName
	 * @return
	 */
	Group findByGroupName(@Param("groupName")String groupName);

	/**
	 * 更新角色信息
	 * @param group
	 * @return
	 */
	int update(Group group);

	/**
	 * 根据角色id来删除角色信息
	 * @param id
	 */
	public void delete(@Param("id")String id);

	/**
	 * 通过用户id来获取角色信息
	 * @param userId
	 * @return
	 */
	List<Group> findGroupByUserId(@Param("userId")String userId);

}
