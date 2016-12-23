package com.xing.leaveSystem.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * 请假记录表
 */
public class Leave implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5604535185508728493L;
	/**请假记录id*/
	private String leaveId;
	/**请假人id*/
	private String userId;
	/**请假名称*/
	private String leaveName;
	/**
	 * 请假天数(请假以天数为准)
	 * */
	private int leaveDays;
	/**请假状态*/
	private String status;
	/**请假原因*/
	private String leaveReason;
	/**创建时间*/
	private Date createTime;
	/**结束时间*/
	private Date endTime;
	/**请假记录所对应的流程实例id*/
	private  String  processinstanceId;
	public String getLeaveId() {
		return leaveId;
	}
	public void setLeaveId(String leaveId) {
		this.leaveId = leaveId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLeaveName() {
		return leaveName;
	}
	public void setLeaveName(String leaveName) {
		this.leaveName = leaveName;
	}
	public int getLeaveDays() {
		return leaveDays;
	}
	public void setLeaveDays(int leaveDays) {
		this.leaveDays = leaveDays;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLeaveReason() {
		return leaveReason;
	}
	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getProcessinstanceId() {
		return processinstanceId;
	}
	public void setProcessinstanceId(String processinstanceId) {
		this.processinstanceId = processinstanceId;
	}
	
	
}
