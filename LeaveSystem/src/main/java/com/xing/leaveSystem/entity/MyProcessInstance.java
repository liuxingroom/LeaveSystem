package com.xing.leaveSystem.entity;

import java.io.Serializable;
import java.util.Date;

/** 
 *	�Զ�������ʵ����Ϣ
 */
public class MyProcessInstance implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7153104285523617229L;
	/**��ǰ����ʵ��id*/
	private String processInstanceId;
	/**����ʵ������*/
	private String name;
	/**��ǰ�ڵ���Ϣ*/
	private String activityId;
	/**����ʱ��*/
	private Date startTime;
	/**����ʱ��*/
	private Date endTime;
	/**���̶�����Ϣ*/
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
