package com.xing.leaveSystem.entity;

import java.io.Serializable;

/**
 * �û�ʵ����
 *
 */
public class User  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -756760723183852068L;
	
	private String userId;  //����
	private String userName; //�û���
	private String password; //����
	private String email;    //����
	private String groups;   // �û����еĽ�ɫ �����ɫ֮���ö��Ÿ���(ʹ�������ֶ�����ʾ��  ʡȥ�˶���Ĺ���)
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGroups() {
		return groups;
	}
	public void setGroups(String groups) {
		this.groups = groups;
	}
	
	

}
