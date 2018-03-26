package com.krry.web.login;

import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.google.code.kaptcha.impl.DefaultNoise;


/**
 * 防止Captcha机器人登陆
 * @author krry
 * 
 */
@Controller
@RequestMapping("/kaptcha")
public class CaptchaController {

	@Autowired
	private Producer captchaProducer = null;
	/**
	 * 	
	    kaptcha.border  是否有边框  默认为true  我们可以自己设置yes，no
		kaptcha.border.color   边框颜色   默认为Color.BLACK
		kaptcha.border.thickness  边框粗细度  默认为1
		kaptcha.producer.impl   验证码生成器  默认为DefaultKaptcha
		kaptcha.textproducer.impl   验证码文本生成器  默认为DefaultTextCreator
		kaptcha.textproducer.char.string   验证码文本字符内容范围  默认为abcde2345678gfynmnpwx
		kaptcha.textproducer.char.length   验证码文本字符长度  默认为5
		kaptcha.textproducer.font.names    验证码文本字体样式  默认为new Font("Arial", 1, fontSize), new Font("Courier", 1, fontSize)
		kaptcha.textproducer.font.size   验证码文本字符大小  默认为40
		kaptcha.textproducer.font.color  验证码文本字符颜色  默认为Color.BLACK
		kaptcha.textproducer.char.space  验证码文本字符间距  默认为2
		kaptcha.noise.impl    验证码噪点生成对象  默认为DefaultNoise
		kaptcha.noise.color   验证码噪点颜色   默认为Color.BLACK
		kaptcha.obscurificator.impl   验证码样式引擎  默认为WaterRipple
		kaptcha.word.impl   验证码文本字符渲染   默认为DefaultWordRenderer
		kaptcha.background.impl   验证码背景生成器   默认为DefaultBackground
		kaptcha.background.clear.from   验证码背景颜色渐进   默认为Color.LIGHT_GRAY
		kaptcha.background.clear.to   验证码背景颜色渐进   默认为Color.WHITE
		kaptcha.image.width   验证码图片宽度  默认为200
		kaptcha.image.height  验证码图片高度  默认为50 
		kaptcha.session.key	  session中存放验证码的key键
	/**
	 * com.krry.web 
	 * 方法名：生成二维码控制类
	 * 创建人：krry 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception 
	 * 返回类型：ModelAndView
	 * @exception 
	 * @since  1.0.0
	*/
	@RequestMapping("/code")
	public ModelAndView getKaptchaImage(HttpServletRequest request,HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		//获取验证码
		//	String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		//	String code = (String) session.getAttribute("Kaptcha_Code");
		//清除浏览器的缓存
		response.setDateHeader("Expires", 0);
		// Set standard HTTP/1.1 no-cache headers.
		response.setHeader("Cache-Control","no-store, no-cache, must-revalidate");
		// Set IE extended HTTP/1.1 no-cache headers (use addHeader).
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		// Set standard HTTP/1.0 no-cache header.
		response.setHeader("Pragma", "no-cache");
		// return a jpeg
		response.setContentType("image/jpeg");
		//浏览器记忆功能-----当前过浏览器和服务器交互成功以后下载的图片和资源会进行缓存一次。下次刷新的时候就不会在到服务器去下载。
		// 获取KAPTCHA验证的随机文本
		String capText = captchaProducer.createText();
		// 将生成好的图片放入会话中
		session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
		// create the image with the text
		BufferedImage bi = captchaProducer.createImage(capText);
		ServletOutputStream out = response.getOutputStream();
		// write the data out
		ImageIO.write(bi, "jpg", out);
		try {
			out.flush();
		} finally {
			out.close();//关闭
		}
		return null;
	}
}