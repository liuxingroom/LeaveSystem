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
	private Date createTime;

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
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
