package com.xing.leaveSystem.entity;

import java.io.Serializable;

/**
 *  �û���ɫ�м��ϵ�� 
 */
public class MemberShip implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1153675435067252169L;
	private String userId;
	private String groupId;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	
	
}
