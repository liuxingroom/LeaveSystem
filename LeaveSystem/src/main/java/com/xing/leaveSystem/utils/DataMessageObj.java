package com.xing.leaveSystem.utils;

public class DataMessageObj<T> extends MessageObj{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2169619819376616276L;
	
	private T dataObject;

	public T getDataObject() {
		return dataObject;
	}

	public void setDataObject(T dataObject) {
		this.dataObject = dataObject;
	}
	
	/**
	 * ���óɹ�(��д����ĳɹ������÷���)
	 */
	public DataMessageObj<T> setSuccess(T dataObject){
		setSuccess();
		setDataObject(dataObject);
		return this;
	}
	
}
