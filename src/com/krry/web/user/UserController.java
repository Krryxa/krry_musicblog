package com.krry.web.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.krry.bean.User;
import com.krry.dao.user.IUserDao;



/**
 * 
 * UserController
 * @author krry
 * @version 1.0.0
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserDao userDao;
	
	/**
	 * 
	 * com.krry.web 
	 * 方法名：index
	 * @author krry 
	 * @param request
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request){
		System.out.println(request.getParameter("username"));
		return "index";
	}
	
	
	
}
