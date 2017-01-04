package com.xing.leaveSystem.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xing.leaveSystem.dao.LeaveHisMapper;
import com.xing.leaveSystem.entity.Leave;
import com.xing.leaveSystem.utils.MessageObj;

@Service
public class LeaveHisServiceImpl implements LeaveHisService{

	@Resource
	LeaveHisMapper leaveHisMapper;
	
	@Override
	public List<Leave> find(Map<String, Object> map) {
		List<Leave> leaveList=leaveHisMapper.list(map);
		return leaveList;
	}

	@Override
	public long getTotal(Map<String, Object> map) {
		long total=leaveHisMapper.getTotal(map);
		return total;
	}

	@Override
	public MessageObj pigeinhole(String ids) {
		
		return null;
	}
	
	@Override
	public MessageObj pigeouthole(String ids) {
		
		
		return null;
	}
}
