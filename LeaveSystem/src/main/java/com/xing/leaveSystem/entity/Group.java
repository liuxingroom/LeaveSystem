package com.xing.leaveSystem.entity;

import java.io.Serializable;

public class Group implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4280435379719970316L;
	/**½ÇÉ«id*/
	private String id;
	/**½ÇÉ«Ãû³Æ*/
	private String name;
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
	
}
