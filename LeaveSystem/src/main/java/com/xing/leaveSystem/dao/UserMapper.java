package com.xing.leaveSystem.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xing.leaveSystem.entity.User;

public interface UserMapper {
	
	/**
	 * �����û�����ҳ��ѯ���ϵ��û���Ϣ
	 * @param map
	 * @return
	 */
	List<User> find(Map<String, Object> map);

	/**
	 * ��ȡ��ҳ��ѯ�ļ�¼��
	 * @param map
	 * @return
	 */
	Long getTotal(Map<String, Object> map);
	
	/**
	 * ����û���Ϣ
	 * @param user
	 * @return
	 */
	int add(User user);

	/**
	 * �����û���Ϣ
	 * @param user
	 * @return
	 */
	int update(User user);

	/**
	 * ͨ���û��������û���Ϣ
	 * @param userName
	 * @return
	 */
	User findByUserName(@Param("userName")String userName);

	/**
	 * ͨ���û���id��ɾ����ͨ�û�����Ϣ
	 * @param userId
	 */
	public void delete(@Param("userId")String userId);

	/**
	 * ͨ���û�id����ȡ�û���Ϣ
	 * @param userId
	 * @return
	 */
	User findUserById(@Param("userId")String userId);

	/**
	 * ͨ���û�������������ȡ�û���Ϣ
	 * @param user
	 * @return
	 */
	User finUserByNameAndPwd(User user);

	/**
	 * ͨ���û�id���������ж��û��Ƿ����
	 * @param user
	 * @return
	 */
	User findUserByIdAndPwd(User user);
	
}
