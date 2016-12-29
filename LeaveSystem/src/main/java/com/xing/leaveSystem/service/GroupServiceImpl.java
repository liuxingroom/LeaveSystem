package com.xing.leaveSystem.service;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.User;
import org.activiti.engine.impl.persistence.entity.GroupEntity;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xing.leaveSystem.dao.GroupMapper;
import com.xing.leaveSystem.entity.Group;
import com.xing.leaveSystem.utils.UUIDBuild;

@Service
public class GroupServiceImpl implements GroupService{
	
	Logger logger=Logger.getLogger(GroupServiceImpl.class);
	
	@Resource
	GroupMapper groupMapper;
	
	@Resource
	IdentityService identityService;

	@Override
	public List<Group> find(Map<String, Object> map) {
		List<Group> groups=groupMapper.find(map);
		return groups;
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		Long total=groupMapper.getTotal(map);
		return total;
	}

	@Override
	public int add(Group group) {
		//���ɽ�ɫid
		/*String id=UUIDBuild.getInstance().generate();
		group.setId(id);*/
		int resultTotal=groupMapper.add(group);
		GroupEntity entity=new GroupEntity();
		try {
			if(identityService.createGroupQuery().groupId(group.getId()).singleResult()==null){//�������������Ϣ    �򱣴��ɫ��Ϣ
				BeanUtils.copyProperties(entity, group);
				identityService.saveGroup(entity);
			}
			
		} catch (Exception e) {
			logger.error("���ʱ��ɫ��Ϣ����ʧ��");
			e.printStackTrace();
		}
		return resultTotal;
	}

	@Override
	public int update(Group group) {
		//���½�ɫ��Ϣ
		int resultTotal=groupMapper.update(group);
		GroupEntity entity=new GroupEntity();
		try {
			if(identityService.createGroupQuery().groupId(group.getId()).singleResult()!=null){
				BeanUtils.copyProperties(entity, group);
				//��ѯ�ý�ɫ�µ������û���Ϣ
				List<User> userList=identityService.createUserQuery().memberOfGroup(entity.getId()).list();
				if(userList.size()>0){//����ý�ɫ�����û���Ϣ
					for(int i=0;i<userList.size();i++){
						//�����û�id�ͽ�ɫidɾ���û��ͽ�ɫ�Ĺ�����ϵ
						identityService.deleteMembership(userList.get(i).getId(), entity.getId());
					}
				}
				
				//ɾ��������ϵͳ�н�ɫ����Ϣ
				identityService.deleteGroup(entity.getId());
				//��ӹ�����ϵͳ�н�ɫ����Ϣ
				identityService.saveGroup(entity);
				
			}
		} catch (Exception e) {
			logger.error("����ʱ��ɫ��Ϣ����ʧ��");
			e.printStackTrace();
		} 
		
		return resultTotal;
	}

	@Override
	public Group findByGroupName(String groupName) {
		Group group=groupMapper.findByGroupName(groupName);
		return group;
	}

	@Override
	public void delete(String id) {
		//ɾ����ɫ���еĽ�ɫ��Ϣ
		groupMapper.delete(id);
		
		if(identityService.createGroupQuery().groupId(id).singleResult()!=null){//������ڸ�����Ϣ
			List<User> userList=identityService.createUserQuery().memberOfGroup(id).list();
			if(userList.size()>0){//����ý�ɫ  �����û���Ϣ
				for(int i=0;i<userList.size();i++){
					//�����û�id �ͽ�ɫid ��ɾ���û��ͽ�ɫ�Ĺ�����ϵ
					identityService.deleteMembership(userList.get(i).getId(), id);
				}
			}
		}
		
		//ɾ��������ϵͳ�еĽ�ɫ��Ϣ
		identityService.deleteGroup(id);
	}

	@Override
	public List<Group> findGroupByUserId(String userId) {
		List<Group> groupList=groupMapper.findGroupByUserId(userId);
		return groupList;
	}

	@Override
	public Group finGroupById(String id) {
		Group group=groupMapper.finGroupById(id);
		return group;
	}
	
	
}
