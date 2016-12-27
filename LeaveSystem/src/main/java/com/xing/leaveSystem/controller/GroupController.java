package com.xing.leaveSystem.controller;

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
	 * ��ҳ��ѯ��ɫ��Ϣ
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResultObj list(String page,String rows){
		ResultObj obj=new ResultObj();
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		//��װ��ѯ����
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Group> groupList=groupService.find(map);
		Long total=groupService.getTotal(map);
		//��װ����     �����ص�ҳ��
		obj.setTotal(total);
		obj.setRows(groupList);
		return obj;
	}
	
	/**
	 * ��ӻ��޸Ľ�ɫ
	 * @param group  ��װ��ɫ��Ϣ��javabean
	 * @param flag   ������ǣ�������������ӡ�1��  �����޸ġ�2����
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public MessageObj save(Group group,Integer flag){
		MessageObj obj=new MessageObj();
		//�Ƿ�����ɹ��ı��
		int resultTotal=0;
		if(flag==1){
			resultTotal=groupService.add(group);
		}else{
			resultTotal=groupService.update(group);
		}
		//�жϲ����Ƿ�ɹ�
		if(resultTotal>0){//�����ɹ�
			obj.setSuccess();
		}else{//����ʧ��
			obj.setFail();
		}
		return obj;
	}
	
	/**
	 * �鿴��ɫ���Ƿ����
	 * @param groupName  ��ɫ��
	 * @return
	 */
	@RequestMapping("/existGroupName")
	@ResponseBody
	public MessageObj existGroupName(String groupName){
		MessageObj obj=new MessageObj();
		if(groupService.findByGroupName(groupName)!=null){//���������ͬ���ƵĽ�ɫ��Ϣ
			obj.setFail();
			return obj;
		}
		obj.setSuccess();
		return obj;
	}
	
	/**
	 * ���ݽ�ɫid��ɾ����ɫ��Ϣ
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public MessageObj delete(String ids){
		MessageObj obj=new MessageObj();
		//�ָ���ɫid
		String [] id=ids.split(",");
		for(int i=0;i<id.length;i++){
			groupService.delete(id[i]);
		}
		obj.setSuccess();
		return obj;
	}
	
	/**
	 * �������еĽ�ɫ��Ϣ
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
	 * ͨ���û�id����ȡ����Ϣ
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
}
