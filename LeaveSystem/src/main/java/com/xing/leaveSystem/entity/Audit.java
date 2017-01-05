package com.xing.leaveSystem.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Audit implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3585631307405689108L;
	/**审核id*/
	private String auditId;  
	/**请假记录id*/
	private String leaveId;
	/**审核人id*/
	private String userId;
	/**审核人的名称*/
	private String userName;
	/**审核内容*/
	private String  auditInfo;
	/**审核类型*/
	private String auditType;
	/**审核状态*/
	private String status;
	/**审核时间*/
	private Date createTime;
	/**审核时间支付串表现形式*/
	private String createTimeStr;
	/**当前任务id*/
	private String taskId;
	/**历史任务名*/
	private String taskName;
	
	
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public String getAuditId() {
		return auditId;
	}
	public void setAuditId(String auditId) {
		this.auditId = auditId;
	}
	
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
	public String getAuditInfo() {
		return auditInfo;
	}
	public void setAuditInfo(String auditInfo) {
		this.auditInfo = auditInfo;
	}
	public String getAuditType() {
		return auditType;
	}
	public void setAuditType(String auditType) {
		this.auditType = auditType;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date date) {
		this.createTime = date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	/**格式化时间（将日期对象转换成支付串）*/
	public String getCreateTimeStr() {
		if(createTime!=null){
			createTimeStr=new SimpleDateFormat("yyyy-MM-dd").format(createTime);
		}
		return createTimeStr;
	}
	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
}

