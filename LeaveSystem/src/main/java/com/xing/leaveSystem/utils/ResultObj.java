package com.xing.leaveSystem.utils;

import java.io.Serializable;

/**
 * 数据返回的格式
 * {"rows":[{"email":"99@qq.com","groups":"","password":"111111","userId":"111111","userName":"张三"}],"total":1}
 * @param <T>
 */
public class ResultObj implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7985012463239747296L;

	private Object rows;
	
	private long total;

	

	public Object getRows() {
		return rows;
	}

	public void setRows(Object rows) {
		this.rows = rows;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}
	
}
