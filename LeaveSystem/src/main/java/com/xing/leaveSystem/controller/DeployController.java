package com.xing.leaveSystem.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.xing.leaveSystem.entity.MyDeployment;
import com.xing.leaveSystem.entity.PageBean;
import com.xing.leaveSystem.utils.MessageObj;
import com.xing.leaveSystem.utils.ResultObj;

/**
 *  流程部署
 */
@Controller
@RequestMapping("/deploy")
public class DeployController {
	Logger logger=Logger.getLogger(Deployment.class);
	
	@Resource
	RepositoryService repositoryService;
	
	@Resource
	IdentityService identityService;
	
	@RequestMapping("/deploy")
	@ResponseBody
	public MessageObj deploy(MultipartFile deployFileBpmn,MultipartFile deployFilePng ,HttpSession session){
		MessageObj obj=new MessageObj();
		try {
			//获取上传文件bpmn 文件的信息
			String resourceName_bpmn=deployFileBpmn.getOriginalFilename();
			InputStream inputStream_bpmn=deployFileBpmn.getInputStream();
			
			//获取上传文件png  文件信息
			String resourceName_png=deployFilePng.getOriginalFilename();
			InputStream inputStream_png=deployFilePng.getInputStream();
			
			Deployment deployment=repositoryService.createDeployment()
					.name(resourceName_bpmn)
					.addInputStream(resourceName_bpmn, inputStream_bpmn)
					.addInputStream(resourceName_png, inputStream_png)
					.deploy();
		} catch (Exception e) {
			logger.error("流程部署失败");
			obj.setFail();
			e.printStackTrace();
			return obj;
		}
		obj.setSuccess();
		return obj;
	}
	
	/**
	 * 查询流程部署信息
	 * @param page
	 * @param rows
	 * @param s_name
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public ResultObj list(String page,String rows,String s_name){
		ResultObj obj=new ResultObj();
		List<MyDeployment> dlist=new ArrayList<MyDeployment>();
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		if(s_name==null){
			s_name="";
		}
		//查询工作流系统中流程不是信息
		List<Deployment> departments=repositoryService.createDeploymentQuery()
				.orderByDeploymenTime().desc()       //根据部署时间降顺排列
				.deploymentNameLike("%"+s_name+"%")  //根据部署名称模糊查询
				.listPage(pageBean.getStart(), pageBean.getPageSize());//  返回带分页的结果集合
		
		try {
			//拷贝流程部署信息
			for(Deployment deployment:departments){
				MyDeployment myDeployment=new MyDeployment();
				BeanUtils.copyProperties(myDeployment, deployment);
				dlist.add(myDeployment);
			}
		} catch (Exception e) {
			logger.error("部署新复制失败");
			e.printStackTrace();
		}
		
		//查询该部署信息的总记录数
		long total=repositoryService.createDeploymentQuery().deploymentNameLike("%"+s_name+"%").count();
		obj.setRows(dlist);
		obj.setTotal(total);
		return obj;
	}
	
	/**
	 * 根据流程定义id来删除流程定义信息
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public MessageObj delete(String ids){
		MessageObj obj=new MessageObj();
		String [] id=ids.split(",");
		for(int i=0;i<id.length;i++){
			repositoryService.deleteDeployment(ids,true);
		}
		obj.setSuccess();
		return obj;
	}
	
}
