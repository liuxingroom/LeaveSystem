package com.xing.leaveSystem.service;

import com.xing.leaveSystem.entity.MemberShip;

public interface MemberShipService {
	
	/**
	 * �����û�idɾ�����û������н�ɫ�Ĺ�����ϵ
	 * @param userId
	 */
	public void deleteAllGroupsByUserId(String userId);

	/**
	 * ����û���ɫ�Ĺ�����ϵ
	 * @param memberShip
	 */
	public void add(MemberShip memberShip);

}
