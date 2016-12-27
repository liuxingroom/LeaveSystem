package com.xing.leaveSystem.service;

import com.xing.leaveSystem.entity.MemberShip;

public interface MemberShipService {
	
	/**
	 * 根据用户id删除该用户的所有角色的关联关系
	 * @param userId
	 */
	public void deleteAllGroupsByUserId(String userId);

	/**
	 * 添加用户角色的关联关系
	 * @param memberShip
	 */
	public void add(MemberShip memberShip);

}
