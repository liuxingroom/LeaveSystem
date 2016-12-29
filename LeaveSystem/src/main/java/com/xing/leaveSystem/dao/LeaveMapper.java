package com.xing.leaveSystem.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xing.leaveSystem.entity.Leave;

public interface LeaveMapper {

	/**
	 * ��������Ϣ
	 * @param leave
	 * @return
	 */
	int add(Leave leave);

	/**
	 * ��ҳ��ѯ�����Ϣ
	 * @param map
	 * @return
	 */
	List<Leave> list(Map<String, Object> map);

	/**
	 * ��ȡ��ٵļ�¼��
	 * @param map
	 * @return
	 */
	long getTotal(Map<String, Object> map);

	/**
	 * ͨ�����id����ȡ�����Ϣ
	 * @param leaveId
	 * @return
	 */
	Leave findById(@Param("leaveId")String leaveId);

	/**
	 * ������ٵ�
	 * @param leave
	 */
	public void update(Leave leave);
	
	
}
