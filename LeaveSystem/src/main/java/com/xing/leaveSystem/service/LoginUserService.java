package com.xing.leaveSystem.service;

import com.xing.leaveSystem.entity.User;

public interface LoginUserService {

	/**
	 * ���µ�¼ʹ�õ��û����е���Ϣ
	 * @param user
	 */
	public void update(User user);
	
	/**
	 * ͨ���û����������ѯ�û���Ϣ
	 * @param user
	 * @return
	 */
	User finUserByNameAndPwd(User user);

}
