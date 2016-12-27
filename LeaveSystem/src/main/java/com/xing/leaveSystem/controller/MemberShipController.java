package com.xing.leaveSystem.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xing.leaveSystem.entity.MemberShip;
import com.xing.leaveSystem.service.MemberShipService;
import com.xing.leaveSystem.utils.MessageObj;

@Controller
@RequestMapping("/memberShip")
public class MemberShipController {
	
	@Resource
	MemberShipService memberShipService;
	
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
		memberShipService.deleteAllGroupsByUserId(userId);
		String gIds[] =groupsIds.split(",");
		for(int i=0;i<gIds.length;i++){
			MemberShip memberShip=new MemberShip();
			memberShip.setUserId(userId);
			memberShip.setGroupId(gIds[i]);
			memberShipService.add(memberShip);
		}
		obj.setSuccess();
		return obj;
	}
	
	
}	
