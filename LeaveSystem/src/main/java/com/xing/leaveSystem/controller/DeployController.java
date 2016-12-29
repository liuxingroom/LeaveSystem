package com.xing.leaveSystem.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipInputStream;

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
 *  ���̲���
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
			//��ȡ�ϴ��ļ�bpmn �ļ�����Ϣ
			String resourceName_bpmn=deployFileBpmn.getOriginalFilename();
			InputStream inputStream_bpmn=deployFileBpmn.getInputStream();
			
			//��ȡ�ϴ��ļ�png  �ļ���Ϣ
			String resourceName_png=deployFilePng.getOriginalFilename();
			InputStream inputStream_png=deployFilePng.getInputStream();
			
			Deployment deployment=repositoryService.createDeployment()
					.name(resourceName_bpmn)
					.addInputStream(resourceName_bpmn, inputStream_bpmn)
					.addInputStream(resourceName_png, inputStream_png)
					.deploy();
		} catch (Exception e) {
			logger.error("���̲���ʧ��");
			obj.setFail();
			e.printStackTrace();
			return obj;
		}
		obj.setSuccess();
		return obj;
	}
	
	/**
	 * ��ѯ���̲�����Ϣ
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
		//��ѯ������ϵͳ�����̲�����Ϣ
		List<Deployment> departments=repositoryService.createDeploymentQuery()
				.orderByDeploymenTime().desc()       //���ݲ���ʱ�併˳����
				.deploymentNameLike("%"+s_name+"%")  //���ݲ�������ģ����ѯ
				.listPage(pageBean.getStart(), pageBean.getPageSize());//  ���ش���ҳ�Ľ������
		
		try {
			//�������̲�����Ϣ
			for(Deployment deployment:departments){
				MyDeployment myDeployment=new MyDeployment();
				BeanUtils.copyProperties(myDeployment, deployment);
				dlist.add(myDeployment);
			}
		} catch (Exception e) {
			logger.error("�����¸���ʧ��");
			e.printStackTrace();
		}
		
		//��ѯ�ò�����Ϣ���ܼ�¼��
		long total=repositoryService.createDeploymentQuery().deploymentNameLike("%"+s_name+"%").count();
		obj.setRows(dlist);
		obj.setTotal(total);
		return obj;
	}
	
	/**
	 * �������̶���id��ɾ�����̶�����Ϣ
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
