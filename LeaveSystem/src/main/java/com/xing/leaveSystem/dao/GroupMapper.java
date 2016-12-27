package com.xing.leaveSystem.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xing.leaveSystem.entity.Group;

public interface GroupMapper {

	/**
	 * ��ҳ��ѯ��ɫ��Ϣ
	 * @param map
	 * @return
	 */
	List<Group> find(Map<String, Object> map);

	/**
	 * ��ȡ��ɫ��Ϣ���ܼ�¼��
	 * @param map
	 * @return
	 */
	Long getTotal(Map<String, Object> map);

	/**
	 * ��ӽ�ɫ��Ϣ
	 * @param group
	 * @return
	 */
	int add(Group group);

	/**
	 * ͨ����ɫ����ѯ��ɫ��Ϣ
	 * @param groupName
	 * @return
	 */
	Group findByGroupName(@Param("groupName")String groupName);

	/**
	 * ���½�ɫ��Ϣ
	 * @param group
	 * @return
	 */
	int update(Group group);

	/**
	 * ���ݽ�ɫid��ɾ����ɫ��Ϣ
	 * @param id
	 */
	public void delete(@Param("id")String id);

	/**
	 * ͨ���û�id����ȡ��ɫ��Ϣ
	 * @param userId
	 * @return
	 */
	List<Group> findGroupByUserId(@Param("userId")String userId);

}
