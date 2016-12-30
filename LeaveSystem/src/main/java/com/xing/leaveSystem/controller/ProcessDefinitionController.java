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
 *  ��ѯ���̶�����Ϣ��controller
 */
@Controller
@RequestMapping("/processDefinition")
public class ProcessDefinitionController {
	Logger logger=Logger.getLogger(ProcessDefinitionController.class);
	
	@Resource
	RepositoryService repositoryService;
	
	/**
	 * ��ҳ��ѯ���̶������Ϣ
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
		//�жϴ��ݵĲ����Ƿ�Ϊ��
		if(StringUtils.isEmpty(s_name)){
			s_name="";
		}
		//��ѯ���̶�����Ϣ
		List<ProcessDefinition> processDefinitions=repositoryService.createProcessDefinitionQuery()
				.orderByProcessDefinitionId().desc() // �������̶���id��������
				.processDefinitionNameLike("%"+s_name+"%")  //�������̶�������ģ����ѯ
				.listPage(pageBean.getStart(), pageBean.getPageSize());  //��ҳ��ѯ�������
		
		//�������̶�����Ϣ
		try {
			for(ProcessDefinition definition:processDefinitions){
				MyProcessDefinition myProcessDefinition=new MyProcessDefinition();
				BeanUtils.copyProperties(myProcessDefinition, definition);
				plist.add(myProcessDefinition);
			}
		} catch (Exception e) {
			logger.error("���̶�����Ϣ����ʧ��");
			e.printStackTrace();
		}
	   //�������̶���ļ�¼��
	   long total=repositoryService.createProcessDefinitionQuery()
					.processDefinitionNameLike("%"+s_name+"%")  //�������̶�������ģ����ѯ
					.count();
		obj.setRows(plist);
		obj.setTotal(total);
		return obj;
		
		
	}
	
	/**
	 * ��ʾ��������ͼƬ��Ϣ
	 * @param deploymentId  ����id
	 * @param diagramResourceName  Ҫ��ʾ����Դ��
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/showView")
	public void showView(String deploymentId,String diagramResourceName,HttpServletResponse response)throws Exception{
		//��ȡ��������ͼ  ��ת����io��
		InputStream inputStream=repositoryService.getResourceAsStream(deploymentId, diagramResourceName);
		//ͨ��response��ȡ���������
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
