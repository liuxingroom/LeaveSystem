package com.xing.leaveSystem.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *  自定义一个任务类    用户封装数据带到页面显示
 */
public class MyTask implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1969017856161754429L;
	/**任务id*/
	private String id;
	/**任务名称*/
	private String name;
	/**创建时间*/
	private Date createTime;
	/**创建时间支付串表示方式*/
	private String createTimeStr;
	/**结束时间*/
	private Date endTime;
	/**结束时间（字符串表示方式）*/
	private String endTimeStr;
	/**任务办理人*/
	private String userName;
	/**任务标识*/
	private String taskDefinitionKey;
	/**判断任务是否拾取的标记0  代表未拾取  1代笔拾取*/
	private boolean flag;
	/**审核详细信息*/
	private String auditMessage;
	
	
	public String getAuditMessage() {
		return auditMessage;
	}
	public void setAuditMessage(String auditMessage) {
		this.auditMessage = auditMessage;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTaskDefinitionKey() {
		return taskDefinitionKey;
	}
	public void setTaskDefinitionKey(String taskDefinitionKey) {
		this.taskDefinitionKey = taskDefinitionKey;
	}
	public String getCreateTimeStr() {
		if(createTime!=null){
			createTimeStr=new SimpleDateFormat("yyyy-MM-dd").format(createTime);
		}
		return createTimeStr;
	}
	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
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
	
	
}
