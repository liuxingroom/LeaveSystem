package com.xing.leaveSystem.dao;

import java.util.List;
import java.util.Map;

import com.xing.leaveSystem.entity.Leave;

public interface LeaveHisMapper {

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
}
