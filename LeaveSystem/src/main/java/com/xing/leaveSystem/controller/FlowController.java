package com.xing.leaveSystem.controller;

import javax.annotation.Resource;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/flow")
public class FlowController {
	
	@Resource
	RuntimeService runtimeService;
	
	@Resource
	RepositoryService repositoryService;
	
	@RequestMapping("/queryLeaveMap")
	public String queryLeaveMap(Model model,String processInstanceId){
		//��������ʵ��id��ѯ������ʵ���Ķ��󣬴Ӷ�����  ��ȡ���̶���id  processDefinitionId
		ProcessInstance processInstance=runtimeService.
				createProcessInstanceQuery().
				processInstanceId(processInstanceId).
				singleResult();
		
		//��ȡ���̶����id
		String processDefinitionId=processInstance.getProcessDefinitionId();
		
		//���̲���id
		String deploymentId=processInstance.getDeploymentId();
		model.addAttribute("deploymentId", deploymentId);
		
		//��������ʵ����id��processInstanceId������ȡ��ǰ�ڵ�
		String activityId=processInstance.getActivityId();
		
		//�������̶���id��ѯ           ���̶����ʵ�����
		ProcessDefinitionEntity processDefinitionEntity=(ProcessDefinitionEntity) repositoryService.
				getProcessDefinition(processDefinitionId);
		
		//��ҳ�洫��pngͼƬ��
		String diagramResourceName=processDefinitionEntity.getDiagramResourceName();
		model.addAttribute("diagramResourceName", diagramResourceName);
		//�����̶��� ʵ������ѯ��������Ϳ��
		ActivityImpl activityImpl=processDefinitionEntity.findActivity(activityId);
		int activity_x= activityImpl.getX();//����
		int activity_y = activityImpl.getY();//����
		int activity_width =  activityImpl.getWidth();//��
		int activity_height = activityImpl.getHeight();//��
		
		model.addAttribute("activity_x",activity_x);
		model.addAttribute("activity_y", activity_y);
		model.addAttribute("activity_width", activity_width);
		model.addAttribute("activity_height", activity_height);
		
		return "queryLeaveMap";
	}
}
