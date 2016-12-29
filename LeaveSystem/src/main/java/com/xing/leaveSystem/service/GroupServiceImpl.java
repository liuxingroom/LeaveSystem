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
		//生成角色id
		/*String id=UUIDBuild.getInstance().generate();
		group.setId(id);*/
		int resultTotal=groupMapper.add(group);
		GroupEntity entity=new GroupEntity();
		try {
			if(identityService.createGroupQuery().groupId(group.getId()).singleResult()==null){//如果不存在组信息    则保存角色信息
				BeanUtils.copyProperties(entity, group);
				identityService.saveGroup(entity);
			}
			
		} catch (Exception e) {
			logger.error("添加时角色信息复制失败");
			e.printStackTrace();
		}
		return resultTotal;
	}

	@Override
	public int update(Group group) {
		//更新角色信息
		int resultTotal=groupMapper.update(group);
		GroupEntity entity=new GroupEntity();
		try {
			if(identityService.createGroupQuery().groupId(group.getId()).singleResult()!=null){
				BeanUtils.copyProperties(entity, group);
				//查询该角色下的所有用户信息
				List<User> userList=identityService.createUserQuery().memberOfGroup(entity.getId()).list();
				if(userList.size()>0){//如果该角色含有用户信息
					for(int i=0;i<userList.size();i++){
						//根据用户id和角色id删除用户和角色的关联关系
						identityService.deleteMembership(userList.get(i).getId(), entity.getId());
					}
				}
				
				//删除工作流系统中角色的信息
				identityService.deleteGroup(entity.getId());
				//添加工作流系统中角色的信息
				identityService.saveGroup(entity);
				
			}
		} catch (Exception e) {
			logger.error("更新时角色信息复制失败");
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
		//删除角色表中的角色信息
		groupMapper.delete(id);
		
		if(identityService.createGroupQuery().groupId(id).singleResult()!=null){//如果存在改组信息
			List<User> userList=identityService.createUserQuery().memberOfGroup(id).list();
			if(userList.size()>0){//如果该角色  含有用户信息
				for(int i=0;i<userList.size();i++){
					//根据用户id 和角色id 来删除用户和角色的关联关系
					identityService.deleteMembership(userList.get(i).getId(), id);
				}
			}
		}
		
		//删除工作流系统中的角色信息
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
