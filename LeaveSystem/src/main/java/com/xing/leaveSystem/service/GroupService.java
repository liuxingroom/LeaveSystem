package com.xing.leaveSystem.service;

import java.util.List;
import java.util.Map;

import com.xing.leaveSystem.entity.Group;

public interface GroupService {

	/**
	 * ��ҳ��ѯ��ɫ��Ϣ
	 * @param map
	 * @return
	 */
	List<Group> find(Map<String, Object> map);

	/**
	 * ��ȡ��ɫ���ܼ�¼��
	 * @param map
	 * @return
	 */
	Long getTotal(Map<String, Object> map);

	/**
	 * ��ӽ�ɫ��Ϣ  
	 * ������ص�������0  ������ɹ�  ���С�ڵ���0  ��������ɹ�
	 * @param group
	 * @return
	 */
	int add(Group group);

	/**
	 * �޸Ľ�ɫ��Ϣ
	 * ������ص�������0  ������ɹ�  ���С�ڵ���0  ��������ɹ�
	 * @param group
	 * @return
	 */
	int update(Group group);

	/**
	 * ���ݽ�ɫ���鿴��ɫ��Ϣ
	 * @param groupName
	 * @return
	 */
	Group findByGroupName(String groupName);

	/**
	 * ���ݽ�ɫid��ɾ����ɫ��Ϣ
	 * @param string
	 */
	public void delete(String id);

}
