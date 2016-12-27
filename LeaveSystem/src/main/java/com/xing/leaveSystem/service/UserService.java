package com.xing.leaveSystem.service;

import java.util.List;
import java.util.Map;

import com.xing.leaveSystem.entity.User;

public interface UserService {

	/**
	 * 根据用户名分页查询符合的用户信息
	 * @param map
	 * @return
	 */
	List<User> find(Map<String, Object> map);

	/**
	 * 获取数据的记录数
	 * @param map
	 * @return
	 */
	Long getTotal(Map<String, Object> map);

	/**
	 * 添加用户信息
	 * @param user
	 * @return
	 */
	int add(User user);

	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	int update(User user);

	/**
	 * 通过用户名查找用户信息
	 * @param userName
	 * @return
	 */
	User findByUserName(String userName);

}
