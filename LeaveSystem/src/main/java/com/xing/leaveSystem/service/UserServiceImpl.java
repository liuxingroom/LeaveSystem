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
		//��ȡ�û�id
		UUIDBuild build=UUIDBuild.getInstance();
		String userId=build.generate();
		user.setUserId(userId);
		//����ͨ�û����в�������
		int resultTotal=userMapper.add(user);
		//���¼�û����в����û���Ϣ
		loginUserMapper.add(user);
		UserEntity entity=new UserEntity();
		try {
			if(identityService.createUserQuery().userId(user.getUserId()).singleResult()==null){//���������ϵͳ�в����ڸ��û���Ϣʱ
				BeanUtils.copyProperties(entity, user);
				entity.setId(user.getUserId());
				entity.setFirstName(user.getUserName());
				//���������������û���Ϣ
				identityService.saveUser(entity);
			}
			
		} catch (Exception e) {
			logger.error("�û���Ϣ����ʧ��");
			e.printStackTrace();
		} 
		return resultTotal;
	}

	@Override
	public int update(User user) {
		//������ͨ�û���Ϣ
		int resultTotal=userMapper.update(user);
		//���µ�¼�û���Ϣ
		loginUserMapper.update(user);
		UserEntity entity=new UserEntity();
		try {
			if(identityService.createUserQuery().userId(user.getUserId()).singleResult()!=null){//���������ϵͳ�д��ڸ��û���Ϣ
				BeanUtils.copyProperties(entity, user);
				entity.setId(user.getUserId());
				entity.setFirstName(user.getUserName());
				List<Group> groupList=identityService.createGroupQuery().groupMember(entity.getId()).list();
				if(groupList.size()>0){//������û��������ϵ
					for(int i=0;i<groupList.size();i++){
						//�����û�id����idɾ���û�����Ĺ�ϵ
						identityService.deleteMembership(entity.getId(),groupList.get(i).getId());
					}
				}
				
				//ɾ�����������û�����Ϣ
				identityService.deleteUser(entity.getId());
				//��ӹ��������û�����Ϣ
				identityService.saveUser(entity);
			}
			
		} catch (Exception e) {
			logger.error("�û���Ϣ����ʧ��");
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
