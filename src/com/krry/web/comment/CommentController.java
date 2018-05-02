package com.krry.web.comment;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.krry.bean.Comment;
import com.krry.bean.TzParams;
import com.krry.bean.User;
import com.krry.dao.comment.ICommentDao;

@Controller
@RequestMapping("/comment")
public class CommentController {

	
	@Autowired
	private ICommentDao commentDao;
	
	/**
	 * 保存评论
	 * com.krry.web.comment 
	 * 方法名：saveComment
	 * @author krry 
	 * @param comment
	 * @param request
	 * @return Comment
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/save")
	public HashMap<String, Object> saveComment(HttpServletRequest request,HttpSession session){
		//回复者ID,即是当前登录的ID
		User user = (User) session.getAttribute("user");
		String replyUserId = user.getId();
		
		//博主ID
		String userId = request.getParameter("userId");
		//评论信息
		String description = request.getParameter("description");
		//博文ID
		Integer blogId = Integer.parseInt(request.getParameter("blogId"));
		//发布状态
		Integer status = 1;
		//格式化时间类型
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = sdf.format(new Date());
		//评论时间
		String createTime = nowTime;
		Comment comment = new Comment(null, description, createTime, status, userId, blogId, null, replyUserId);
		//保存评论
		commentDao.saveComment(comment);
		
		//查出刚刚插进去的评论，并返回
		HashMap<String, Object> comNews = commentDao.findNewComment(comment);

		return comNews;
	}
	
	/**
	 * 查询评论信息,每次查询5条
	 * com.krry.web.comment 
	 * 方法名：saveComment
	 * @author krry 
	 * @param params
	 * @return HashMap<String, Object>
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/load")
	public HashMap<String, Object> findComments(TzParams params){
		//若是前台传进来一个blogId，会自动注入到TzParams对象中
		params.setStatus(1);
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> comments = commentDao.findComments(params);
		Integer blogId = params.getBlogId();//获取博客ID
		long count = commentDao.countComments(blogId); //总评论数
		map.put("comments", comments);
		map.put("countComments", count);
		return map;
	}
	
	/**
	 * 删除评论信息
	 * com.krry.web.comment 
	 * 方法名：deleteComment
	 * @author krry 
	 * @param request
	 * @return int
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/deleteComment")
	public void deleteComment(HttpServletRequest request){
		
		Integer commentId = Integer.parseInt(request.getParameter("commentId"));
		commentDao.deleteComment(commentId);
		
	}
	
	
}








