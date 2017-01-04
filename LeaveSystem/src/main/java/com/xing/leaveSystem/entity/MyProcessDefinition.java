package com.xing.leaveSystem.entity;

import java.io.Serializable;

/**
 *  包含流程定义信息的类 
 */
public class MyProcessDefinition implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5326911309380765140L;
	/**流程定义编号*/
	private String id;
	/**流程定义名称*/
	private String name;
	/**流程定义的key*/
	private String key;
	/**流程定义版本*/
	private String version;
	/**流程定义的规则文件名称*/
	private String resourceName;
	/**流程定义的规则图片名称*/
	private String diagramResourceName;
	/**流程部署id*/
	private String deploymentId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public String getDiagramResourceName() {
		return diagramResourceName;
	}
	public void setDiagramResourceName(String diagramResourceName) {
		this.diagramResourceName = diagramResourceName;
	}
	public String getDeploymentId() {
		return deploymentId;
	}
	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
	}
	
	
	
}
