package com.xing.leaveSystem.service;

import java.util.List;
import java.util.Map;

import com.xing.leaveSystem.entity.Leave;
import com.xing.leaveSystem.utils.MessageObj;

public interface LeaveService {

	/**
	 * ��������Ϣ
	 * @param leave  ��װ�����Ϣ��Javabean
 	 * @return
	 */
	int  add(Leave leave,String userId);

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
	 * �ύ���뵥
	 * @param processinstanceId
	 * @return
	 */
	public MessageObj startApply(String processinstanceId,String leaveId);

}
