package com.xing.leaveSystem.entity;

import java.io.Serializable;

/**
 *  �������̶�����Ϣ���� 
 */
public class MyProcessDefinition implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5326911309380765140L;
	/**���̶�����*/
	private String id;
	/**���̶�������*/
	private String name;
	/**���̶����key*/
	private String key;
	/**���̶���汾*/
	private String version;
	/**���̶���Ĺ����ļ�����*/
	private String resourceName;
	/**���̶���Ĺ���ͼƬ����*/
	private String diagramResourceName;
	/**���̲���id*/
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
