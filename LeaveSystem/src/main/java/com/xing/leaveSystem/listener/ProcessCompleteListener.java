package com.xing.leaveSystem.listener;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;
import org.springframework.context.ApplicationContext;

import com.xing.leaveSystem.dao.LeaveMapper;
import com.xing.leaveSystem.entity.Leave;
import com.xing.leaveSystem.utils.ApplicationContextUtils;



/**
 *  执行监听器的使用    
 *  该监听器监听的事件：
 *     1.流程实例的启动和结束
 *     2.节点的开始和结束
 *     3.网关的开始和结束
 *     4.中间事件的开始和结束
 *     5.开始时间结束或结束事件开始
 */
public class ProcessCompleteListener implements ExecutionListener{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6414796179261516690L;
	//通过工具类获取spring容器
	private static ApplicationContext applicationContext=ApplicationContextUtils.
					getApplicationContext();

	@Override
	public void notify(DelegateExecution execution) throws Exception {
		//execution 是流程实例的代理对象
		
		//获取业务标识  ，即采购单id
		String businessKey=execution.getBusinessKey();
		//获取流程变量信息
		String msg=(String) execution.getVariable("msg");
		//从spring容器重得到mapper
		LeaveMapper leaveMapper= applicationContext.getBean(LeaveMapper.class);
		
		//根据采购单的id更新status状态值为complete
		Leave leaver=new Leave();
		leaver.setLeaveId(businessKey);//更新记录的id
		if(msg.equals("通过")){
			leaver.setStatus("审核通过");//更新status状态值为  审核通过
		}else if(msg.equals("未通过")){
			leaver.setStatus("审核不通过");
		}
		leaveMapper.update(leaver);
	}
			
}
