package com.krry.dao.blog;

import java.util.HashMap;
import java.util.List;

import com.krry.bean.Blog;
import com.krry.bean.TzParams;

/**
 * blog数据层
 * IBlogDao
 * @author krry
 * @version 1.0.0
 *
 */
public interface IBlogDao {

	/**
	 * 查询博客信息
	 * com.krry.dao.blog 
	 * 方法名：findBlogs
	 * @author krry 
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<HashMap<String, Object>> findBlogs(TzParams params);
	
	/**
	 * 查询大Banner的博客信息
	 * com.krry.dao.blog 
	 * 方法名：findBlogsBanner
	 * @author krry 
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<HashMap<String, Object>> findBlogsBanner(TzParams params);
	
	/**
	 * 查询置顶博客信息
	 * com.krry.dao.blog 
	 * 方法名：findBlogsTop
	 * @author krry 
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<HashMap<String, Object>> findBlogsTop(TzParams params);
	
	
	/**
	 * 查询点击数最多的博客
	 * com.krry.dao.blog 
	 * 方法名：findHot
	 * @author krry 
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	public HashMap<String, Object> findHot(TzParams params);
	
	/**
	 * 查询某用户的博客
	 * com.krry.dao.blog 
	 * 方法名：findPersonBlog
	 * @author krry 
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<HashMap<String, Object>> findPersonBlog(TzParams params);
	
	/**
	 * 获取所有的博客数量
	 * com.krry.dao.blog 
	 * 方法名：countALLBlogs
	 * @author krry 
	 * @param params
	 * @return long
	 * @exception 
	 * @since  1.0.0
	 */
	public long countALLBlogs(TzParams params);
	
	/**
	 * 获取非置顶的博客数量 /某用户发布的博客数量
	 * com.krry.dao.blog 
	 * 方法名：countBlogs
	 * @author krry 
	 * @param params
	 * @return long
	 * @exception 
	 * @since  1.0.0
	 */
	public long countBlogs(TzParams params);
	
	/**
	 * 获取分类总博客数量
	 * com.krry.dao.blog 
	 * 方法名：countBlogs
	 * @author krry 
	 * @param params
	 * @return long
	 * @exception 
	 * @since  1.0.0
	 */
	public long countKindBlogs(TzParams params);
	
	/**
	 * 查询符合关键字的博客数量
	 * com.krry.dao.blog 
	 * 方法名：countKeywordBlogs
	 * @author krry 
	 * @param params
	 * @return long
	 * @exception 
	 * @since  1.0.0
	 */
	public long countKeywordBlogs(TzParams params);
	
	/**
	 * 查找相关博客信息
	 * com.krry.dao.blog 
	 * 方法名：relationBlogs
	 * @author krry 
	 * @param params
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<HashMap<String, Object>> relationBlogs(TzParams params);
	
	/**
	 * 根据id获取博客信息
	 * com.krry.dao.blog 
	 * 方法名：getBlog
	 * @author krry 
	 * @param id
	 * @return HashMap<String, Object>
	 * @exception 
	 * @since  1.0.0
	 */
	public HashMap<String, Object> getBlog(Integer id);
	
	/**
	 * 获取某用户信息
	 * com.krry.dao.blog 
	 * 方法名：getUsermsg
	 * @author krry 
	 * @param categoryId
	 * @return HashMap<String,Object>
	 * @exception 
	 * @since  1.0.0
	 */
	public HashMap<String, Object> getUsermsg(TzParams params);
	
	/**
	 * 获取分类博客信息
	 * com.krry.dao.blog 
	 * 方法名：getBlogKind
	 * @author krry 
	 * @param categoryId
	 * @return HashMap<String,Object>
	 * @exception 
	 * @since  1.0.0
	 */
	public HashMap<String, Object> getBlogKind(TzParams params);
	
	/**
	 * 保存博客信息
	 * com.krry.dao.blog 
	 * 方法名：saveBlog
	 * @author krry 
	 * @param blog
	 * @return Blog
	 * @exception 
	 * @since  1.0.0
	 */
	public Blog saveBlog(Blog blog);
	
	

	/**
	 * 更新博客信息
	 * com.krry.dao.blog 
	 * 方法名：updateBlog
	 * @author krry 
	 * @param blog void
	 * @exception 
	 * @since  1.0.0
	 */
	public void updateBlog(Blog blog);
	
	
	/**
	 * 删除博客信息
	 * com.krry.dao.blog 
	 * 方法名：deleteBlog
	 * @author krry 
	 * @param id void
	 * @exception 
	 * @since  1.0.0
	 */
	public void deleteBlog(Integer id);
	
	
}
