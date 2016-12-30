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
	
	/**
	 * �����û�Ȩ�� ��ɾ�� ���������
	 * @param userId
	 * @param groupsIds
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public MessageObj update(String userId,String groupsIds){
		MessageObj obj=new MessageObj();
		User user=null;
		//ɾ���������ݿ����û��ͽ�ɫ�Ĺ�ϵ
		memberShipService.deleteAllGroupsByUserId(userId);
		//��ѯ������ϵͳ�и��û���Ӧ�Ľ�ɫ��Ϣ
		List<Group> groupList=identityService.createGroupQuery().groupMember(userId).list();
		//ɾ���ù�����ϵͳ�и��û��ͽ�ɫ�Ĺ�����ϵ
		for(int i=0;i<groupList.size();i++){
			identityService.deleteMembership(userId,groupList.get(i).getId() );
		}
		
		/**���û�ϵͳ�͹�����ϵͳ������û��ͽ�ɫ�������Ϣ*/
		String gIds[] =groupsIds.split(",");
		for(int i=0;i<gIds.length;i++){
			MemberShip memberShip=new MemberShip();
			memberShip.setUserId(userId);
			memberShip.setGroupId(gIds[i]);
			memberShipService.add(memberShip);
			
			//ɾ�����������û���ɫ�Ĺ�����ϵ
//			identityService.deleteMembership(userId, gIds[i]);
			//��ӹ��������û���ɫ�Ĺ�����ϵ
			String groupId=gIds[i];
			identityService.createMembership(userId, gIds[i]);
		}
		/**�����û�����groups�ֶ���Ϣ*/
		//��ȡ�û�����
		user=userService.findUserById(userId);
		user.setGroups(groupsIds);
		userService.update(user);
		
		obj.setSuccess();
		return obj;
	}
	
	
}	
