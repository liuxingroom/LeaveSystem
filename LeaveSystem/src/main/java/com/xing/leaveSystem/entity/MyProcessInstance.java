package com.xing.leaveSystem.entity;

import java.io.Serializable;
import java.util.Date;

/** 
 *	自定义流程实例信息
 */
public class MyProcessInstance implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7153104285523617229L;
	/**当前流程实例id*/
	private String processInstanceId;
	/**流程实例名称*/
	private String name;
	/**当前节点信息*/
	private String activityId;
	/**创建时间*/
	private Date startTime;
	/**结束时间*/
	private Date endTime;
	/**流程定义信息*/
	private String processDefinitionId;
	

	public String getProcessInstanceId() {
		return processInstanceId;
	}
	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}
	public String getActivityId() {
		return activityId;
	}
	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}
	
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProcessDefinitionId() {
		return processDefinitionId;
	}
	public void setProcessDefinitionId(String processDefinitionId) {
		this.processDefinitionId = processDefinitionId;
	}

}
