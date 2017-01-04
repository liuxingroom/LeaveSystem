package com.xing.leaveSystem.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyDeployment implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1015437738542834712L;
	/**部署id*/
	private String id;
	/**部署名*/
	private String name;
	/**部署时间*/
	private Date deploymentTime;
	/**部署时间（字符串显示）*/
	private String deploymentTimeStr;
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
	public Date getDeploymentTime() {
		return deploymentTime;
	}
	public void setDeploymentTime(Date deploymentTime) {
		this.deploymentTime = deploymentTime;
	}
	public String getDeploymentTimeStr() {
		if(deploymentTime!=null){
			deploymentTimeStr=new SimpleDateFormat("yyyy-MM-dd").format(deploymentTime);
		}
		return deploymentTimeStr;
	}
	public void setDeploymentTimeStr(String deploymentTimeStr) {
		this.deploymentTimeStr = deploymentTimeStr;
	}
	
	
}
