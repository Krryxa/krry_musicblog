package com.krry.bean;

import java.util.Date;

/**
 * blog数据层 Blog 
 * Blog
 * @author krry
 * @version 1.0.0
 *
 */
public class Blog {
	// 主键
	private Integer id;
	// 标题
	private String title;
	// 描述
	private String description;
	// 分类
	private Integer categoryId;
	// 封面图
	private String img;
	// 创建时间
	private String createTime;
	// 更新时间
	private String updateTime;
	// 音乐播放地址
	private String musiclink;
	// 歌词名称
	private String musiclrc;
	// 歌词地址
	private String musiclrclink;
	// 歌者
	private String musictor;
	// 音乐标题
	private String musictitle;
	// 音乐大小
	private String musicsize;
	// 音乐时长
	private String musictime;
	// 点击数
	private Integer hits;
	// 发布状态0未发布1发布
	private Integer status;
	// 删除状态0未删除1删除
	private Integer isDelete;
	// 博主ID
	private String userId;
	//是否是大Banner
	private Integer isBanner;
	//是否置顶0未置顶1置顶2第一
	private Integer isTop;
	//是否推荐
	private Integer isRecom;
	//是否删除歌词 0未删除1删除
	private Integer isDeleteLrc;
	//是否外链歌曲 0上传  1外链
	private Integer isHrefSong;
	//是否外链歌词 0上传  1外链
	private Integer isHrefLrc;
	
	
	
	public Integer getIsHrefSong() {
		return isHrefSong;
	}
	public void setIsHrefSong(Integer isHrefSong) {
		this.isHrefSong = isHrefSong;
	}
	public Integer getIsHrefLrc() {
		return isHrefLrc;
	}
	public void setIsHrefLrc(Integer isHrefLrc) {
		this.isHrefLrc = isHrefLrc;
	}
	public Integer getIsBanner() {
		return isBanner;
	}
	public void setIsBanner(Integer isBanner) {
		this.isBanner = isBanner;
	}
	public Integer getIsDeleteLrc() {
		return isDeleteLrc;
	}
	public void setIsDeleteLrc(Integer isDeleteLrc) {
		this.isDeleteLrc = isDeleteLrc;
	}
	public Integer getIsRecom() {
		return isRecom;
	}
	public void setIsRecom(Integer isRecom) {
		this.isRecom = isRecom;
	}
	public String getMusiclrclink() {
		return musiclrclink;
	}
	public void setMusiclrclink(String musiclrclink) {
		this.musiclrclink = musiclrclink;
	}
	public String getMusiclrc() {
		return musiclrc;
	}
	public void setMusiclrc(String musiclrc) {
		this.musiclrc = musiclrc;
	}
	public Integer getIsTop() {
		return isTop;
	}
	public void setIsTop(Integer isTop) {
		this.isTop = isTop;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
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
	public String getMusiclink() {
		return musiclink;
	}
	public void setMusiclink(String musiclink) {
		this.musiclink = musiclink;
	}
	public String getMusictor() {
		return musictor;
	}
	public void setMusictor(String musictor) {
		this.musictor = musictor;
	}
	public String getMusictitle() {
		return musictitle;
	}
	public void setMusictitle(String musictitle) {
		this.musictitle = musictitle;
	}
	public String getMusicsize() {
		return musicsize;
	}
	public void setMusicsize(String musicsize) {
		this.musicsize = musicsize;
	}
	public String getMusictime() {
		return musictime;
	}
	public void setMusictime(String musictime) {
		this.musictime = musictime;
	}
	public Integer getHits() {
		return hits;
	}
	public void setHits(Integer hits) {
		this.hits = hits;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "Blog [id=" + id + ", title=" + title + ", description="
				+ description + ", categoryId=" + categoryId + ", img=" + img
				+ ", createTime=" + createTime + ", updateTime=" + updateTime
				+ ", musiclink=" + musiclink + ", musiclrc=" + musiclrc
				+ ", musiclrclink=" + musiclrclink + ", musictor=" + musictor
				+ ", musictitle=" + musictitle + ", musicsize=" + musicsize
				+ ", musictime=" + musictime + ", hits=" + hits + ", status="
				+ status + ", isDelete=" + isDelete + ", userId=" + userId
				+ ", isBanner=" + isBanner + ", isTop=" + isTop + ", isRecom="
				+ isRecom + ", isDeleteLrc=" + isDeleteLrc + "]";
	}
	

	
	
}
