package com.xing.leaveSystem.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xing.leaveSystem.entity.User;

public interface UserMapper {
	
	/**
	 * 根据用户名分页查询符合的用户信息
	 * @param map
	 * @return
	 */
	List<User> find(Map<String, Object> map);

	/**
	 * 获取分页查询的记录数
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
	User findByUserName(@Param("userName")String userName);

	/**
	 * 通过用户的id来删除普通用户的信息
	 * @param userId
	 */
	public void delete(@Param("userId")String userId);

	/**
	 * 通过用户id来获取用户信息
	 * @param userId
	 * @return
	 */
	User findUserById(@Param("userId")String userId);

	/**
	 * 通过用户名和密码来获取用户信息
	 * @param user
	 * @return
	 */
	User finUserByNameAndPwd(User user);

	/**
	 * 通过用户id和密码来判断用户是否存在
	 * @param user
	 * @return
	 */
	User findUserByIdAndPwd(User user);
	
}
