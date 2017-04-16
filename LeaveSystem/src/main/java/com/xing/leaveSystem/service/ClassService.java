package com.xing.leaveSystem.service;

import java.util.List;
import java.util.Map;

import com.xing.leaveSystem.entity.Class;

public interface ClassService {

	/**
	 * 获取所有专业信息
	 * @param map
	 * @return
	 */
	List<Class> find(Map<String, Object> map);

	/**
	 * 查询专业表总记录数
	 * @param map
	 * @return
	 */
	long getTotal(Map<String, Object> map);

	/**
	 * 通过专业名来判断该专业是否存在
	 * @param id
	 * @return
	 */
	Class existClassName(String className);

	/**
	 * 添加专业信息
	 * @param clazz
	 * @return
	 */
	int add(Class clazz);

	/**
	 * 更信息专业信息
	 * @param clazz
	 * @return
	 */
	int update(Class clazz);

	/**
	 * 根据专业id来删除专业信息
	 * @param string
	 */
	int  delete(String id);

}
