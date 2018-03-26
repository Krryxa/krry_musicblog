<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<meta name="Keywords" content="${keywords},乐诗,krrymusic,音乐博客,博客,musicblog,音乐分享,音乐分类,音乐专题,摇滚,流行,中国风,怀旧,轻音乐,传奇,音乐互动,博文心情,言论自由">
		<meta name="Description" content="乐诗博客是一个音乐、日记分享平台，我们致力于让用户发表自己的心情，分享自己喜爱的音乐，聆听你我的声音">
		<title>搜索  “${keywords}”</title>
		<link rel="stylesheet" href="${basePath}/resource/css/searchBlog.css" />
		<link rel="stylesheet" href="${basePath}/resource/css/style.css" />
		<link rel="stylesheet" href="${basePath}/resource/font/iconfont.css" />
		<link type="text/css" rel="stylesheet" href="${basePath}/resource/sg/css/sg.css" />
		<link rel="stylesheet" href="${basePath}/resource/css/animate.css"/>
		<link rel="stylesheet" href="${basePath}/resource/css/krry_animateLoading.js.css"/>
		<link rel="stylesheet" href="${basePath}/resource/css/krry_returnTop.css"/>
		
		<script type="text/javascript" src="${basePath}/resource/js/jquery-1.11.2.min.js" ></script>
		<script type="text/javascript" src="${basePath}/resource/js/krry_util.js"></script>
		<script type="text/javascript" src="${basePath}/resource/js/krry_animateLoading.js"></script>
		<script type="text/javascript" src="${basePath}/resource/js/krry_admin.js"></script>
		<script type="text/javascript" src="${basePath}/resource/sg/tz_util.js"></script>
		<script type="text/javascript" src="${basePath}/resource/sg/sg.js"></script>
		<script type="text/javascript">var basePath="${basePath}";</script>
	</head>
	<body data-keywords="${keywords}">
		<%@include file="../common/header.jsp" %>
		<!-- 内容区 -->
		<div class="wrapbox">
			<div class="container">
				<a href="${basePath}" class="backnetwork"><span class="icon_backont">&lt;</span><span class="nextword">返回首页</span></a><br>
				<div class="w_weform">
					<form class="search-form" action="${basePath}/blog/searchBlog" method="get" onkeydown="if(event.keyCode==13)return false;">
						<input type="text" class="keyword rounded" maxlength="18" placeholder="查找你喜欢的内容" name="searchkeywords">
						<button type="button" class="btn roundedbtn">
							<span class="icon-search-w"></span>
							搜索
						</button>
						<button class="submitsearch" type="submit" style="display:none;"></button>
						<div class="clear"></div>
					</form>
					<p id="keyword_desc">${keywords}</p>
					<p class="box_desc">搜索"<span class="b_d_keyw">${keywords}</span>"，找到 <span class="key_count"></span> 个相关博客</p>
					<div class="all_v_ttmore" style="top:82px;">
				 		<a href="${basePath}/blog/kindOfBlog/1">摇滚</a>
				 		<a href="${basePath}/blog/kindOfBlog/2">流行</a>
				 		<a href="${basePath}/blog/kindOfBlog/3">中国风</a>
				 		<a href="${basePath}/blog/kindOfBlog/4">轻音乐</a>
				 		<a href="${basePath}/blog/kindOfBlog/5">怀旧</a>
				 		<a href="${basePath}/blog/kindOfBlog/6">传奇</a>
				 		<a href="${basePath}/blog/AllBlog">更多></a>
			 			<div class="clear"></div>
			 		</div>
				</div>
				<div class="hideAdd animated rotateIn">
					<p class="aljie">没有找到与"<span class="b_d_keyw">${keywords}</span>"相关的博客，换个关键词试试吧^_^</p>
				</div>
				 <div class="w_left_others w_group" style="float:none;">
				 	<!-- 内容区域 -->
				 	<div class="cntbox">
				 		<ul id="databox">
				 		</ul>
					 	<div class="loadmore">下拉加载更多博客...</div>
				 	</div>
				 </div>
				 <div class="clearfix"></div>
			</div>
		</div>
		<div class="clearfix"></div>
		<!-- end 内容区 -->
		<!--底部-->
		<%@include file="../common/footer.jsp" %>
		<script type="text/javascript">
		//隐藏头部的搜索框
		$(".boxsinput").hide();
		
		$(".roundedbtn").click(function(){
			//如果不为空，才可以搜索
			if(!isEmpty($(".keyword").val())){
				var text = $(".keyword").val();
				$(".keyword").val($.trim(text)); //截取关键字首尾的空白字符
				$(".submitsearch").trigger("click");
			}
		});
		
		$(".keyword").focus(function(){
			$(this).css({
				"background":"#fff",
			});
			//敲回车也能搜索
			$(document).keydown(function(e){
				if(e.keyCode==13 && !isEmpty($(".keyword").val())){
					var text = $(".keyword").val();
					$(".keyword").val($.trim(text)); //截取关键字首尾的空白字符
					$(".submitsearch").trigger("click");
				}
			});
		});
		$(".keyword").blur(function(){
			$(this).css({
				"background":"#f2f2f2",
			});
			//失焦时解除绑定回车事件 
			$(document).unbind("keydown");
		});
		
		
		var krrysearchBlog = {
				coutBlog:0,
				pageNo:0,
				pageSize:10,
				nowTime:0,
				mark:true,
				timer:null,
				loadWind:function(){
					var closeee = false;
					//当滚动条到达距离底部180px时
					$(window).scroll(function(){
						if(!closeee){
							closeee = true;
							return;
						}
						clearTimeout(krrysearchBlog.timer);
						//可视高度
			            var cheight = window.innerHeight || documentcumentElement.clientHeight;
			            // 滚动条高度
			            var ctop = document.body.scrollTop ||documentcumentElement.scrollTop;

			           //文档的高度
			           	if(cheight+ctop+60 > document.body.scrollHeight && krrysearchBlog.mark){
			           		krrysearchBlog.timer = setTimeout(function(){
			           			loadingmore($(".loadmore"));
			           			krrysearchBlog.loadData();
			           		},200);
			           		
			           }
					});
				},
				loadData:function(){
					krrysearchBlog.pageNo++;
					this.load();
				},
				load:function(){
					if(new Date() - krrysearchBlog.nowTime > 200){
						krrysearchBlog.nowTime = new Date();
						if(!krrysearchBlog.mark)return;
						var keywords = $("body").data("keywords");
						if(isNaN(keywords))keywords = keywords.toLowerCase();//不是纯数字就转成小写，模糊查询需要
						var pno = krrysearchBlog.pageNo * krrysearchBlog.pageSize; 
			 			var psize = krrysearchBlog.pageSize*(krrysearchBlog.pageNo+1);
			 			var params = {
			 				keywords:keywords,
			 				pageNo:pno,
			 				pageSize:psize
			 			};
						$.ajax({
							type:"post",
							url:basePath+"/blog/searchBlogRes",
							data:params,
							success:function(data){
								if(data){
									krrysearchBlog.coutBlog += 10;
									var dataArr = data.blogs;//从map集合中拿出博客
									var len = dataArr.length;
									var countBlogs = data.coutBlogs;//总的博客数量
									//设置数量
									$(".wrapbox .box_desc").find(".key_count").text(countBlogs);
									
									if(countBlogs > 10){
										$(".loadmore").show();
									}
									if(countBlogs == 0){
										$(".hideAdd").show();
										$(".clearfix").css("height","0");
									}
									
									var html = "";
									for(var i = 0;i < len;i++){
										var datajson = dataArr[i];
										var desc = datajson.DESCRIPTION;
										if(desc.length>68)desc = desc.substring(0,68)+"...";
										html += "<li class='items'>"+
									 	"	<a href='"+basePath+"/blog/detail/"+datajson.ID+"' class='imgbox pr'>"+
									 	"		<img class='lazy' alt='"+datajson.TITLE+"' src='"+basePath+"/"+datajson.IMG+"' style='display: inline;' />"+
									 	"		<div class='iover'></div>"+
									 	"		<img class='i_playindex' src='"+basePath+"/resource/images/cover_play.png' width='40' height='40'/>"+
									 	"	</a>"+
									 	"	<div class='slbox'>"+
									 	"		<h3 class='title'><a href='"+basePath+"/blog/detail/"+datajson.ID+"'>"+datajson.TITLE+"</a></h3>"+
									 	"		<p class='info'>"+
									 	"			<span><i class='iconfont icon-time' title='创建时间'></i>"+datajson.CREATETIME+"</span>"+
									 	"			<span class='commentsCenter'><i class='iconfont icon-pinglun' title='评论数'></i>"+datajson.COMMENTS+"</span>"+
									 	"			<span><i class='iconfont icon-dianji' title='点击数'></i>"+datajson.HITS+"</span>"+
									 	"			<span class='comentrightz'><i class='iconfont icon-zhuanti1' title='专题'></i><a class='usercateyid' href='"+basePath+"/blog/kindOfBlog/"+datajson.CATEGORYID+"'>"+datajson.NAME+"</a></span>"+
									 	"		</p>"+
										"		<p title='作者' class='usernamemusicBlog'>作者：<a class='userIdmusicBlog' href='"+basePath+"/blog/personBlog/"+datajson.USERID+"'>"+datajson.USERNAME+"</a></p>"+
									 	"		<p class='desc'>"+desc+"</p>"+
									 	"	</div>"+
									 	"</li>";
									}
									$("#databox").append(html);
									if(countBlogs <= krrysearchBlog.coutBlog){
										krrysearchBlog.mark = false;
										$(".loadmore").hide();
									}else{
										$(".loadmore").html("<span>下拉加载更多博客...</span>");
									}
									//document.body.scrollTop = document.body.scrollHeight;
								}else{
									krrysearchBlog.mark = false;
									$(".loadmore").hide();
				 				}
								//图片损坏的处理方案
								$("img").on("error",function(){
									$(this).attr("src",basePath+"/resource/images/noimg.jpg");
								});
				 			}
				 		});
					}
				}
			};
			$(function(){
				var height = $(window).height();
				height = height - 278;
				$(".wrapbox").css("min-height",height);
				$(window).resize(function(){
					height = $(window).height();
					height = height - 278;
					$(".wrapbox").css("min-height",height);
				});
				
				//关键词的溢出处理
				var keywordddd = $("#keyword_desc").text();
				if(keywordddd.length>18)keywordddd = keywordddd.substring(0,18)+"......";
				$(".b_d_keyw").text(keywordddd);
				
				krrysearchBlog.loadWind();
				krrysearchBlog.load();
			});
		</script>
	</body>
</html>