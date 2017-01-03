package com.xing.leaveSystem.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xing.leaveSystem.dao.LoginUserMapper;
import com.xing.leaveSystem.entity.User;

@Service
public class LoginUserServiceImpl implements LoginUserService{

	@Resource
	LoginUserMapper loginUserMapper;
	
	@Override
	public void update(User user) {
		loginUserMapper.update(user);
	}

	@Override
	public User finUserByNameAndPwd(User user) {
		User user2=loginUserMapper.finUserByNameAndPwd(user);
		return user2;
	}
}
