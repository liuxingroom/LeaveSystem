package com.xing.leaveSystem.dao;

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
}
