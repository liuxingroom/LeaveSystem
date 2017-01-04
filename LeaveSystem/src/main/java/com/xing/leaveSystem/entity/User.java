package com.xing.leaveSystem.entity;

import java.io.Serializable;

/**
 * 用户实体类
 *
 */
public class User  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -756760723183852068L;
	
	private String userId;  //主键
	private String userName; //用户名
	private String password; //密码
	private String email;    //邮箱
	private String groups;   // 用户所有的角色 多个角色之间用逗号隔开(使用冗余字段来表示，  省去了对象的关联)
	
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
