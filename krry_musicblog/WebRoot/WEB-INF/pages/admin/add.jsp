<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="Description" content="乐诗博客是一个音乐、日记分享平台，我们致力于让用户发表自己的心情，分享自己喜爱的音乐，聆听你我的声音">
		<title>${user.username}</title>
		<%@include file="../common/common.jsp" %>
		<link rel="stylesheet" href="${basePath}/resource/js/upload/upload.css"/>
		<link rel="stylesheet" href="${basePath}/resource/css/add.css"/>
		<script type="text/javascript" src="${basePath}/resource/js/krry_upload.js"></script>
		<style>
			
		</style>
	</head>
	<body data-opid="${blog.ID}">
	<%@include file="../common/header.jsp"%>
		<div class="allping_con"></div>
		<div class="wrapbox">
			<div class="ke_tabbox">
				<!-- 内容区 -->
				<div class="container">
					<div class="c_condierlline">
						<a href="${basePath}" class="backnetwork"><span class="nextword nextwordfirst">首页</span></a>
						<img class="nextjming" src="${basePath}/resource/images/next.png" alt="下一级" width="15" height="15"><a href="${basePath}/admin/index" class="backnetwork"><span class="nextword">个人中心</span></a>
						<img class="nextjming" src="${basePath}/resource/images/next.png" alt="下一级" width="15" height="15"><a class="modifianoao" href="${basePath}/admin/add" class="backnetwork"><span class="nextword modififf">添加期刊</span></a>
					</div>
					<audio  id="audio" data-dir="blog/mp3" data-img="${blog.MUSICLINK}" data-link="${blog.MUSICLINK}" src="${basePath}/${blog.MUSICLINK}"></audio>
					<p id="lrc" data-dir="blog/lrc" data-img="${blog.MUSICLRCLINK}"></p>
					<div class="mbox">
						<img id="img" data-img="${blog.IMG}" data-link="${blog.IMG}" data-dir="blog/images" src="${basePath}/${blog.IMG}" class="ke_imgs"  width="960" height="360"/>
						<div class="p_over"></div>
						<div class="tit_over" style="background: rgba(0, 0, 0, 0.5);">
							<h1 class="edit">
								<input type="text" id="title" placeholder="输入标题" maxlength="50" value="${blog.TITLE}"/>
							</h1>
							<p>
								${user.username} @落花无意
								<span id="time">${blog.musictime}</span>/<span id="ptime">${blog.MUSICTIME}</span>
							</p>
							<a href="javascript:void(0);" onclick="krryifUpload(1);" title="上传图片" class="ke_opadd"><i class="iconfont icon-weibiaoti1 fz32"></i></a>
							<a href="javascript:void(0);" onclick="krryifUpload(2);" title="上传音乐" class="ke_opadd"><i class="iconfont icon-013shangchuanyinle fz32"></i></a>
							<a href="javascript:void(0);" onclick="playMusic(this)" title="试播放音乐" class="ke_opadd ke_oplaya"><i class="iconfont icon-bofang fz32"></i></a>
							<!-- 音轨的盒子 -->
							<div id="wrapbox"></div>
						</div>
					</div>
				
					<div class="content edit mt28">
						<textarea class="cntarea" id="description" placeholder="在这里填写博客内容，不超过1300字" onpropertychange="textchange(this);" oninput="textchange(this);">${blog.DESCRIPTION}</textarea>
					</div> 
					
					<div class="upload_lrc">
						<span class="uploadtextr">上传歌词（可选）：</span>
						<a href="javascript:void(0);" onclick="krryifUpload(3);" title="上传歌词" class="lrc_png"></a><span class="hideuploadlrc">${blog.MUSICLRC}</span>
						<span class="deleteLrc">删除歌词</span>
						<br><br>
						<p class="krrywen_wran">温馨提醒：请上传编码为UTF-8的lrc文件</p>
						<input type="hidden" id="musiclrclink" value="${blog.MUSICLRCLINK}"/>
						<!-- 是否是删除了歌词 1是删除 -->
						<p style="display:none" class="is_deleteLrc">${blog.ISDELETELRC}</p>
						<div class="clearfix"></div>
					</div>
					
					<div class="mcontent  mt28">
						<input type="hidden" id="musiclink" value="${blog.MUSICLINK}"/>
						<input type="text" id="musiclrc" hidden/>
						<p>音乐歌者：<input type="text" id="musictor" maxlength="20" value="${blog.MUSICTOR}"/></p>
						<p>音乐标题：<input type="text" id="musictitle" value="${blog.MUSICTITLE}" placeholder="上传成功后自动填写"/></p>
						<p>音乐大小：<input type="text" id="musicsize" value="${blog.MUSICSIZE}" placeholder="上传成功后自动填写" readonly="readonly"/></p>
						<p>音乐时长：<input type="text" id="musictime" value="${blog.MUSICTIME}" placeholder="上传成功后自动填写" readonly="readonly"/></p>
						<p style="margin-top: 23px;">
							<select id="categoryId">
								<option value="">--请选择分类--</option>
								<option value="1" ${blog.CATEGORYID==1?"selected='selected'":""}>摇滚</option>
								<option value="2" ${blog.CATEGORYID==2?"selected='selected'":""}>流行</option>
								<option value="3" ${blog.CATEGORYID==3?"selected='selected'":""}>中国风</option>
								<option value="4" ${blog.CATEGORYID==4?"selected='selected'":""}>轻音乐</option>
								<option value="5" ${blog.CATEGORYID==5?"selected='selected'":""}>怀旧</option>
								<option value="6" ${blog.CATEGORYID==6?"selected='selected'":""}>传奇</option>
							</select>
						</p>
					</div>
					<div class="buttoncnt mt28">
						<a href="${basePath}/admin/index">返回列表</a>			
						<a href="javascript:void(0);" onclick="krryAdminBlog.save(this)">保存期刊</a>
					</div> 
					<input type="file" class="hidden" id="file1" name="file1"  accept="image/jpeg,image/png,image/gif"  onchange="uploadFile()" />
					<input type="file" class="hidden" id="file2" name="file2"  accept="audio/mpeg"  onchange="uploadFile()" />
					<input type="file" class="hidden" id="file3" name="file3"  accept="lrc"  onchange="uploadFile()" />
					<!--ie678不支持--->
				</div>
			</div>
			<!-- end 内容区 -->
		</div>
		<!--底部-->
		<%@include file="../common/footer.jsp" %>
		<script type="text/javascript">
			//编辑状态下是有一个id
			var opid=$("body").data("opid");
			var isDeleteLrc = 0;//是否删除歌词
			
			//如果歌词已经删除
			if($(".is_deleteLrc").text() == 1){
				isDeleteLrc = 1;
			}
			//如果编辑状态
			if(isNotEmpty(opid)){
				$(".modififf").text("修改博客");
				$(".modifianoao").attr("href",location.href);
			}
			
			var krryAdminBlog = {
				//flagmp3:0,//监测是否重复上传，是。就删除旧文件
				//flagimg:0,
				//flaglrc:0,
				flagUploadOr:true,
				save:function(obj){
					var title=$("#title").val();
					var description=$("#description").val();
					var categoryId=$("#categoryId").val();
					var img=$("#img").data("link");
					var musiclink=$("#musiclink").val();
					var musiclrc=$(".hideuploadlrc").text();
					var musiclrclink = $("#musiclrclink").val();
					var musictor=$("#musictor").val();
					var musictitle=$("#musictitle").val();
					var musicsize=$("#musicsize").val();
					var musictime=$("#musictime").val();
					
					if(isEmpty(title)){
						$.tzAlert({content:"请您输博客标题",title:"Krry的温馨提示"});
						return;
					}
					if(isEmpty(img)){
						$.tzAlert({content:"请您上传图片",title:"Krry的温馨提示"});
						return;
					}
					
					if(isEmpty(description)){
						$.tzAlert({content:"请您输博客内容",title:"Krry的温馨提示"});
						return;
					}
					if(isEmpty(musiclink)){
						$.tzAlert({content:"请您上传音乐",title:"Krry的温馨提示"});
						return;
					}
					if(isEmpty(musictor)){
						$.tzAlert({content:"请您输入音乐歌者",title:"Krry的温馨提示"});
						return;
					}
					if(isEmpty(categoryId)){
						$.tzAlert({content:"请您选择分类",title:"Krry的温馨提示"});
						return;
					}
					
					var params = {
						title:title,		
						description:description,
						categoryId:categoryId,	
						img:img,		
						musiclink:musiclink,
						musiclrc:musiclrc,
						musiclrclink:musiclrclink,
						musictor:musictor,
						musicsize:musicsize,
						musictitle:musictitle,
						musictime:musictime,
						isDeleteLrc:isDeleteLrc
					};
					
					var method = "save";
					//如果编辑状态
					if(isNotEmpty(opid)){
						params["id"] = opid;
						method = "update";
						//编辑状态下，若重复上传文件，则删除旧文件,此方法不行
						/*if(krryAdminBlog.flagimg>0) deleteOldFile("#img");
						if(krryAdminBlog.flagmp3>0) deleteOldFile("#audio");
						if(krryAdminBlog.flaglrc>0) deleteOldFile("#lrc");*/
					}
					
					$("#tzloading").remove();//先移除
					$(".allping_con").show();
					loading("正在保存",900);//再展示
					
					$.ajax({
						type:"post",
						url:basePath+"/admin/"+method,
						data:params,
						success:function(data){
							if(data=="success"){
								//提示框去掉
								$("#tzloading").animate({"top":20},function(){
									$(this).remove();
								});
								$(".allping_con").hide();
								krryMessage.tip("保存成功!!!");
								//1秒后跳转回首页
								setTimeout(function(){
									window.location.href = basePath;
								},1000);
							}
						}
					});
				},
				init:function(){
					$(".ke_imgs").on("error",function(){
						$(this).attr("src",basePath+"/resource/images/noimg.jpg");
					});
					//删除歌词
					$(".deleteLrc").click(function(){
						if($(".hideuploadlrc").text()){
							$.tzAlert({content:"您确定删除吗？",title:"温馨提示",callback:function(ok){
								if(ok){
									isDeleteLrc = 1;
									$(".hideuploadlrc").text("");
									$(".uploadtextr").text("上传歌词（可选）：");
									$(".deleteLrc").hide();
								}
							}});
						}
					});
				}
			};
			//初始化
			krryAdminBlog.init();
			
			if($(".hideuploadlrc").text()){
				//如果删除了歌词
				if($(".is_deleteLrc").text()==1){
					$(".hideuploadlrc").text("");
				}else{
					$(".uploadtextr").text("更换歌词：");
					$(".deleteLrc").show();
				}
			}
			
			function krryifUpload(obj){
				if(obj == 1){
					if(krryAdminBlog.flagUploadOr){
						openBrowse(this,'#img');
					}else{
						$.tzAlert({content:"请等待文件上传成功后",title:"温馨提示"});
					}
				}else if(obj == 2){
					if(krryAdminBlog.flagUploadOr){
						openBrowse(this,'#audio');
					}else{
						$.tzAlert({content:"请等待文件上传成功后",title:"温馨提示"});
					}
				}else{
					if(krryAdminBlog.flagUploadOr){
						openBrowse(this,'#lrc');
					}else{
						$.tzAlert({content:"请等待文件上传成功后",title:"Krry的温馨提示"});
					}
				}
			}
			
			function krry_uploadsuccess(to,jdata){
				krryAdminBlog.flagUploadOr = true;
				$("#aspupload").animate({"height":0},function(){
					$(this).remove();
				});
				 
				if(jdata.target=="#img"){
					loading("图片上传完毕",3);
					//krryAdminBlog.flagimg++;//上传成功的标识
					$(jdata.target).data("link",jdata.url).attr("src",basePath+"/"+jdata.url+"?"+new Date().getTime());
				}else if(jdata.target=="#audio"){
					loading("歌曲上传完毕",3);
					//krryAdminBlog.flagmp3++;
					$(jdata.target).attr("src",basePath+"/"+jdata.url).data("link",jdata.url);
					var size = krry_countFileSize(jdata.size);
					$("#musicsize").val(size);
					$("#musictitle").val(trimTitle(jdata.name));
					$("#musiclink").val(jdata.url);
					audioDom.oncanplaythrough = function(){
						var time = this.duration;
						var m = Math.floor(time / 60);
						var s = Math.floor(time % 60);
						if(m<10) m = "0"+m;
						if(s<10) s = "0"+s;
						$("#musictime").val(m+":"+s);
						$("#ptime").val(m+":"+s);
					};
				}else if(jdata.target=="#lrc"){
					loading("歌词上传完毕",3);
					//krryAdminBlog.flaglrc++;
					$("#musiclrclink").val(jdata.url);
					$(".hideuploadlrc").text(jdata.name);
					$(".uploadtextr").text("更换歌词：");
					$(".deleteLrc").show(); //显示删除歌词按钮
					//修改IsDeleteLrc为0
					isDeleteLrc = 0;
				}
			}
			
			//删除旧文件 (此方法不行)
			/*function deleteOldFile(target){
				var oldfileName = $(target).data("img");//获取旧的文件路径
				if(!isEmpty(oldfileName)){ //如果不为空，说明要删除旧的文件
					$.ajax({
						type:"post",
						url:basePath+"/upload/deleteFile.do",
						data:{"oldfileName":basePath+"/"+oldfileName},
						success:function(data){
							if(data=="fail"){
								console.log("删除文件失败");
							}
						}
					});
				}
			}*/
			
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
			//截取音乐标题字符串，去掉后缀名
			function trimTitle(title){
				var tiIndex = title.lastIndexOf(".");
				return title.substring(0,tiIndex);
			}
			
			var audioDom = document.getElementById("audio");
			function playMusic(obj){
				var musiclink=$("#musiclink").val();
				if(isEmpty(musiclink)){
					$.tzAlert({content:"请您先上传音乐，再试播",title:"温馨提示"});
					return;
				}
				var $i = $(obj).find("i");
				if($i.hasClass("icon-bofang")){
					$(obj).find("i").removeClass("icon-bofang").addClass("icon-iconfont32");
					audioDom.play();
				}else{
					$(obj).find("i").removeClass("icon-iconfont32").addClass("icon-bofang");
					audioDom.pause();
				}
			}

			audioDom.addEventListener("ended",function(){
				$(".ke_oplaya").click();
			});
			
			function textchange(obj){
				if($(obj).val().length>1300){
					var text = $(obj).val().substring(0,1300);
					$(obj).val(text);
				}
					
			};
			
		</script>
  	</body>
</html>
