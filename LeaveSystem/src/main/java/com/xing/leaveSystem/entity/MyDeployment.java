package com.xing.leaveSystem.entity;

import java.io.Serializable;
import java.util.Date;

public class MyDeployment implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1015437738542834712L;
	/**����id*/
	private String id;
	/**������*/
	private String name;
	/**����ʱ��*/
	private Date deploymentTime;
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
	
	
}
