package com.krry.bean;

/**
 * 
 * TzParams
 * @author krry
 * @version 1.0.0
 *
 */
public class TzParams {

	private Integer pageSize = 5;
	private Integer pageNo = 0;
	private Integer status;
	private Integer isDelete;
	private Integer typeId;
	private Integer filterId;
	private Integer blogId;
	private String userId;
	private Integer isBanner;
	private Integer isTop;
	private Integer isRecom;//是否推荐
	private String keywords;
	
	public Integer getIsBanner() {
		return isBanner;
	}

	public void setIsBanner(Integer isBanner) {
		this.isBanner = isBanner;
	}
	public Integer getIsRecom() {
		return isRecom;
	}

	public void setIsRecom(Integer isRecom) {
		this.isRecom = isRecom;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Integer getIsTop() {
		return isTop;
	}

	public void setIsTop(Integer isTop) {
		this.isTop = isTop;
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

	public Integer getFilterId() {
		return filterId;
	}

	public void setFilterId(Integer filterId) {
		this.filterId = filterId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	
	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	@Override
	public String toString() {
		return "TzParams [pageSize=" + pageSize + ", pageNo=" + pageNo
				+ ", status=" + status + ", isDelete=" + isDelete + ", typeId="
				+ typeId + ", filterId=" + filterId + ", blogId=" + blogId
				+ ", userId=" + userId + ", isTop=" + isTop + "]";
	}

}
