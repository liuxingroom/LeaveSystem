package com.xing.leaveSystem.entity;

import java.io.Serializable;
import java.sql.Date;

/**
 * ��ټ�¼��
 */
public class Leave implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5604535185508728493L;
	/**��ټ�¼id*/
	private String leaveId;
	/**�����id*/
	private String userId;
	/**�������*/
	private String leaveName;
	/**
	 * �������(���������Ϊ׼)
	 * */
	private int leaveDays;
	/**���״̬*/
	private String status;
	/**���ԭ��*/
	private String leaveReason;
	/**����ʱ��*/
	private Date createTime;
	/**����ʱ��*/
	private Date endTime;
	/**��ټ�¼����Ӧ������ʵ��id*/
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
