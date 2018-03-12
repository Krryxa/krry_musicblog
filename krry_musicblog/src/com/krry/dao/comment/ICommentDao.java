package com.krry.dao.comment;

import java.util.HashMap;
import java.util.List;

import com.krry.bean.Blog;
import com.krry.bean.Comment;
import com.krry.bean.TzParams;

/**
 * blog数据层
 * ICommentDao
 * @author krry
 * @version 1.0.0
 *
 */
public interface ICommentDao {

	/**
	 * 查询所有的评论信息
	 * com.krry.dao.comment 
	 * 方法名：findComments
	 * @author krry 
	 * @param params
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<HashMap<String, Object>> findComments(TzParams params);
	
	/**
	 * 查询最新评论
	 * com.krry.dao.comment 
	 * 方法名：findComments
	 * @author krry 
	 * @param params
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	public HashMap<String, Object> findNewComment(Comment comment);
	
	/**
	 * 查询评论数量
	 * com.krry.dao.comment 
	 * 方法名：countComments
	 * @author krry 
	 * @param params
	 * @return int
	 * @exception 
	 * @since  1.0.0
	 */
	public Integer countComments(Integer blogId);
	
	/**
	 * 保存评论信息
	 * com.krry.dao.comment 
	 * 方法名：saveComment
	 * @author krry 
	 * @param comment void
	 * @exception 
	 * @since  1.0.0
	 */
	public void saveComment(Comment comment);
	
	
	/**
	 * 删除评论信息
	 * com.krry.dao.comment 
	 * 方法名：deleteComment
	 * @author krry 
	 * @param id void
	 * @exception 
	 * @since  1.0.0
	 */
	public void deleteComment(Integer id);
	
	/**
	 * 更新评论数量
	 * com.krry.dao.comment 
	 * 方法名：updateBlog
	 * @author krry 
	 * @param id void
	 * @exception 
	 * @since  1.0.0
	 */
	public void updateBlog(Blog blog);
	
}
