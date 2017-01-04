package com.xing.leaveSystem.dao;

import org.apache.ibatis.annotations.Param;

import com.xing.leaveSystem.entity.MemberShip;

public interface MemberShipMapper {

	/**
	 * 根据用户id来删除所有的角色信息
	 * @param userId
	 */
	public void deleteAllGroupsByUserId(@Param("userId")String userId);

	/**
	 * 添加用户和角色的关联关系
	 * @param memberShip
	 */
	public void add(MemberShip memberShip);

}
