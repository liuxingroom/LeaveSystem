package com.xing.leaveSystem.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xing.leaveSystem.entity.Leave;
import com.xing.leaveSystem.entity.PageBean;
import com.xing.leaveSystem.service.LeaveService;
import com.xing.leaveSystem.utils.MessageObj;
import com.xing.leaveSystem.utils.ResultObj;

/**
 * 请假流程管理
 */
@RequestMapping("/leave")
@Controller
public class LeaveController {
	
	@Resource
	LeaveService leaveService;
	
	/**
	 * 分页查询请假信息集合
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResultObj list(String page,String rows,HttpServletRequest request){
		ResultObj obj=new ResultObj(); 
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		
		//获取去登录人的信息
		String userId=(String) request.getSession().getAttribute("userId");
		map.put("userId",userId); // 用户名
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Leave> leaveList=leaveService.find(map);
	    long total=leaveService.getTotal(map);
		obj.setRows(leaveList);
		obj.setTotal(total);
		return obj;
	}
	
	
	
	/**
	 * 保存请假流程
	 * @param leave
	 * @param flag
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public MessageObj save(Leave leave,Integer flag,HttpSession session){
		MessageObj obj=new MessageObj();
		int resultTotal=0;
		//获取登录人的信息
		String userId=(String) session.getAttribute("userId");
		resultTotal=leaveService.add(leave,userId);
		if(resultTotal>0){//操作成功
			obj.setSuccess();
		}else{//操作失败
			obj.setFail();
		}
		return obj;
	}
	
	/**
	 * 提交请假单
	 * @param processinstanceId
	 * @return
	 */
	@RequestMapping("/startApply")
	@ResponseBody
	public MessageObj startApply(String processinstanceId,String leaveId){
		MessageObj obj=leaveService.startApply(processinstanceId,leaveId);
		return obj;
	}
	
}
