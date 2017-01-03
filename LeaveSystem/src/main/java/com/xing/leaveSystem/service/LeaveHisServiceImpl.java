package com.xing.leaveSystem.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xing.leaveSystem.dao.LeaveHisMapper;

@Service
public class LeaveHisServiceImpl implements LeaveHisService{

	@Resource
	LeaveHisMapper leaveHisMapper;
	
	
}
