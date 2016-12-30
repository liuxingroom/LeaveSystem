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
		//根据流程实例id查询出流程实例的对象，从对象中  获取流程定义id  processDefinitionId
		ProcessInstance processInstance=runtimeService.
				createProcessInstanceQuery().
				processInstanceId(processInstanceId).
				singleResult();
		
		//获取流程定义的id
		String processDefinitionId=processInstance.getProcessDefinitionId();
		
		//流程部署id
		String deploymentId=processInstance.getDeploymentId();
		model.addAttribute("deploymentId", deploymentId);
		
		//根据流程实例的id（processInstanceId）来获取当前节点
		String activityId=processInstance.getActivityId();
		
		//根据流程定义id查询           流程定义的实体对象
		ProcessDefinitionEntity processDefinitionEntity=(ProcessDefinitionEntity) repositoryService.
				getProcessDefinition(processDefinitionId);
		
		//向页面传递png图片名
		String diagramResourceName=processDefinitionEntity.getDiagramResourceName();
		model.addAttribute("diagramResourceName", diagramResourceName);
		//从流程定义 实体对象查询结点的坐标和宽高
		ActivityImpl activityImpl=processDefinitionEntity.findActivity(activityId);
		int activity_x= activityImpl.getX();//坐标
		int activity_y = activityImpl.getY();//坐标
		int activity_width =  activityImpl.getWidth();//宽
		int activity_height = activityImpl.getHeight();//高
		
		model.addAttribute("activity_x",activity_x);
		model.addAttribute("activity_y", activity_y);
		model.addAttribute("activity_width", activity_width);
		model.addAttribute("activity_height", activity_height);
		
		return "queryLeaveMap";
	}
}
