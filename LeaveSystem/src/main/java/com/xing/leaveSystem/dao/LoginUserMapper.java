package com.xing.leaveSystem.dao;

import com.xing.leaveSystem.entity.User;

public interface LoginUserMapper {
	/**
	 * ���¼�û������������
	 * @param user
	 * @return
	 */
	public int add(User user);

	/**
	 * ���µ�¼�û���
	 * @param user
	 * @return
	 */
	public int update(User user);
}
