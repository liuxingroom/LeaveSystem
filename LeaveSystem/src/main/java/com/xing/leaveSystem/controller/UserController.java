package com.xing.leaveSystem.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xing.leaveSystem.entity.PageBean;
import com.xing.leaveSystem.entity.User;
import com.xing.leaveSystem.service.UserService;
import com.xing.leaveSystem.utils.MessageObj;
import com.xing.leaveSystem.utils.ResultObj;
import com.xing.leaveSystem.utils.StringUtil;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	UserService userService;
	
	/***
	 * �û���¼
	 */
	@RequestMapping("/login")
	@ResponseBody
	public MessageObj login(){
		MessageObj result=new  MessageObj();
		result.setSuccess();
		return result;
	}
	
	/**
	 * 
	 * @param page  �ڼ�ҳ
	 * @param rows  ��������
	 * @param user  ��װ��ѯ������Javabean
	 * @return
	 */
	@RequestMapping("list")
	@ResponseBody
	public ResultObj list(String page,String rows,User user)throws Exception{
	    PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
	    /*��װ��ѯ����*/
	    Map<String, Object> map=new HashMap<String, Object>();
	    map.put("userName", StringUtil.formatLike(user.getUserName()));
	    map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		
		List<User> userList=userService.find(map);
		Long total=userService.getTotal(map);
		//�������ݸ�ʽ
		ResultObj resultObj=new ResultObj();
		resultObj.setRows(userList);
		resultObj.setTotal(total);
		return resultObj;
	}
	
	/**
	 * ��ӻ��޸��û�
	 * @param user  �û���Ϣ��װ��javabean
	 * @param flage �жϲ����ı��  ��1����Ϊ���  ��2��Ϊ����
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public MessageObj save(User user,Integer flag){
		MessageObj messageObj=new MessageObj();
		int resultTotal=0;
		if(flag==1){
			resultTotal=userService.add(user);
		}else{
			resultTotal=userService.update(user);
		}
		
		if(resultTotal>0){//��������ɹ�
			messageObj.setSuccess();
		}else{//�������ʧ��
			messageObj.setFail();
		}
		return messageObj;
	}
	
	/**
	 * �ж��û����Ƿ����(��֤�û�����Ψһ��)
	 * @param userName
	 * @return
	 */
	@RequestMapping("/existUserName")
	@ResponseBody
	public MessageObj existUserName(String userName){
		MessageObj obj=new MessageObj();
		if(userService.findByUserName(userName)==null){//�������������ʧ��
			obj.setFail();
		}else{//����������óɹ�
			obj.setSuccess();
		}
		
		return obj;
	}
}
