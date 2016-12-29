package com.xing.leaveSystem.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;





import com.xing.leaveSystem.entity.Leave;
import com.xing.leaveSystem.entity.PageBean;
import com.xing.leaveSystem.service.LeaveService;
import com.xing.leaveSystem.utils.MessageObj;
import com.xing.leaveSystem.utils.ResultObj;

/**
 * ������̹���
 */
@RequestMapping("/leave")
@Controller
public class LeaveController {
	
	@Resource
	LeaveService leaveService;
	
	/**
	 * ��ҳ��ѯ�����Ϣ����
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResultObj list(String page,String rows,HttpServletRequest request){
		ResultObj obj=new ResultObj(); 
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		
		// TODO
//		String userId=(String) request.getSession().getAttribute("userId");
//		map.put("userId",userId); // �û���
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Leave> leaveList=leaveService.find(map);
	    long total=leaveService.getTotal(map);
		obj.setRows(leaveList);
		obj.setTotal(total);
		return obj;
	}
	
	
	
	/**
	 * �����������
	 * @param leave
	 * @param flag
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public MessageObj save(Leave leave,Integer flag,HttpServletRequest request){
		MessageObj obj=new MessageObj();
		int resultTotal=0;
		resultTotal=leaveService.add(leave);
		if(resultTotal>0){//�����ɹ�
			obj.setSuccess();
		}else{//����ʧ��
			obj.setFail();
		}
		return obj;
	}
	
	/**
	 * �ύ��ٵ�
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
