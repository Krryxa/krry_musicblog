package com.krry.bean;

import java.math.BigDecimal;
import java.util.Date;

/**
 * blog数据层 Blog
 * Comment
 * @author krry
 * @version 1.0.0
 *
 */
public class Comment {
	// 主键
	private Integer id;
	// 描述
	private String description;
	// 评论时间
	private String createTime;
	// 发布状态0未发布1发布
	private Integer status;
	// 添加用户
	private String userId;

	private Integer blogId;

	private String parentId;

	private String replyUserId;
	
	public Comment(Integer id,String description,String createTime,Integer status,String userId,Integer blogId,String parentId,String replyUserId) {
		this.id = id;
		this.description = description;
		this.createTime = createTime;
		this.status = status;
		this.userId = userId;
		this.blogId = blogId;
		this.parentId = parentId;
		this.replyUserId = replyUserId;
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getBlogId() {
		return blogId;
	}

	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getReplyUserId() {
		return replyUserId;
	}

	public void setReplyUserId(String replyUserId) {
		this.replyUserId = replyUserId;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", description=" + description
				+ ", createTime=" + createTime + ", status=" + status
				+ ", userId=" + userId + ", blogId=" + blogId + ", parentId="
				+ parentId + ", replyUserId=" + replyUserId + "]";
	}
	
	
	
}