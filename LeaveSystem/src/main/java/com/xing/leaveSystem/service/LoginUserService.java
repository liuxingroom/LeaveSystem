package com.xing.leaveSystem.service;

import com.xing.leaveSystem.entity.User;

public interface LoginUserService {

	/**
	 * 更新登录使用的用户表中的信息
	 * @param user
	 */
	public void update(User user);
	
	/**
	 * 通过用户名和密码查询用户信息
	 * @param user
	 * @return
	 */
	User finUserByNameAndPwd(User user);

}
