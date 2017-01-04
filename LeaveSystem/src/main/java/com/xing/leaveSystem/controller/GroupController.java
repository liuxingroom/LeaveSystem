package com.xing.leaveSystem.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



import org.springframework.web.bind.annotation.ResponseBody;

import com.xing.leaveSystem.entity.Group;
import com.xing.leaveSystem.entity.PageBean;
import com.xing.leaveSystem.service.GroupService;
import com.xing.leaveSystem.utils.DataMessageObj;
import com.xing.leaveSystem.utils.MessageObj;
import com.xing.leaveSystem.utils.ResultObj;

@Controller
@RequestMapping("/group")
public class GroupController {
	
	@Resource
	GroupService groupService;
	
	
	/**
	 * 分页查询角色信息
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResultObj list(String page,String rows){
		ResultObj obj=new ResultObj();
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		//封装查询条件
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Group> groupList=groupService.find(map);
		Long total=groupService.getTotal(map);
		//封装数据     并返回到页面
		obj.setTotal(total);
		obj.setRows(groupList);
		return obj;
	}
	
	/**
	 * 添加或修改角色
	 * @param group  封装角色信息的javabean
	 * @param flag   操作标记（用于区分是添加“1”  还是修改“2”）
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public MessageObj save(Group group,Integer flag){
		MessageObj obj=new MessageObj();
		//是否操作成功的标记
		int resultTotal=0;
		if(flag==1){
			resultTotal=groupService.add(group);
		}else{
			resultTotal=groupService.update(group);
		}
		//判断操作是否成功
		if(resultTotal>0){//操作成功
			obj.setSuccess();
		}else{//操作失败
			obj.setFail();
		}
		return obj;
	}
	
	/**
	 * 查看角色名是否存在
	 * @param groupName  角色名
	 * @return
	 */
	@RequestMapping("/existGroupName")
	@ResponseBody
	public MessageObj existGroupName(String groupName){
		MessageObj obj=new MessageObj();
		if(groupService.findByGroupName(groupName)!=null){//如果存在相同名称的角色信息
			obj.setFail();
			return obj;
		}
		obj.setSuccess();
		return obj;
	}
	
	/**
	 * 根据角色id来删除角色信息
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public MessageObj delete(String ids){
		MessageObj obj=new MessageObj();
		//分隔角色id
		String [] id=ids.split(",");
		for(int i=0;i<id.length;i++){
			groupService.delete(id[i]);
		}
		obj.setSuccess();
		return obj;
	}
	
	/**
	 * 加载所有的角色信息
	 * @return
	 */
	@RequestMapping("/listAllGroups")
	@ResponseBody
	public DataMessageObj<List<Group>> listAllGroups(){
		DataMessageObj<List<Group>> obj=new DataMessageObj<List<Group>>();
		List<Group> groupList=groupService.find(null);
		obj.setDataObject(groupList);
		return obj;
	}
	
	
	/**
	 * 通过用户id来获取组信息
	 * @return
	 */
	@RequestMapping("/findGroupByUserId")
	@ResponseBody
	public DataMessageObj<String> findGroupByUserId(String userId){
		DataMessageObj<String> obj=new DataMessageObj<String>();
		List<Group> groupList=groupService.findGroupByUserId(userId);
		StringBuffer buffer=new StringBuffer();
		for(Group g:groupList){
			buffer.append(g.getId()+",");
		}
		if(buffer.length()>0){
			 obj.setDataObject(buffer.deleteCharAt(buffer.length()-1).toString());
		}else{
			obj.setDataObject(buffer.toString());
		}
		return obj;
	}
	
	/**
	 * 查询所有的角色信息
	 * @return
	 */
	@RequestMapping("/groupComboList")
	@ResponseBody
	public List<Group> groupComboList(){
		Group group=new Group();
		List<Group> groupList=new ArrayList<Group>();
		group.setId("-1");
		group.setName("请选择角色");
		List<Group> groups=groupService.find(null);
		groupList.add(group);
		for(Group g:groups){
			groupList.add(g);
		}
		return groupList;
		
	}
	
	/**
	 * 查看该角色id是否存在
	 * @param id
	 * @return
	 */
	@RequestMapping("/existGroupID")
	@ResponseBody
	public  MessageObj existGroupID(String id){
		MessageObj obj=new MessageObj();
		Group group=groupService.finGroupById(id);
		if(group!=null){//如果存在
			obj.setSuccess();
		}else{//如果不存在
			obj.setFail();
		}
		return obj;
	}
}
