package com.xing.leaveSystem.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
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
	/**����ʱ�䣨�ַ���������ʽ��*/
	private String startTimeStr;
	/**����ʱ��*/
	private Date endTime;
	/**����ʱ�䣨�ַ�����ʾ��ʽ��*/
	private String endTimeStr;
	/**���̶�����Ϣ*/
	private String processDefinitionId;
	/**�����*/
	private String userName;
	/**���ԭ��*/
	private String leaveReason;
	/**���ʱ��*/
	private int leaveDays;
	

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
	public String getStartTimeStr() {
		if(startTime!=null){
			startTimeStr=new SimpleDateFormat("yyyy-MM-dd").format(startTime);
		}
		return startTimeStr;
	}
	public void setStartTimeStr(String startTimeStr) {
		this.startTimeStr = startTimeStr;
	}
	public String getEndTimeStr() {
		if(endTime!=null){
			endTimeStr=new SimpleDateFormat("yyyy-MM-dd").format(endTime);
		}
		return endTimeStr;
	}
	public void setEndTimeStr(String endTimeStr) {
		this.endTimeStr = endTimeStr;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLeaveReason() {
		return leaveReason;
	}
	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}
	public int getLeaveDays() {
		return leaveDays;
	}
	public void setLeaveDays(int leaveDays) {
		this.leaveDays = leaveDays;
	}
	
}
