package com.krry.web.upload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.krry.util.TmStringUtils;

/**
 * 文件上传,更新成同一文件会覆盖原有的文件
 * UploadController
 * @author krry
 * @version 1.0.0
 *
 */
@Controller
@RequestMapping("/upload")
public class UploadController {

	@ResponseBody
	@RequestMapping(value = "/file")
	public String krryupload(
			@RequestParam("doc") MultipartFile file, HttpServletRequest request,HttpServletResponse response)
			throws IllegalStateException, IOException, JSONException {
		String oldFile = request.getParameter("oldName");
		File targetFile  = null;
		String oldName = null;
		String newName = null;
		String ext = null;
		String fpath = null;
		String url = null;
		//如果是修改博客的图片或音乐，则会覆盖原文件的名称
		//为了体验更优化，这段代码需要修改，上传的文件目录跟原文件一样，名称需要改变
		if(TmStringUtils.isNotEmpty(oldFile)){
//上传的目标根路径rootPath,http://www.krrymusic.xin/
//和文件路径名称oldFile,resources/blog/images/2016/09/14/d76d08e8-20d7-449e-adef-2a29dc5cd7db.png
			oldName = file.getOriginalFilename();//上传文件的原名称
			String rootPath = request.getServletContext().getRealPath("/");
			ext = oldFile.substring(oldFile.lastIndexOf(".")+1);
			
			//截取字符串oldFile，只保留resources/blog/images/2016/09/14/
			String olddirPath = oldFile.substring(0,oldFile.lastIndexOf("/")+1);
			//获取新的文件名称，拼接到旧的路径
			String olddirPathName = olddirPath+UUID.randomUUID().toString()+"."+ext;
			
			targetFile =  new File(rootPath, olddirPathName); 
			url = olddirPathName;///已经上传完毕的文件路径+名称
			File pfile = targetFile.getParentFile();
			if(!pfile.exists())pfile.mkdirs();
		}else{
			oldName = file.getOriginalFilename();
			String directory = request.getParameter("dir");
			if(TmStringUtils.isEmpty(directory))directory = "blog";
			ext = oldName.substring(oldName.lastIndexOf(".")+1);
			//日期路径
			String ymd = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
			fpath = "resources/"+directory+"/"+ymd;
			//获取服务器的路径
			String dirPath = request.getServletContext().getRealPath(fpath);
			//图片重命名
			newName = UUID.randomUUID().toString()+"."+ext;
			//获取上传的图片具体路径
//上传的目标路径dirPath,http://www.krrymusic.xin/resources/blog/images/2016/09/14/
//和文件名称newName,d76d08e8-20d7-449e-adef-2a29dc5cd7db.png
			targetFile = new File(dirPath, newName); 
			//获取父目录
			File pfile = new File(targetFile.getPath());
			//判断如果目录不存在，先创建
			if(!pfile.exists())pfile.mkdirs();
			url = fpath+"/"+newName;
		}
		
		//上传文件到目标文件夹--文件的赋值
		file.transferTo(targetFile);// 文件上传
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", oldName);// 文件的原始名称
		map.put("newName", newName);// 文件的新名称（随机字符串）
		map.put("ext", ext);// 文件的后缀
		map.put("size", file.getSize());// 文件的真实大小
		map.put("url",url);// 获取文件的具体服务器的目录
		return JSONUtil.serialize(map);
	}
	
	/**
	 * 删除文件的方法，此方法失败
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/deleteFile")
	public String deleteFile(HttpServletRequest request,HttpServletResponse response){
		String DirPath = request.getParameter("oldfileName");
		File file = new File(DirPath);
//		System.out.println(DirPath);
//		System.out.println(file.delete());
		return "success";
	}
	
}
