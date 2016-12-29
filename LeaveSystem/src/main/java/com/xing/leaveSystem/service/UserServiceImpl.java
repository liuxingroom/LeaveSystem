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
	
	@Resource
	GroupService groupService;
	
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
			logger.error("添加时用户信息复制失败");
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
				//查询该用户下的所有角色信息
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
			logger.error("更新时用户信息复制失败");
			e.printStackTrace();
		} 
		return resultTotal;
	}

	@Override
	public User findByUserName(String userName) {
		User user=userMapper.findByUserName(userName);
		return user;
	}

	@Override
	public void delete(String userId) {
		//删除普通用户信息
		userMapper.delete(userId);
		//删除登录用户信息
		loginUserMapper.delete(userId);
		//删除工作流系统中的用户信息
		
		List<Group> groupList=identityService.createGroupQuery().groupMember(userId).list();
		if(groupList.size()>0){//如果该用户存在组关系
			for(int i=0;i<groupList.size();i++){
				//根据用户id和组id删除用户和组的关系
				identityService.deleteMembership(userId,groupList.get(i).getId());
			}
		}
		//删除工作流重用户的信息
		identityService.deleteUser(userId);
		
	}

	@Override
	public User findUserById(String userId) {
		User user=userMapper.findUserById(userId);
		return user;
	}

	@Override
	public User finUserByNameAndPwd(User user) {
		User user2=userMapper.finUserByNameAndPwd(user);
		return user2;
	}

	@Override
	public List<com.xing.leaveSystem.entity.Group> findGroupByUserId(
			String userId) {
		List<com.xing.leaveSystem.entity.Group> groups=groupService.findGroupByUserId(userId);
		return groups;
	}
	
}
