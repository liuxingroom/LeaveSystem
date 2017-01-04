package com.xing.leaveSystem.controller;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.ProcessDefinition;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xing.leaveSystem.entity.MyProcessDefinition;
import com.xing.leaveSystem.entity.PageBean;
import com.xing.leaveSystem.utils.ResultObj;

/**
 *  查询流程定义信息的controller
 */
@Controller
@RequestMapping("/processDefinition")
public class ProcessDefinitionController {
	Logger logger=Logger.getLogger(ProcessDefinitionController.class);
	
	@Resource
	RepositoryService repositoryService;
	
	/**
	 * 分页查询流程定义的信息
	 * @param page
	 * @param rows
	 * @param s_name
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResultObj list(String page,String rows,String s_name){
		ResultObj obj=new ResultObj();
		List<MyProcessDefinition> plist=new ArrayList<MyProcessDefinition>();
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		//判断传递的参数是否为空
		if(StringUtils.isEmpty(s_name)){
			s_name="";
		}
		//查询流程定义信息
		List<ProcessDefinition> processDefinitions=repositoryService.createProcessDefinitionQuery()
				.orderByProcessDefinitionId().desc() // 根据流程定义id降序排列
				.processDefinitionNameLike("%"+s_name+"%")  //根据流程定义名字模糊查询
				.listPage(pageBean.getStart(), pageBean.getPageSize());  //分页查询结果集合
		
		//遍历流程定义信息
		try {
			for(ProcessDefinition definition:processDefinitions){
				MyProcessDefinition myProcessDefinition=new MyProcessDefinition();
				BeanUtils.copyProperties(myProcessDefinition, definition);
				plist.add(myProcessDefinition);
			}
		} catch (Exception e) {
			logger.error("流程定义信息复制失败");
			e.printStackTrace();
		}
	   //计算流程定义的记录数
	   long total=repositoryService.createProcessDefinitionQuery()
					.processDefinitionNameLike("%"+s_name+"%")  //根据流程定义名字模糊查询
					.count();
		obj.setRows(plist);
		obj.setTotal(total);
		return obj;
		
		
	}
	
	/**
	 * 显示工作流程图片信息
	 * @param deploymentId  部署id
	 * @param diagramResourceName  要显示的资源名
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/showView")
	public void showView(String deploymentId,String diagramResourceName,HttpServletResponse response)throws Exception{
		//获取工作流程图  并转换成io流
		InputStream inputStream=repositoryService.getResourceAsStream(deploymentId, diagramResourceName);
		//通过response获取输出流对象
		OutputStream outputStream=response.getOutputStream();
		int i=0;
		byte [] b= new byte [1024];
		while((i=inputStream.read(b))!=-1){
			outputStream.write(b);
		}
		outputStream.close();
		inputStream.close();
		
	}
	
}
