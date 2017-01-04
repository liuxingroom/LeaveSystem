package com.xing.leaveSystem.controller;

import java.util.List;

import javax.annotation.Resource;

import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.Group;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xing.leaveSystem.entity.MemberShip;
import com.xing.leaveSystem.entity.User;
import com.xing.leaveSystem.service.LoginUserService;
import com.xing.leaveSystem.service.MemberShipService;
import com.xing.leaveSystem.service.UserService;
import com.xing.leaveSystem.utils.MessageObj;

@Controller
@RequestMapping("/memberShip")
public class MemberShipController {
	
	@Resource
	MemberShipService memberShipService;
	
	@Resource
	IdentityService identityService;
	
	@Resource
	UserService userService;
	
	@Resource
	LoginUserService loginUserService;
	
	/**
	 * 更新用户权限 先删除 后批量添加
	 * @param userId
	 * @param groupsIds
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public MessageObj update(String userId,String groupsIds){
		MessageObj obj=new MessageObj();
		User user=null;
		//删除本地数据库中用户和角色的关系
		memberShipService.deleteAllGroupsByUserId(userId);
		//查询工作流系统中该用户对应的角色信息
		List<Group> groupList=identityService.createGroupQuery().groupMember(userId).list();
		//删除该工作流系统中改用户和角色的关联关系
		for(int i=0;i<groupList.size();i++){
			identityService.deleteMembership(userId,groupList.get(i).getId() );
		}
		
		/**向用户系统和工作流系统中添加用户和角色的相关信息*/
		String gIds[] =groupsIds.split(",");
		for(int i=0;i<gIds.length;i++){
			MemberShip memberShip=new MemberShip();
			memberShip.setUserId(userId);
			memberShip.setGroupId(gIds[i]);
			memberShipService.add(memberShip);
			
			//删除工作流中用户角色的关联关系
//			identityService.deleteMembership(userId, gIds[i]);
			//添加工作流中用户角色的关联关系
			String groupId=gIds[i];
			identityService.createMembership(userId, gIds[i]);
		}
		/**更新用户表中groups字段信息*/
		//获取用户对象
		user=userService.findUserById(userId);
		//设置用户和角色的关系
		user.setGroups(groupsIds);
		//更新用户信息
		userService.update(user);
		//更新登录用户表中的信息
		loginUserService.update(user);
		
		obj.setSuccess();
		return obj;
	}
	
	
}	
