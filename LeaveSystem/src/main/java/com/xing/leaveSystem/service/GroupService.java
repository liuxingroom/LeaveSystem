package com.xing.leaveSystem.service;

import java.util.List;
import java.util.Map;

import com.xing.leaveSystem.entity.Group;

public interface GroupService {

	/**
	 * 分页查询角色信息
	 * @param map
	 * @return
	 */
	List<Group> find(Map<String, Object> map);

	/**
	 * 获取角色的总记录数
	 * @param map
	 * @return
	 */
	Long getTotal(Map<String, Object> map);

	/**
	 * 添加角色信息  
	 * 如果返回的数大于0  则操作成功  如果小于等于0  则操作不成功
	 * @param group
	 * @return
	 */
	int add(Group group);

	/**
	 * 修改角色信息
	 * 如果返回的数大于0  则操作成功  如果小于等于0  则操作不成功
	 * @param group
	 * @return
	 */
	int update(Group group);

	/**
	 * 根据角色名查看角色信息
	 * @param groupName
	 * @return
	 */
	Group findByGroupName(String groupName);

	/**
	 * 根据角色id来删除角色信息
	 * @param string
	 */
	public void delete(String id);

}
