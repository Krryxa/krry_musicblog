package com.krry.dao.admin;

import java.util.HashMap;
import java.util.List;

import com.krry.bean.Blog;
import com.krry.bean.TzParams;

/**
 * blog数据层
 * IAdminBlogDao
 * @author krry
 * @version 1.0.0
 *
 */
public interface IAdminBlogDao {

	/**
	 * 查询所有的博客信息
	 * com.krry.dao.admin 
	 * 方法名：findBlogs
	 * @author krry 
	 * @param params
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<HashMap<String, Object>> findBlogs(TzParams params);
	
	/**
	 * 计算博客数量
	 * com.krry.dao.admin 
	 * 方法名：countBlogs
	 * @author krry 
	 * @param params
	 * @return int
	 * @exception 
	 * @since  1.0.0
	 */
	public long countBlogs(TzParams params);
	
	
	/**
	 * 根据id获取博客信息
	 * com.krry.dao.admin 
	 * 方法名：getBlog
	 * @author krry 
	 * @param id
	 * @return HashMap<String,Object>
	 * @exception 
	 * @since  1.0.0
	 */
	public HashMap<String, Object> getBlog(Integer id);
	
	
	/**
	 * 保存博客信息
	 * com.krry.dao.admin 
	 * 方法名：saveBlog
	 * @author krry 
	 * @param blog
	 * @return void
	 * @exception 
	 * @since  1.0.0
	 */
	public void saveBlog(Blog blog);
	
	/**
	 * 保存更新博客信息
	 * com.krry.dao.admin 
	 * 方法名：updateSavaBlog
	 * @author krry 
	 * @param blog void
	 * @exception 
	 * @since  1.0.0
	 */
	public void updateSavaBlog(Blog blog);
	

	/**
	 * 更新博客信息
	 * com.krry.dao.admin 
	 * 方法名：updateBlog
	 * @author krry 
	 * @param blog void
	 * @exception 
	 * @since  1.0.0
	 */
	public void updateBlog(Blog blog);
	
	
	/**
	 * 更新博客信息
	 * com.krry.dao.admin 
	 * 方法名：deleteBlog
	 * @author krry 
	 * @param id void
	 * @exception 
	 * @since  1.0.0
	 */
	public void deleteBlog(String id);
	
	
}
