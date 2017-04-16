package com.xing.leaveSystem.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xing.leaveSystem.entity.Class;

public interface ClassMapper {

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
	Class existClassName(@Param("className")String className);

	/**
	 * 添加专业信息
	 * @param clazz
	 * @return
	 */
	int add(Class clazz);

	/**
	 * 更新专业信息
	 * @param clazz
	 * @return
	 */
	int update(Class clazz);

	/**
	 * 根据专业id来删除专业信息
	 * @param id
	 * @return
	 */
	int delete(String id);

}
