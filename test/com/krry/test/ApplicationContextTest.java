package com.krry.test;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.krry.bean.User;
import com.krry.dao.blog.IBlogDao;
import com.krry.dao.user.IUserDao;

public class ApplicationContextTest {

	
	
	@Test
	public void testApplication(){
		
		//启动 
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
//		ProxoolDataSource datasource = context.getBean(ProxoolDataSource.class);
//		SqlSessionFactory sessionFactory = context.getBean(SqlSessionFactory.class);
//		SqlSession session = (SqlSession) context.getBean("sqlSession");
//		List<User> users = session.selectList("com.tz.dao.user.IUserDao.findUsers");
//		for (User user : users) {
//			System.out.println(user.getId()+"=="+user.getUsername());
//		}
//		session.close();
//		
//		IUserDao userDao = (IUserDao) context.getBean("IUserDao");
//		List<User> users = userDao.findUsers();
//		for (User user : users) {
//			System.out.println(user.getId()+"=="+user.getUsername());
//		}
		
//		User user = new User();
//		user.setUsername("sdfsdfsd");
//		user.setAge(20);
//		user.setIdcard("234234");
//		user.setTel("11111");
//		userDao.csaveUser(user);
//		
//		IBlogDao blogDao = (IBlogDao) context.getBean("IBlogDao");
//		List<HashMap<String, Object>> blogs = blogDao.findBlogs();
//		System.out.println(blogs);
		
//		String[] namaes = context.getBeanDefinitionNames();
//		for (String string : namaes) {
//			System.out.println(string+"=="+context.getBean(string));
//		}
		
		
//		System.out.println(sessionFactory);
//		System.out.println(datasource);
		
//		try {
//			Connection con = datasource.getConnection();
//			System.out.println(con);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
		
		
		
//		}
	}
	
	
	public void saveUser(){
		
	}
	
	
	
	
	
}
