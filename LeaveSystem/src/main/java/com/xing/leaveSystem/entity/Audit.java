package com.xing.leaveSystem.entity;

import java.io.Serializable;
import java.sql.Date;

public class Audit implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3585631307405689108L;
	/**…Û∫Àid*/
	private String auditId;  
	/**«ÎºŸº«¬ºid*/
	private String leaveId;
	/**…Û∫À»Àid*/
	private String userId;
	/**…Û∫Àƒ⁄»›*/
	private String  auditInfo;
	/**…Û∫À¿‡–Õ*/
	private String auditType;
	/**…Û∫À◊¥Ã¨*/
	private String status;
	/**…Û∫À ±º‰*/
	private Date createTime;
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
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}

