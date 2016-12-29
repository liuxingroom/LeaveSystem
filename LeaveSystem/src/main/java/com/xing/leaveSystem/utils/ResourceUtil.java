package com.xing.leaveSystem.utils;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.Set;

import org.apache.log4j.Logger;



public class ResourceUtil {

	public static Logger logger=Logger.getLogger(ResourceUtil.class);
	
	/**
	 * 系统语言环境，默认为中文zh
	 */
	public static final String LANGUAGE = "zh";

	/**
	 * 系统国家环境，默认为中国CN
	 */
	public static final String COUNTRY = "CN";
	
	
	/** 
	 * @param fileName 文件�?
	 * @param key    索引
	 * @return
	 */
	public static String getValue(String fileName,String key){
		String value=getProperties(fileName,key);
		return value;
	}

	/**
	 * 加载.properties 文件并获取该文件中的�?
	 * @param fileName  文件�?
	 * @param key   索引
	 * @return
	 */
	private static String getProperties(String fileName, String key) {
		String retValue="";
		Locale locale=getLocale();
		//ResourceBundle rb=ResourceBundle.getBundle(fileName, locale);
		ResourceBundle rb=ResourceBundle.getBundle(fileName,Locale.SIMPLIFIED_CHINESE);
		retValue=(String)rb.getObject(key);
		return retValue;
	}

	private static Locale getLocale() {
		Locale locale = new Locale(LANGUAGE, COUNTRY);
		return locale;
	}
	
	/**
	 * 获取配置文件中所有的value信息，并将所有的value信息封装到一个list集合�?
	 * @param baseName
	 * @return
	 */
	public static List<String> geKeyList(String baseName){
		Locale locale=getLocale();
		ResourceBundle rb=ResourceBundle.getBundle(baseName, locale);
		List<String> resList=new ArrayList<String>();
		
		Set<String> keyset=rb.keySet();
		for(Iterator<String> it=keyset.iterator();it.hasNext();){
			String lkey=it.next();
			resList.add(lkey);
		}
		return resList;
	}

	
	/**
	 * 通过key从资源文件中获取内容，并格式�?
	 * @param fileName
	 * @param key
	 * @param objs
	 * @return
	 */
	public static String getValue(String fileName,String key,Object [] objs){
		String pattern=getValue(fileName, key);
		String value=MessageFormat.format(pattern, objs);
		return value;
	}
	
	public static void main(String[] args) {
		System.out.println(getValue("diagram.purchasingflow", "purchasingProcessDefinitionKey", new Object[]{1,10}));
	}
}
