package com.xing.leaveSystem.entity;

import java.io.Serializable;

/**
 * 专业
 */
public class Class implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2295066823722998500L;

	/**专业id*/
	public String classId;
	
	/**专业名*/
	public String className;
	
	/**年级*/
	public String grade;
	
	/**人数*/
	public String classNum;

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getClassNum() {
		return classNum;
	}

	public void setClassNum(String classNum) {
		this.classNum = classNum;
	}
	
	
}
