package com.krry.web.blog;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.krry.bean.Blog;
import com.krry.bean.TzParams;
import com.krry.dao.blog.IBlogDao;
import com.krry.dao.comment.ICommentDao;

/**
 * blog的控制层
 * BlogController
 * @author krry
 * @version 1.0.0
 *
 */
@Controller
@RequestMapping("/blog")
public class BlogController {

	@Autowired
	private IBlogDao blogDao;
	@Autowired
	private ICommentDao commentDao;
	
	@RequestMapping("/index")
	public ModelAndView index(TzParams params){
		//bean里默认设置PageSize=5，pageNo=0
		//查询博客,设置参数，1：发布，0：非删除
		params.setStatus(1);
		params.setIsDelete(0);
		
		//查询大Banner博客，5个
		params.setPageSize(5);
		List<HashMap<String, Object>> blogsBan = blogDao.findBlogsBanner(params);
		
		//查询置顶博客,3个置顶博客
		params.setPageSize(3);
		List<HashMap<String, Object>> blogsTop = blogDao.findBlogsTop(params);
		
		//查询热门博客,唯一,0：非置顶
		params.setPageSize(1);
		params.setIsTop(0);
		HashMap<String, Object> blogsHot = blogDao.findHot(params);
		
		//查询最新博客，5个博客
		params.setPageSize(5);
		List<HashMap<String, Object>> blogsNew = blogDao.findBlogs(params);
		
		//查询推荐博客，4个博客，1：推荐
		params.setPageSize(4);
		params.setIsRecom(1);
		List<HashMap<String, Object>> blogsRecom = blogDao.findBlogs(params);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("blogsBan", blogsBan);//将大Banner的blog放到作用域中
		modelAndView.addObject("blogsTop", blogsTop);//将置顶的blog放到作用域中
		modelAndView.addObject("blogsHot", blogsHot);//将热门的blog放到作用域中
		modelAndView.addObject("blogsNew", blogsNew);//将最新的blog放到作用域中
		modelAndView.addObject("blogsRecom", blogsRecom);//将推荐的blog放到作用域中
		
		modelAndView.setViewName("blog/index"); //跳到此页面，首页
		return modelAndView;
	}
	
	/**
	 * 查询置顶的博客  （已经被第一个方法替代）
	 * com.krry.web.blog 
	 * 方法名：loadDataTop
	 * @author krry 
	 * @param params
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/loadDataTop")
	public List<HashMap<String, Object>> loadDataTop(TzParams params){
		params.setStatus(1);
		params.setPageSize(3);
		params.setIsDelete(0);
		List<HashMap<String, Object>> blogs = blogDao.findBlogsTop(params);
		return blogs;
	}
	
	/**
	 * 查询推荐的博客 （已经被第一个方法替代）
	 * com.krry.web.blog 
	 * 方法名：loadDataRecom
	 * @author krry 
	 * @param params
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/loadDataRecom")
	public List<HashMap<String, Object>> loadDataRecom(TzParams params){
		params.setStatus(1);
		params.setIsDelete(0);
		params.setIsRecom(1);
		List<HashMap<String, Object>> blogs = blogDao.findBlogs(params);
		return blogs;
	}
	
	/**
	 * 查询热门期刊（点击数最多） （已经被第一个方法替代）
	 * com.krry.web.blog 
	 * 方法名：loadDataHot
	 * @author krry 
	 * @param params
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/loadDataHot")
	public HashMap<String, Object> loadDataHot(TzParams params){
		params.setStatus(1);
		params.setIsDelete(0);
		params.setIsTop(0);
		HashMap<String, Object> blogs = blogDao.findHot(params);
		return blogs;
	}
	
	/**
	 * 查询博客(下拉加载使用)
	 * com.krry.web.blog 
	 * 方法名：loadData
	 * @author krry 
	 * @param params
	 * @return HashMap<String,Object>
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/loadData")
	public HashMap<String, Object> loadData(TzParams params){
		params.setStatus(1);
		params.setIsDelete(0);
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> blogs = blogDao.findBlogs(params);
		long coutBlogs = blogDao.countBlogs(params);
		map.put("blogs", blogs);
		map.put("coutBlogs", coutBlogs);
		
		return map;
	}
	
	/**
	 * 跳转到查询所有博客的页面
	 * com.krry.web.blog 
	 * 方法名：kindOfBlog
	 * @author krry 
	 * @param params
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/AllBlog")
	public ModelAndView AllBlog(TzParams params){
		params.setPageNo(0);
		params.setPageSize(10); //一开始只查询10条
		params.setStatus(1);
		params.setIsDelete(0);
		//查询博客信息
		List<HashMap<String, Object>> blog = blogDao.findBlogs(params);
		long coutBlogs = blogDao.countALLBlogs(params);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("blog", blog);
		modelAndView.addObject("coutBlogs", coutBlogs);
		modelAndView.setViewName("blog/allBlog");
		return modelAndView;
	}
	
	/**
	 * 查询所有博客（在全部博客页面，下拉加载使用的方法）
	 * com.krry.web.blog 
	 * 方法名：loadDataAllBlog
	 * @author krry 
	 * @param params
	 * @return HashMap<String,Object>
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/loadDataAllBlog")
	public HashMap<String, Object> loadDataAllBlog(TzParams params){
		params.setStatus(1);
		params.setIsDelete(0);
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> blogs = blogDao.findBlogs(params);
		long coutBlogs = blogDao.countALLBlogs(params);
		map.put("blogs", blogs);
		map.put("coutBlogs", coutBlogs);
		
		return map;
	}
	
	/**
	 * 查询某分类中所有博客（在某分类博客页面，下拉加载使用的方法）
	 * com.krry.web.blog 
	 * 方法名：loadDataAllKind
	 * @author krry 
	 * @param params
	 * @return HashMap<String,Object>
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/loadDataAllKind")
	public HashMap<String, Object> loadDataAllKind(TzParams params){
		params.setStatus(1);
		params.setIsDelete(0);
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> blogs = blogDao.findBlogs(params);
		long coutBlogs = blogDao.countKindBlogs(params);
		map.put("blogs", blogs);
		map.put("coutBlogs", coutBlogs);
		
		return map;
	}
	
	/**
	 * 跳转到查询某用户的博客的页面
	 * com.krry.web.blog 
	 * 方法名：personBlog
	 * @author krry 
	 * @param params
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/personBlog/{userId}")
	public ModelAndView personBlog(@PathVariable("userId")String userId,TzParams params){
		params.setUserId(userId);
		//将所查看的用户Id 昵称设置进作用域
		HashMap<String, Object> user = blogDao.getUsermsg(params);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user", user);//查询出来的用户信息设置进作用域（id,username）
		
		modelAndView.setViewName("blog/personBlog");
		return modelAndView;
	}
	
	/**
	 * 查询某用户的博客
	 * com.krry.web.blog 
	 * 方法名：loadDataPerson
	 * @author krry 
	 * @param params
	 * @return HashMap<String,Object>
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/loadDataPerson")
	public HashMap<String, Object> loadDataPerson(TzParams params){
		params.setStatus(1);
		params.setIsDelete(0);
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> blogs = blogDao.findPersonBlog(params);
		long coutBlogs = blogDao.countBlogs(params);
		map.put("blogs", blogs);
		map.put("coutBlogs", coutBlogs);
		
		return map;
	}
	
	/**
	 * 进入博客详细页
	 * com.krry.web.blog 
	 * 方法名：detail
	 * @author krry 
	 * @param id
	 * @param request
	 * @return ModelAndView
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/detail/{id}")
	public ModelAndView detail(@PathVariable("id")Integer id,HttpServletRequest request){
		//获取该博客信息
		HashMap<String, Object> blog = blogDao.getBlog(id);
		//统计点击数
		Integer count = Integer.parseInt(String.valueOf(blog.get("HITS")));

		//点击数+1
		if(count == 0){
			count = new Integer(1);
		}else{
			count = new Integer(count.intValue()+1);
		}
		Blog blog2 = new Blog();
		blog2.setId(id);
		blog2.setHits(count);
		blogDao.updateBlog(blog2);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("blog", blog);
		modelAndView.setViewName("blog/detail");//跳转到此页面
		return modelAndView;
	}
	
	/**
	 * 根据音乐的分类查询出相关音乐
	 * com.krry.web.blog 
	 * 方法名：relation
	 * @author krry 
	 * @param params
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/relation")
	public List<HashMap<String, Object>> relation(TzParams params){
		params.setStatus(1);
		params.setIsDelete(0);
		params.setPageSize(4);
		List<HashMap<String, Object>> blogs = blogDao.relationBlogs(params);
		return blogs;
	}
	
	/**
	 * 查询分类博客的categoryId值，设置到作用域中，跳转到查询分类博客的页面
	 * com.krry.web.blog 
	 * 方法名：kindOfBlog
	 * @author krry 
	 * @param params
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/kindOfBlog/{categoryId}")
	public ModelAndView kindOfBlog(@PathVariable("categoryId")Integer categoryId){

		TzParams params = new TzParams();
		params.setTypeId(categoryId);
		//查询该分类的博客信息
		HashMap<String, Object> blog = blogDao.getBlogKind(params);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("blog", blog);//储存查询出来的该分类的博客信息（id,name）
		
		modelAndView.setViewName("blog/kindOfBlog");
		return modelAndView;
	}
	
	/**
	 * 按关键字查询音乐博客
	 * com.krry.web.blog 
	 * 方法名：searchOfBlog
	 * @author krry 
	 * @param params
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/searchBlogRes")
	public HashMap<String, Object> searchOfBlog(TzParams params){
		params.setStatus(1);
		params.setIsDelete(0);
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<HashMap<String, Object>> blogs = blogDao.findBlogs(params);
		long coutBlogs = blogDao.countKeywordBlogs(params);
		map.put("blogs", blogs);
		map.put("coutBlogs", coutBlogs);
		
		return map;
	}
	
	/**
	 * 获取keyword值，设置到作用域中，跳转到关键字查询博客的界面
	 * com.krry.web.blog 
	 * 方法名：kindOfBlog
	 * @author krry 
	 * @param params
	 * @return List<HashMap<String,Object>>
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping("/searchBlog")
	public ModelAndView searchKeywords(HttpServletRequest request){
		String keywords = request.getParameter("searchkeywords");
		TzParams params = new TzParams();
		params.setKeywords(keywords);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("keywords", keywords);
		
		modelAndView.setViewName("blog/searchOfBlog");
		return modelAndView;
	}

	
}
