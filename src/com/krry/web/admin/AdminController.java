package com.krry.web.admin;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.krry.bean.Blog;
import com.krry.bean.TzParams;
import com.krry.bean.User;
import com.krry.dao.admin.IAdminBlogDao;
import com.krry.dao.user.IUserDao;
import com.krry.util.TmStringUtils;


/**
 * 个人中心控制层
 * AdminController
 * @author krry
 * @version 1.0.0
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	
	@Autowired
	private IAdminBlogDao adminBlogDao;
	@Autowired
	private IUserDao userDao;

	/**
	 * 添加数据
	 * com.krry.web.admin 
	 * 方法名：add
	 * @author krry 
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	@RequestMapping("/add")
	public String add(){//服务
		return "admin/add";
	}

	
	/**
	 * 跳转到修改个人信息
	 * com.krry.web.admin 
	 * 方法名：modifyCenter
	 * @author krry 
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	@RequestMapping("/modifyCenter/{id}")
	public ModelAndView modifyCenter(@PathVariable("id")String id){//服务
		ModelAndView modelAndView = new ModelAndView();
		HashMap<String, Object> user = userDao.getUser(id);
		modelAndView.addObject("user", user);
		modelAndView.setViewName("user/modifyPass");
		return modelAndView;
	}
	
	/**
	 * 修改个人信息
	 * com.krry.web.admin 
	 * 方法名：updateUser
	 * @author krry 
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/updateUser")
	public String updateUser(HttpServletRequest request){//服务
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String description = request.getParameter("description");
		String password = request.getParameter("password");
		
		if(!TmStringUtils.isEmpty(password))password = TmStringUtils.md5Base64(password);//密码加密
		User user = new User(id, username, email, password, description);
		
		try {
			userDao.updateUser(user);
			//将用户信息重新放入到会话中...
			request.getSession().setAttribute("user", user);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	/**
	 * 判断原密码是否正确
	 * com.krry.web.admin 
	 * 方法名：updateUser
	 * @author krry 
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/oripassword")
	public String oripassword(HttpServletRequest request){//服务
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		//获取加密的原密码
		String mdpassword = request.getParameter("mdpassword");
		
		if(!TmStringUtils.isEmpty(password))password = TmStringUtils.md5Base64(password);//密码加密
		
		//如果原密码输入正确
		if(password.equals(mdpassword)){
			return "success";
		}
		return "fail";
	}
	
	/**
	 * 跳转到更新页面
	 * com.krry.web.admin 
	 * 方法名：edit
	 * @author krry 
	 * @param id
	 * @return ModelAndView
	 * @exception 
	 * @since  1.0.0
	 */
	@RequestMapping("/edit/{id}")
	public ModelAndView edit(@PathVariable("id")Integer id){//服务
		ModelAndView modelAndView = new ModelAndView();
		HashMap<String, Object> map = adminBlogDao.getBlog(id);
		modelAndView.addObject("blog", map);
		modelAndView.setViewName("admin/add");
		return modelAndView;
	}
	
	
	@RequestMapping("/index")
	public ModelAndView index(TzParams params,HttpSession session){//服务
		ModelAndView modelAndView = new ModelAndView();
		//获取登录用户Id
		User user = (User) session.getAttribute("user");
		String UserId = user.getId();
		params.setUserId(UserId);
		params.setIsDelete(0);
		params.setPageSize(params.getPageNo()+10);
		
		//如果Id是1，那么是Krry管理员登录啦~~设置用户id为空，让所有音乐博客都查询出来
		if(UserId.equals("1")){
			params.setUserId(null);
		}
		
		List<HashMap<String, Object>> blogs = adminBlogDao.findBlogs(params);
		long itemCount = adminBlogDao.countBlogs(params);
		modelAndView.addObject("blogs", blogs);
		modelAndView.addObject("itemCount", itemCount);
		
		//如果Id是1，那么是Krry管理员登录啦~~ 跳转到管理员界面
		if(UserId.equals("1")){
			modelAndView.setViewName("admin/Adminindex");
		}else{
			modelAndView.setViewName("admin/index");
		}
		
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping("/loadTemplate")
	public HashMap<String, Object> loadTemplate(TzParams params,HttpSession session){//服务
		//获取登录用户Id
		User user = (User) session.getAttribute("user");
		String UserId = user.getId();
		params.setUserId(UserId);
		//如果Id是1，那么是Krry管理员登录啦~~设置用户id为空，让所有音乐博客都查询出来
		if(UserId.equals("1")){
			params.setUserId(null);
		}
		params.setIsDelete(0);
		params.setPageSize(params.getPageNo()+10);
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		List<HashMap<String, Object>> blogs = adminBlogDao.findBlogs(params);
		long itemCount = adminBlogDao.countBlogs(params);
		map.put("blogs", blogs);
		map.put("itemCount", itemCount);
		return map;
	}
	
	/**
	 * 保存内容
	 * com.krry.web.admin 
	 * 方法名：save
	 * @author krry 
	 * @param blog
	 * @param session
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/save")
	public String save(Blog blog,HttpSession session){//服务
		User user = (User)session.getAttribute("user");//获取当前登录的user信息
		blog.setHits(0);
		blog.setUserId(user.getId());//获取当前登录的Id
		blog.setIsDelete(0);
		blog.setStatus(1);
		blog.setIsTop(0);
		blog.setIsBanner(0);
		blog.setIsRecom(0);
		//格式化时间类型
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = sdf.format(new Date());
		blog.setCreateTime(nowTime);
		blog.setUpdateTime(nowTime);

		adminBlogDao.saveBlog(blog);
		adminBlogDao.updateSavaBlog(blog);
		return "success";
	}
	
	
	/**
	 * 更新内容
	 * com.krry.web.admin 
	 * 方法名：update
	 * @author krry 
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/update")
	public String update(Blog blog){//服务
		try {
			//格式化时间类型
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String nowTime = sdf.format(new Date());
			blog.setUpdateTime(nowTime);
			adminBlogDao.updateBlog(blog);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	
	@ResponseBody
	@RequestMapping("/delete")
	public String delete(Blog blog){//服务
		try {
			blog.setIsDelete(1);
			adminBlogDao.updateBlog(blog);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

}
