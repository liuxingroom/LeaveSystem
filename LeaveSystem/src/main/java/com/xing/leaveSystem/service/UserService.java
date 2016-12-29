package com.xing.leaveSystem.service;

import java.util.List;
import java.util.Map;

import com.xing.leaveSystem.entity.Group;
import com.xing.leaveSystem.entity.User;

public interface UserService {

	/**
	 * �����û�����ҳ��ѯ���ϵ��û���Ϣ
	 * @param map
	 * @return
	 */
	List<User> find(Map<String, Object> map);

	/**
	 * ��ȡ���ݵļ�¼��
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
	User findByUserName(String userName);

	/**
	 * �����û�id��ɾ���û���Ϣ
	 * @param string
	 */
    public void  delete(String userId);
    
    /**
     * ͨ���û�id����ȡ�û���Ϣ
     * @param userId
     * @return
     */
	User findUserById(String userId);

	/**
	 * ͨ���û����������ѯ�û���Ϣ
	 * @param user
	 * @return
	 */
	User finUserByNameAndPwd(User user);

	/**
	 * ͨ���û�id����ȡ����Ϣ
	 * @param userId
	 * @return
	 */
	List<Group> findGroupByUserId(String userId);

}
