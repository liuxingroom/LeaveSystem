package com.xing.leaveSystem.text;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationContextTest {
	
	@Test
	public void getApplicationContext(){
		ApplicationContext applicationContext=new ClassPathXmlApplicationContext("spring/applicationContext.xml");
		System.out.println(applicationContext.getBean("dataSource"));
	}
}
