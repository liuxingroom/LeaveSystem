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
	private String id;
	private String name;
	private Date createTime;
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
	
	
}
