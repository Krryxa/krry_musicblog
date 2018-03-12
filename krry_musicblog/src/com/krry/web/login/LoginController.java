package com.krry.web.login;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.code.kaptcha.Constants;
import com.krry.bean.User;
import com.krry.dao.user.IUserDao;
import com.krry.util.TmStringUtils;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private IUserDao userDao;
	
	/**
	 * 登录控制层
	 * com.krry.web.login 
	 * 方法名：login
	 * @author krry 
	 * @param request
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/logined")
	public String login(HttpServletRequest request){
		//获取用户和密码
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		//如果邮箱和密码为null,那么就返回已null标识
		if(TmStringUtils.isEmpty(name) )return "name_null";
		if(TmStringUtils.isEmail(password))return "password_null";
		
		//获取用户传递进来的验证码
		String code = request.getParameter("code");
		if(TmStringUtils.isNotEmpty(code)){
			//获取session中的验证码
			String sessionCode = (String)request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
			//如果输入的验证码和会话的验证码不一致的,提示用户输入有误
			if(TmStringUtils.isNotEmpty(sessionCode) && !code.equalsIgnoreCase(sessionCode)){
				return "error_code";
			}
		}
		
		//密码进行加密处理
		password = TmStringUtils.md5Base64(password);
		//根据邮箱查询，用户是否存在
		User user = userDao.getLogin(name);
		if(user!=null){//如果存在
			//判断密码是否正确
//			System.out.println(user.getPassword()); //未解密的密码，无法用等号比较
			
			User userpas = userDao.getpass(name, password);
			if(userpas!=null){
				//如果密码正确
				//将用户信息放入到会话中...
				request.getSession().setAttribute("user", user);
				return "success";
			}else{
				//如果密码错误
				return "error_password";
			}
		}else{//如果不存在，代码邮箱和密码输入有误
			return "fail";
		}
	}
	
	/**
	 * 退出登录控制层
	 * com.krry.web.login 
	 * 方法名：logout
	 * @author krry 
	 * @param request
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/logout")
	public String logout(HttpServletRequest request){
		request.getSession().invalidate(); //清空session值
		return "success";
	}
	
	/**
	 * 登录成功控制层
	 * com.krry.web.login 
	 * 方法名：loginSuccess
	 * @author krry 
	 * @param request
	 * @return User
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/success")
	public User loginSuccess(HttpServletRequest request){
		User user =(User)request.getSession().getAttribute("user");
		return user;
	}
	
	/**
	 * 注册控制层
	 * com.krry.web.login 
	 * 方法名：resig
	 * @author krry 
	 * @param request
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	@ResponseBody
	@RequestMapping(method=RequestMethod.POST,value="/resig")
	public String resig(HttpServletRequest request){
		//获取用户和密码
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		//如果邮箱和密码为null,那么就返回已null标识
		if(TmStringUtils.isEmpty(name) )return "name_null";
		if(TmStringUtils.isEmpty(email))return "email_null";
		if(TmStringUtils.isEmail(password))return "password_null";
		
		//密码进行加密处理
		password = TmStringUtils.md5Base64(password);
		//根据昵称查询，用户是否存在
		User user1 = userDao.getothernameres(name);
		//根据账号查询，用户是否存在
		User user2 = userDao.getemailres(email);
		
		if(user1 != null){ //昵称重复
			return "Has_name";
		}
		if(user2 != null){ //账号重复
			return "Has_email";
		}
		//格式化时间类型
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime = sdf.format(new Date());
		
		//执行到这里，说明可以注册,用户ID在xml使用了序列生成了
		User newUser = new User(null,name, password, email, null , null, nowTime);
		//调用注册方法
		userDao.saveUser(newUser);
		//获取该用户ID值(通过按昵称查询刚刚注册成功的用户信息，查询出自动生成的ID值)
		newUser.setId(userDao.getLogin(name).getId());
		
		//将信息设置session作用域
		request.getSession().setAttribute("user", newUser);
//		request.getSession().setAttribute("name", name);
		return "success";
	}
	
}



