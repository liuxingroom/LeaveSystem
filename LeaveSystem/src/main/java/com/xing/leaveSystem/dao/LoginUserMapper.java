package com.xing.leaveSystem.dao;

import org.apache.ibatis.annotations.Param;

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

	/**
	 * �����û�id��ɾ����¼���û���Ϣ
	 * @param userId
	 */
	public void delete(@Param("userId")String userId);

	/**
	 * ͨ���û�������������ȡ�û���Ϣ
	 * @param user
	 * @return
	 */
	public User finUserByNameAndPwd(User user);
}
