package com.xing.leaveSystem.dao;

import org.apache.ibatis.annotations.Param;

import com.xing.leaveSystem.entity.MemberShip;

public interface MemberShipMapper {

	/**
	 * �����û�id��ɾ�����еĽ�ɫ��Ϣ
	 * @param userId
	 */
	public void deleteAllGroupsByUserId(@Param("userId")String userId);

	/**
	 * ����û��ͽ�ɫ�Ĺ�����ϵ
	 * @param memberShip
	 */
	public void add(MemberShip memberShip);

}
