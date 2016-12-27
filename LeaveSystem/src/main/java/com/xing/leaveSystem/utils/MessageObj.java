package com.xing.leaveSystem.utils;

import java.io.Serializable;

/**
 *  ����������ؽ������Ϣ 
 */
public class MessageObj implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1634640967982025192L;

	/**���ؽ���ı��*/
	private String result;
	
	/**���ؽ������Ϣ*/
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
	
	/**�����ɹ�*/
	public void setSuccess(){
		this.result=CommonConstants.SUCCESS;
	}
	
	/**����ʧ��*/
	public void setFail(){
		this.result=CommonConstants.FALSE;
	}
}
