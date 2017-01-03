package com.xing.leaveSystem.listener;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;
import org.springframework.context.ApplicationContext;

import com.xing.leaveSystem.dao.LeaveMapper;
import com.xing.leaveSystem.entity.Leave;
import com.xing.leaveSystem.utils.ApplicationContextUtils;



/**
 *  ִ�м�������ʹ��    
 *  �ü������������¼���
 *     1.����ʵ���������ͽ���
 *     2.�ڵ�Ŀ�ʼ�ͽ���
 *     3.���صĿ�ʼ�ͽ���
 *     4.�м��¼��Ŀ�ʼ�ͽ���
 *     5.��ʼʱ�����������¼���ʼ
 */
public class ProcessCompleteListener implements ExecutionListener{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6414796179261516690L;
	//ͨ���������ȡspring����
	private static ApplicationContext applicationContext=ApplicationContextUtils.
					getApplicationContext();

	@Override
	public void notify(DelegateExecution execution) throws Exception {
		//execution ������ʵ���Ĵ������
		
		//��ȡҵ���ʶ  �����ɹ���id
		String businessKey=execution.getBusinessKey();
		//��ȡ���̱�����Ϣ
		String msg=(String) execution.getVariable("msg");
		//��spring�����صõ�mapper
		LeaveMapper leaveMapper= applicationContext.getBean(LeaveMapper.class);
		
		//���ݲɹ�����id����status״ֵ̬Ϊcomplete
		Leave leaver=new Leave();
		leaver.setLeaveId(businessKey);//���¼�¼��id
		if(msg.equals("ͨ��")){
			leaver.setStatus("���ͨ��");//����status״ֵ̬Ϊ  ���ͨ��
		}else if(msg.equals("δͨ��")){
			leaver.setStatus("��˲�ͨ��");
		}
		leaveMapper.update(leaver);
	}
			
}
