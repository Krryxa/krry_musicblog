package com.krry.tag;

import java.text.SimpleDateFormat;
import java.util.Date;

import sun.net.www.content.audio.x_aiff;

/**
 * 自定义函数标签
 * TmFunction
 * @author krry
 * @version 1.0.0
 *
 */
public class TmFunction {

	
	/**
	 * 日期格式化方法
	 * com.krry.tag 
	 * 方法名：dateFormat
	 * @author krry 
	 * @param date
	 * @param pattern
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	public static String dateFormat(String date,String pattern){
		return new SimpleDateFormat(pattern).format(date);
	}

	
	/**
	 * 
	 * com.krry.tag 
	 * 方法名：getChar
	 * @author krry 
	 * @param index
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	public static String getChar(int index){
		char c =(char)(64+index);
		return String.valueOf(c);
	}
	
	
	/**
	 * 
	 * com.krry.tag 
	 * 方法名：subString
	 * @author krry 
	 * @param content
	 * @param start
	 * @param end
	 * @return String
	 * @exception 
	 * @since  1.0.0
	 */
	public static String subString(String content,int start,int end){
		return content.substring(start, end);
	}
	
	public static void main(String[] args) {
//		System.out.println(getChar(1));
	}
	
	
}
