package com.xing.leaveSystem.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xing.leaveSystem.entity.Group;
import com.xing.leaveSystem.entity.PageBean;
import com.xing.leaveSystem.entity.User;
import com.xing.leaveSystem.service.GroupService;
import com.xing.leaveSystem.service.UserService;
import com.xing.leaveSystem.utils.MessageObj;
import com.xing.leaveSystem.utils.ResultObj;
import com.xing.leaveSystem.utils.StringUtil;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	UserService userService;
	
	@Resource
	GroupService groupService;
	
	/***
	 * �û���¼
	 */
	@RequestMapping("/login")
	@ResponseBody
	public MessageObj login(User user,String groupId,HttpSession session){
		MessageObj result=new  MessageObj();
		List<Group> groups=null;
		
		//�û���¼�飨��ɫ����
		String groupName="";
		//�����û����������ѯ�û�
		User users=userService.finUserByNameAndPwd(user);
		//�жϸ��û��Ƿ��и�Ȩ��  ����е�¼�ɹ�
		
		if(users!=null && StringUtils.isNotEmpty(users.getGroups()) && users.getGroups().contains(groupId)){
			StringBuffer buffer=new StringBuffer();
			result.setSuccess();
			groups=userService.findGroupByUserId(users.getUserId());
			for(Group group:groups){
				//ƴ�ӽ�ɫ��
				buffer.append(group.getName()+",");
			}
			//���ý�ɫ��Ϣ
			session.setAttribute("groupName", buffer.toString());
			//�����û��ѵ�¼�ı��
			session.setAttribute("userId", users.getUserId());
			
			//���õ�¼�ɹ�
			result.setSuccess();
			
		}else{//���û�е�¼ʧ��
			result.setFail();
		}
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
	
	/**
	 * �����û�id��ɾ���û���Ϣ
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public MessageObj delete(String ids){
		MessageObj obj=new MessageObj();
		String [] id=ids.split(",");
		for(int i=0;i<id.length;i++){
			 userService.delete(id[i]);
		}
		obj.setSuccess();
		return obj;
	}
	
	/**
	 * ��ҳ��ѯ�û���ɫ��Ϣ
	 * @param page  ��ǰҳ
	 * @param rows  ��ǰҳ�ļ�¼��
	 * @param user  ��װ��ѯ������bean
	 * @return
	 */
	@RequestMapping("/listWithGroups")
	@ResponseBody
	public ResultObj listWithGroups(String page,String rows,User user){
		ResultObj obj=new ResultObj();
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		//��װ��ѯ����
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("userName",StringUtil.formatLike(user.getUserName())); // ��ѯ�û�����ȡ
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<User> userList=userService.find(map);
		for(User users:userList){
			StringBuffer  buffer=new StringBuffer();
			//�����û�id��ȡ��ɫ��Ϣ
			List<Group> groupList=groupService.findGroupByUserId(users.getUserId());
			for(Group group:groupList){//������ɫ��Ϣ
				buffer.append(group.getName()+",");
			}
			if(buffer.length()>0){//ɾ����ɫƴװ��Ķ���
				users.setGroups(buffer.deleteCharAt(buffer.length()-1).toString());
			}else{
				users.setGroups(buffer.toString());
			}
		}
		Long total=userService.getTotal(map);
		obj.setRows(userList);
		obj.setTotal(total);
		return obj;
	}
	
	/***
	 * �˳���¼
	 * @param session
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/logout")
	@ResponseBody
	public MessageObj logout(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException{
		MessageObj obj=new MessageObj();
		System.out.println(session.getAttribute("userId"));
		if(StringUtils.isNotEmpty((String) session.getAttribute("userId"))){
			//���session��Ϣ
			session.invalidate();
			obj.setSuccess();
		}else{
			obj.setFail();
		}
		return obj;
	}
}
