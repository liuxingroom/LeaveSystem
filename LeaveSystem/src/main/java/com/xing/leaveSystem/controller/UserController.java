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
	 * 用户登录
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
}
