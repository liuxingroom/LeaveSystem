package com.xing.leaveSystem.entity;

import java.io.Serializable;
import java.util.Date;

/**
 *  �Զ���һ��������    �û���װ���ݴ���ҳ����ʾ
 */
public class MyTask implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1969017856161754429L;
	/**����id*/
	private String id;
	/**��������*/
	private String name;
	/**����ʱ��*/
	private Date createTime;
	/**����ʱ��*/
	private Date endTime;
	/**���������*/
	private String userName;
	/**�ж������Ƿ�ʰȡ�ı��0  ����δʰȡ  1����ʰȡ*/
	private boolean flag;
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
	
	
}
