package com.xing.leaveSystem.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xing.leaveSystem.common.springdao.SqlDao;
import com.xing.leaveSystem.dao.LeaveHisMapper;
import com.xing.leaveSystem.entity.Leave;
import com.xing.leaveSystem.utils.MessageObj;
import com.xing.leaveSystem.utils.UtilFuns;



@Service
public class LeaveHisServiceImpl implements LeaveHisService{

	@Resource
	LeaveHisMapper leaveHisMapper;
	
	@Resource
	SqlDao sqlDao;
	
	@Override
	public List<Leave> find(Map<String, Object> map) {
		List<Leave> leaveList=leaveHisMapper.list(map);
		return leaveList;
	}

	@Override
	public long getTotal(Map<String, Object> map) {
		long total=leaveHisMapper.getTotal(map);
		return total;
	}

	@Override
	public MessageObj pigeinhole(String ids) {
		MessageObj obj=new MessageObj();
		String [] id=ids.split(",");
		int [] totalResult=sqlDao.batchSQL(this.doData(id,"","_his"));  
		if(totalResult.length>0){
			obj.setSuccess();
		}else{
			obj.setFail();
		}
		return obj;
	}
	
	@Override
	public MessageObj pigeouthole(String ids) {
		MessageObj obj=new MessageObj();
		String [] id=ids.split(",");
		int [] totalResult=sqlDao.batchSQL(this.doData(id, "_his", ""));
		if(totalResult.length>0){
			obj.setSuccess();
		}else{
			obj.setFail();
		}
		return obj;
	}
	
	/**
	 * 拼接请假记录表和请假记录历史表数据相互装换信息的sql
	 * @param id 请假表的id集合
	 * @param source 复制的源表
	 * @param target 复制的目的表
	 * @return
	 */
	private String[] doData(String[] id, String source, String target) {
		StringBuffer sBuf=new StringBuffer();
		String inStr=UtilFuns.joinStr(id,"'","'",",");	
		//
		sBuf.append("insert into leave_system").append(target).append("_leave( select * from leave_system").append(source).append("_leave where leave_id in (").append(inStr).append("));"); 
		
		//
		sBuf.append("delete from leave_system").append(source).append("_leave where leave_id in (").append(inStr).append(");"); 
		String sqlStr=sBuf.toString();
		System.out.println(sqlStr);
		String sqls []=sqlStr.split(";");
		for(String string:sqls){
			System.out.println(string);
		}
		return sqls;
	}
}
