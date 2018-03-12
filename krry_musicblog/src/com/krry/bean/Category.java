package com.krry.bean;

import java.util.Date;

/**
 * blog数据层 Blog 
 * Category
 * @author krry
 * @version 1.0.0
 *
 */
public class Category {
	// 主键
	private String id;
	// 名称
	private String name;
	// 发布状态0未发布1发布
	private Integer status;
	// 创建时间
	private String createTime;
	// 更新时间
	private String updateTime;
	
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}



}
