package com.xing.leaveSystem.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xing.leaveSystem.entity.Leave;
import com.xing.leaveSystem.entity.PageBean;
import com.xing.leaveSystem.service.LeaveHisService;
import com.xing.leaveSystem.utils.MessageObj;
import com.xing.leaveSystem.utils.ResultObj;

@Controller
@RequestMapping("/leaveHis")
public class LeaveHisController {
	
	@Resource
	LeaveHisService leaveHisService;
	
	/**
	 * ��ҳ��ѯ�����Ϣ����
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResultObj list(String page,String rows,HttpServletRequest request){
		ResultObj obj=new ResultObj(); 
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		
		//��ȡȥ��¼�˵���Ϣ
		String userId=(String) request.getSession().getAttribute("userId");
		map.put("userId",userId); // �û���
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Leave> leaveList=leaveHisService.find(map);
	    long total=leaveHisService.getTotal(map);
		obj.setRows(leaveList);
		obj.setTotal(total);
		return obj;
	}
	
	
	/***
	 * ȡ�����������Ϣ�鵵
	 * @param ids
	 * @return
	 */
	@RequestMapping("/pigeinhole")
	@ResponseBody
	public MessageObj pigeinhole(String ids){
		MessageObj obj=leaveHisService.pigeinhole(ids);
		return obj;
	}
}
