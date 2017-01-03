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
	 * 用户登录
	 */
	@RequestMapping("/login")
	@ResponseBody
	public MessageObj login(User user,String groupId,HttpSession session){
		MessageObj result=new  MessageObj();
		List<Group> groups=null;
		
		//用户记录组（角色）名
		String groupName="";
		//根据用户名和密码查询用户
		User users=userService.finUserByNameAndPwd(user);
		//判断该用户是否有该权限  如果有登录成功
		
		if(users!=null && StringUtils.isNotEmpty(users.getGroups()) && users.getGroups().contains(groupId)){
			StringBuffer buffer=new StringBuffer();
			result.setSuccess();
			groups=userService.findGroupByUserId(users.getUserId());
			for(Group group:groups){
				//拼接角色名
				buffer.append(group.getName()+",");
			}
			//设置角色信息
			session.setAttribute("groupName", buffer.toString());
			//设置用户已登录的标记
			session.setAttribute("userId", users.getUserId());
			
			//设置登录成功
			result.setSuccess();
			
		}else{//如果没有登录失败
			result.setFail();
		}
		return result;
	}
	
	/**
	 * 
	 * @param page  第几页
	 * @param rows  几条数据
	 * @param user  封装查询条件的Javabean
	 * @return
	 */
	@RequestMapping("list")
	@ResponseBody
	public ResultObj list(String page,String rows,User user)throws Exception{
	    PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
	    /*封装查询条件*/
	    Map<String, Object> map=new HashMap<String, Object>();
	    map.put("userName", StringUtil.formatLike(user.getUserName()));
	    map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		
		List<User> userList=userService.find(map);
		Long total=userService.getTotal(map);
		//设置数据格式
		ResultObj resultObj=new ResultObj();
		resultObj.setRows(userList);
		resultObj.setTotal(total);
		return resultObj;
	}
	
	/**
	 * 添加或修改用户
	 * @param user  用户信息封装的javabean
	 * @param flage 判断操作的标记  “1”：为添加  “2”为更新
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
		
		if(resultTotal>0){//如果操作成功
			messageObj.setSuccess();
		}else{//如果操作失败
			messageObj.setFail();
		}
		return messageObj;
	}
	
	/**
	 * 判断用户名是否存在(保证用户名的唯一性)
	 * @param userName
	 * @return
	 */
	@RequestMapping("/existUserName")
	@ResponseBody
	public MessageObj existUserName(String userName){
		MessageObj obj=new MessageObj();
		if(userService.findByUserName(userName)==null){//如果不存在设置失败
			obj.setFail();
		}else{//如果存在设置成功
			obj.setSuccess();
		}
		
		return obj;
	}
	
	/**
	 * 根据用户id来删除用户信息
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
	 * 分页查询用户角色信息
	 * @param page  当前页
	 * @param rows  当前页的记录数
	 * @param user  封装查询条件的bean
	 * @return
	 */
	@RequestMapping("/listWithGroups")
	@ResponseBody
	public ResultObj listWithGroups(String page,String rows,User user){
		ResultObj obj=new ResultObj();
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		//封装查询条件
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("userName",StringUtil.formatLike(user.getUserName())); // 查询用户名获取
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<User> userList=userService.find(map);
		for(User users:userList){
			StringBuffer  buffer=new StringBuffer();
			//根据用户id获取角色信息
			List<Group> groupList=groupService.findGroupByUserId(users.getUserId());
			for(Group group:groupList){//遍历角色信息
				buffer.append(group.getName()+",");
			}
			if(buffer.length()>0){//删除角色拼装后的逗号
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
	 * 退出登录
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
			//清除session信息
			session.invalidate();
			obj.setSuccess();
		}else{
			obj.setFail();
		}
		return obj;
	}
}
