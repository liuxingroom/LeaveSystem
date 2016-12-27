package com.xing.leaveSystem.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xing.leaveSystem.dao.MemberShipMapper;
import com.xing.leaveSystem.entity.MemberShip;

@Service
public class MemberShipServiceImpl implements MemberShipService{
	
	@Resource
	MemberShipMapper memberShipMapper;

	@Override
	public void deleteAllGroupsByUserId(String userId) {
		memberShipMapper.deleteAllGroupsByUserId(userId);
	}

	@Override
	public void add(MemberShip memberShip) {
		memberShipMapper.add(memberShip);
	}
	
	
}
