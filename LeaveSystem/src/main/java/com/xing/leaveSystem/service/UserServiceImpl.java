package com.xing.leaveSystem.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.impl.persistence.entity.UserEntity;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xing.leaveSystem.dao.LoginUserMapper;
import com.xing.leaveSystem.dao.UserMapper;
import com.xing.leaveSystem.entity.User;
import com.xing.leaveSystem.utils.UUIDBuild;

@Service
public class UserServiceImpl implements UserService{
	Logger logger=Logger.getLogger(UserServiceImpl.class);
	
	@Resource
	UserMapper userMapper;
	
	@Resource
	LoginUserMapper loginUserMapper;
	
	@Resource
	IdentityService identityService;
	
	@Override
	public List<User> find(Map<String, Object> map) {
		List<User> userList=userMapper.find(map);
		return userList;
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		Long total=userMapper.getTotal(map);
		return total;
	}

	@Override
	public int add(User user) {
		//获取用户id
		UUIDBuild build=UUIDBuild.getInstance();
		String userId=build.generate();
		user.setUserId(userId);
		//向普通用户表中插入数据
		int resultTotal=userMapper.add(user);
		//向登录用户表中插入用户信息
		loginUserMapper.add(user);
		UserEntity entity=new UserEntity();
		try {
			if(identityService.createUserQuery().userId(user.getUserId()).singleResult()==null){//如果工作流系统中不存在改用户信息时
				BeanUtils.copyProperties(entity, user);
				entity.setId(user.getUserId());
				entity.setFirstName(user.getUserName());
				//向工作流框架中添加用户信息
				identityService.saveUser(entity);
			}
			
		} catch (Exception e) {
			logger.error("用户信息复制失败");
			e.printStackTrace();
		} 
		return resultTotal;
	}

	@Override
	public int update(User user) {
		//更新普通用户信息
		int resultTotal=userMapper.update(user);
		//更新登录用户信息
		loginUserMapper.update(user);
		UserEntity entity=new UserEntity();
		try {
			if(identityService.createUserQuery().userId(user.getUserId()).singleResult()!=null){//如果工作流系统中存在改用户信息
				BeanUtils.copyProperties(entity, user);
				entity.setId(user.getUserId());
				entity.setFirstName(user.getUserName());
				List<Group> groupList=identityService.createGroupQuery().groupMember(entity.getId()).list();
				if(groupList.size()>0){//如果该用户存在组关系
					for(int i=0;i<groupList.size();i++){
						//根据用户id和组id删除用户和组的关系
						identityService.deleteMembership(entity.getId(),groupList.get(i).getId());
					}
				}
				
				//删除工作流重用户的信息
				identityService.deleteUser(entity.getId());
				//添加工作流中用户的信息
				identityService.saveUser(entity);
			}
			
		} catch (Exception e) {
			logger.error("用户信息复制失败");
			e.printStackTrace();
		} 
		return resultTotal;
	}

	@Override
	public User findByUserName(String userName) {
		User user=userMapper.findByUserName(userName);
		return user;
	}
	
}
