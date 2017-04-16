package com.xing.leaveSystem.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xing.leaveSystem.entity.Group;
import com.xing.leaveSystem.entity.Leave;
import com.xing.leaveSystem.entity.PageBean;
import com.xing.leaveSystem.service.ClassService;
import com.xing.leaveSystem.utils.MessageObj;
import com.xing.leaveSystem.utils.ResultObj;
import com.xing.leaveSystem.entity.Class;

@Controller
@RequestMapping("/class")
public class ClassController {
	
	
	@Resource
	ClassService classService;

	@RequestMapping("/list")
	@ResponseBody
	public ResultObj list(String page,String rows,HttpServletRequest request){
		ResultObj obj=new ResultObj(); 
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Class> classList=classService.find(map);
	    long total=classService.getTotal(map);
		obj.setRows(classList);
		obj.setTotal(total);
		return obj;
	}
	
	/**
	 * 通过专业名来判断该专业是否存在
	 * @param id
	 * @return
	 */
	@RequestMapping("/existClassName")
	@ResponseBody
	public MessageObj existClassName(String className){
		MessageObj messageObj=new MessageObj();
		Class clazz=classService.existClassName(className);
		if(null == clazz) {
			messageObj.setFail();
		}else{
			messageObj.setSuccess();;
		}
		return messageObj;
	}
	
	
	/**
	 * 编辑专业信息
	 * @param clazz
	 * @param flag
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public MessageObj save(Class clazz,Integer flag){
		MessageObj obj=new MessageObj();
		//是否操作成功的标记
		int resultTotal=0;
		if(flag==1){
			resultTotal=classService.add(clazz);
		}else{
			resultTotal=classService.update(clazz);
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
	 * 根据专业id来删除专业信息
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public MessageObj delete(String ids){
		MessageObj obj=new MessageObj();
		int total=0;
		int num=0;
		//分隔角色id
		String [] id=ids.split(",");
		for(int i=0;i<id.length;i++){
			total=classService.delete(id[i]);
			if(total>0){
				num++;
			}
		}
		if(num==id.length){
			obj.setSuccess();
		}else{
			obj.setFail();
		}
		return obj;
	}
	
	/**
	 * 查询所有专业信息
	 * @return
	 */
	@RequestMapping("/classComboList")
	@ResponseBody
	public List<Class> classComboList(){
		Class clazz=new Class();
		List<Class> classList=new ArrayList<Class>();
		clazz.setClassId("-1");
		clazz.setClassName("请选择专业");
		List<Class> clazzs=classService.find(null);
		classList.add(clazz);
		for(Class g:clazzs){
			classList.add(g);
		}
		return classList;
		
	}
}
