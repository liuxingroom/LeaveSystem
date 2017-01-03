package com.xing.leaveSystem.utils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 *  ͨ������һ�ַ�ʽ��ȡspring web�����Ķ���
 *  ��;�������������ҪʹΪ���ڼ������л���ʹ��spring��������
 *  ע�⣺ʹ�ø÷�����ȡApplicationContext������Ҫ��web.xml������request�������ļ��� 
 */
public class ApplicationContextUtils {
	private static ApplicationContext applicationContext=null;
	public static ApplicationContext getApplicationContext(){
		HttpServletRequest request=null;
		if(applicationContext==null){
			request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			applicationContext=WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext());
		}
		return applicationContext;
	}
	
}
