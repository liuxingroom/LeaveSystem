package com.xing.leaveSystem.dao;

import org.apache.ibatis.annotations.Param;

import com.xing.leaveSystem.entity.User;

public interface LoginUserMapper {
	/**
	 * 向登录用户表中添加数据
	 * @param user
	 * @return
	 */
	public int add(User user);

	/**
	 * 更新登录用户表
	 * @param user
	 * @return
	 */
	public int update(User user);

	/**
	 * 根据用户id来删除登录的用户信息
	 * @param userId
	 */
	public void delete(@Param("userId")String userId);

	/**
	 * 通过用户名和密码来获取用户信息
	 * @param user
	 * @return
	 */
	public User finUserByNameAndPwd(User user);
}
