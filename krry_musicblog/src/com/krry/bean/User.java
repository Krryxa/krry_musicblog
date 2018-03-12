package com.krry.bean;

import java.math.BigDecimal;

/**
 * 
 * User
 * @author krry
 * @version 1.0.0
 *
 */
public class User {

	 // 主键
	 private String id;
	 // 用户名
	 private String username;
	 //	  密码
	 private String password;
	 //email
	 private String email;
	 
	 private String headerPic;
	 //个人简介
	 private String description;
	 
	 private String createTime;

	public User(String id,String username,String password,String email,String headerPic,String description,String createTime) {
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.headerPic = headerPic;
		this.description = description;
		this.createTime = createTime;
	 }
	
	public User(String id,String username,String email,String password,String description) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.description = description;
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
	 
	 public String getEmail() {
		return email;
	 }

	 public void setEmail(String email) {
		this.email = email;
	 }
	
	 public String getHeaderPic() {
		return headerPic;
	 }
	
  	 public void setHeaderPic(String headerPic) {
		this.headerPic = headerPic;
	 }

	 public String getId() {
		 return id;
	 }
	
	 public void setId(String id) {
		 this.id = id;
	 }
	
	 public String getUsername() {
		 return username;
	 }
	
	 public void setUsername(String username) {
		 this.username = username;
	 }
	
	 public String getPassword() {
		 return password;
	 }
	
	 public void setPassword(String password) {
		 this.password = password;
	 }

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", email=" + email + ", headerPic=" + headerPic
				+ ", description=" + description + ", createTime=" + createTime
				+ "]";
	}

	


}