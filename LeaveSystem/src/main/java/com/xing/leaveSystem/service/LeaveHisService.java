package com.xing.leaveSystem.service;

import java.util.List;
import java.util.Map;

import com.xing.leaveSystem.entity.Leave;
import com.xing.leaveSystem.utils.MessageObj;

public interface LeaveHisService {

	/**
	 * ��ҳ��ѯ�����Ϣ
	 * @param map
	 * @return
	 */
	List<Leave> find(Map<String, Object> map);

	/**
	 * ��ȡ��ٵļ�¼��
	 * @param map
	 * @return
	 */
	long getTotal(Map<String, Object> map);

	/**
	 * ȡ�������Ϣ�鵵
	 * @param ids
	 * @return
	 */
	MessageObj pigeouthole(String ids);

	/**
	 * �������Ϣ�鵵
	 * @param ids
	 * @return
	 */
	MessageObj pigeinhole(String ids);
}
