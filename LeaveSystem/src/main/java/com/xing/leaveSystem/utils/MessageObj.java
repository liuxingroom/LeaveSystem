package com.xing.leaveSystem.utils;

import java.io.Serializable;

/**
 *  该类包含返回结果的信息 
 */
public class MessageObj implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1634640967982025192L;

	/**返回结果的标记*/
	private String result;
	
	/**返回结果的信息*/
	private String message;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	/**操作成功*/
	public void setSuccess(){
		this.result=CommonConstants.SUCCESS;
	}
	
	/**操作失败*/
	public void setFail(){
		this.result=CommonConstants.FALSE;
	}
}
