/*点击按钮的时候--伪装文件上传*/
var uploadTo = null;
function openBrowse(obj,to){ 
	//判断浏览器的兼容性问题
	var ie=navigator.appName=="Microsoft Internet Explorer" ? true : false; 
	if(ie){ //如果是ie浏览器
		if(to=="#img"){
			document.getElementById("file1").click(); 
		}else if(to=="#audio"){
			document.getElementById("file2").click(); 
		}else{
			document.getElementById("file3").click(); 
		}
	}else{
		var a=document.createEvent("MouseEvents");//FF的处理 
		a.initEvent("click", true, true);  
		if(to=="#img"){
			document.getElementById("file1").dispatchEvent(a); 
		}else if(to=="#audio"){
			document.getElementById("file2").dispatchEvent(a); 
		}else{
			document.getElementById("file3").dispatchEvent(a); 
		}
	} 
	uploadTo = to;
}; 

// 	Attributes	设置或返回文件或文件夹的属性
// 	DateCreated	返回指定文件或文件夹的创建时间
// 	DateLastAccessed	返回最近访问文件或文件夹的创建时间
// 	DateLastModified	返回最后修改指定文件和文件夹的日期和日期
// 	Drive	返回指定文件或文件夹所在的驱动器的驱动器号
// 	Name	设置或返回文件或文件夹的名称
// 	ParentFolder	返回指定文件或文件夹的父文件夹对象
// 	Path	返回指定文件或文件夹或驱动器的路径
// 	ShortName	返回短名称
// 	ShortPath	返回短路径
// 	Size	对于文件,以字节为单位返回指定文件的大小.
// 	对于文件夹,以字节为单位返回文件夹中包含的所有子文件夹中的所有文件和子文件夹的大小
// 	Type	返回文件或文件夹的信息.
//var fileName = "";
//var krrysize = "";

function uploadFile() {
	try{
		var fileObj = null;
		//获取文件上传的js列表对象
		if(uploadTo=="#img"){
			fileObj = document.getElementById("file1").files[0]; // js 获取文件对象
			if(fileObj.size>10485760){
		    	krryMessage.tip("请上传小于10MB的文件...");
		    	return;
		    }
			var ftype = fileObj.type.toLowerCase();
		    if(ftype!="image/jpeg" && ftype!="image/png" && ftype!="image/gif"){
		    	krryMessage.tip("请上传图片文件（jpg/png/gif）");
		    	return;
		    }
		}else if(uploadTo=="#audio"){
			fileObj = document.getElementById("file2").files[0]; // js 获取文件对象
			if(fileObj.size>15728640){
		    	krryMessage.tip("请上传小于15MB的音乐文件...");
		    	return;
		    }
			var ftype = fileObj.type.toLowerCase();
		    if(ftype!="audio/mp3" && ftype!="audio/wma" && ftype!="audio/aac" && ftype!="audio/m4a"){
		    	krryMessage.tip("请上传音乐文件（mp3/wma/aac/m4a）");	
		    	return;
		    }
		}else{
			fileObj = document.getElementById("file3").files[0]; // js 获取文件对象
			if(fileObj.size>10485760){
		    	krryMessage.tip("请上传小于10MB的文件...");
		    	return;
		    }
			var ftype = fileObj.name.substring(fileObj.name.lastIndexOf(".")+1); //无法直接获取lrc文件的后缀名，只能截取字符串
			if(ftype!="lrc"){
		    	krryMessage.tip("请上传歌词lrc文件");
		    	return;
		    }
		}
	    
	    
	    var imgsrc = $(uploadTo).data("img");
	    //创建一个FormData 对象
	    var form = new FormData();
	    //设置文件上传的文件对象
	    form.append("doc", fileObj);
	    //设定头像上传的目录
	    form.append("dir",$(uploadTo).data("dir"));
	    form.append("zip",$(uploadTo).data("zip")||"");
	    form.append("small",$(uploadTo).data("small")||"");
	    form.append("swidth",$(uploadTo).data("swidth")||"");
	    form.append("sheight",$(uploadTo).data("sheight")||"");
	    form.append("oldName",imgsrc||"");
		
		krryAdminBlog.flagUploadOr = false;
	    //创建上传进度条界面
	    var fileName = fileObj.name;//文件名
		var krrysize = krry_countFileSize(fileObj.size);//文件大小
		progressKrry(fileName,krrysize);
	    
	    // 创建一个ajax对象
	    var xhr = new XMLHttpRequest();
	    //开始和后台的upload.jsp页面进行交换
	    xhr.open("post", basePath+"/upload/file.do", true);
	    //上传成功进入的回调函数
	    xhr.onreadystatechange = function(){
			if(xhr.readyState==4 && xhr.status==200){//状态4和200代表和服务器端交互成功
				//获取上传成功的返回数据
				var data = xhr.responseText.trim();
				jdata = eval("("+data+")");
				jdata["target"]=uploadTo;
				krry_uploadsuccess($(uploadTo),jdata);
			}
		};
		//监听文件上传的进度
	    xhr.upload.addEventListener("progress", progressFunction, false);
		//发送文件上传的进度
	    xhr.send(form);
	}catch(e){
		
	}
	
};

//上传进度的回调函数
function progressFunction(event) {
  	var prograssbarDom = document.getElementById("prograssbar");
	var filesjin = document.getElementById("filesjin");
    if (prograssbarDom && event.lengthComputable) {
      	var percent = event.loaded / event.total;
  		var p = Math.floor(percent*100);
  		prograssbarDom.style.width = p+"%";
  		filesjin.innerHTML = p+"%";
    }
};

function progressKrry(fileName,krrysize){
	 var html =$("#aspupload").html();
 	 if(isEmpty(html)){
 		 if(fileName.length>20)fileName = fileName.substring(0,20)+"...";
 	   	 $("body").append("<div id='aspupload'><div class='headbar'>"+
 			 "		<span class='fl bar_title'>Krry上传组件</span></span>"+
 			 "		<span class='fr bar_total'></span>"+
 			 "		<a href='javascript:void(0);' id='enlarge' onclick='tm_expand_upload(this)' class='windowClick shrink'></a>"+
 			 "	</div>"+
 			 "	<div class='loadbar' id='mainloadarea' style='height: 345px; background: rgb(238, 238, 238);'>"+
 			 "		<ul id='uploaditembox'>"+
 			 "<li>"+
 			 "	<div class='load_area'>"+
 			 "			<div class='fl file_ico'></div>"+
 			 "			<div class='fl itembox'>"+
 			 "				<div class='load_info'>"+
 			 "					<span class='loaded' style='display:none'><img src='"+basePath+"/resource/js/upload/loading2.gif'/></span>"+
 			 "					<span class='filename'>"+fileName+"</span>"+
 			 "					<span class='filesize'>大小："+krrysize+"</span>"+
			 "					<span id='filesjin'></span>"+
 			 " 				</div>"+
 			 "				<div class='uppbox'>"+
 			 "					<div class='up-prograss' id='prograssbar' style='width: 0%'></div>"+
 			 "				</div>"+
 			 "			</div>"+
 			 //"			<a class='fr' href='javascript:void(0);' data-opid='"+file.id+"' onclick='tm_delete_file(this)'>删除</a>"+
 			 "	</div>"+
 			 "	</li>"+
 			 "		</ul>"+
 			 "	</div>"+
 			 "</div>");
 	}
}

function krry_countFileSize(size) {
	var fsize = parseFloat(size, 2);
	var fileSizeString;
	if (fsize < 1024) {
		fileSizeString = fsize.toFixed(2) + "B"; //保留两位小数
	} else if (fsize < 1048576) {
		fileSizeString = (fsize / 1024).toFixed(2) + "KB";
	} else if (fsize < 1073741824) {
		fileSizeString = (fsize / 1024 / 1024).toFixed(2) + "MB";
	} else if (fsize < 1024 * 1024 * 1024) {
		fileSizeString = (fsize / 1024 / 1024 / 1024).toFixed(2) + "GB";
	} else {
		fileSizeString = "0B";
	}
	return fileSizeString;
};

/*折叠上传框*/
function tm_expand_upload(obj){
	if($(obj).hasClass("shrink")){
		$(obj).removeClass("shrink").addClass("enlarge");
		$("#mainloadarea").animate({"height":0});
	}else{
		$(obj).removeClass("enlarge").addClass("shrink");
		$("#mainloadarea").animate({"height":345});
	}
}
