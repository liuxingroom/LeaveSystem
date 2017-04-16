package com.xing.leaveSystem.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xing.leaveSystem.dao.ClassMapper;
import com.xing.leaveSystem.entity.Class;
import com.xing.leaveSystem.utils.UUIDBuild;

@Service
public class ClassServiceImpl implements ClassService {

	@Resource
	ClassMapper classMapper;
	
	@Override
	public List<Class> find(Map<String, Object> map) {
		List<Class> classList=classMapper.find(map);
		return classList;
	}

	@Override
	public long getTotal(Map<String, Object> map) {
		long total=classMapper.getTotal(map);
		return total;
	}

	@Override
	public Class existClassName(String className) {
		Class clazz=classMapper.existClassName(className);
		return clazz;
	}

	@Override
	public int add(Class clazz) {
		String classId=UUIDBuild.getInstance().generate();
		clazz.setClassId(classId);
		int total=classMapper.add(clazz);
		return total;
	}

	@Override
	public int update(Class clazz) {
		int total=classMapper.update(clazz);
		return total;
	}

	@Override
	public int delete(String id) {
		int total =classMapper.delete(id);
		return total;
	}

}
