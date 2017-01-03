package com.xing.leaveSystem.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
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
	/**创建时间（字符串表现形式）*/
	private String startTimeStr;
	/**结束时间*/
	private Date endTime;
	/**结束时间（字符串表示方式）*/
	private String endTimeStr;
	/**流程定义信息*/
	private String processDefinitionId;
	/**请假人*/
	private String userName;
	/**请假原因*/
	private String leaveReason;
	/**请假时间*/
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
