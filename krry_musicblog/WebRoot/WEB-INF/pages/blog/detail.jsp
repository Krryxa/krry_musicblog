<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<meta name="Keywords" content="${blog.TITLE},${blog.USERNAME},${blog.MUSICTITLE},${blog.MUSICTOR},${blog.NAME},乐诗,krrymusic,音乐博客,博客,musicblog,音乐分享,音乐分类,音乐专题,摇滚,流行,中国风,怀旧,轻音乐,传奇,音乐互动,博文心情,言论自由">
		<meta name="Description" content="  --乐诗博客是一个音乐、日记分享平台，我们致力于让用户发表自己的心情，分享自己喜爱的音乐，聆听你我的声音">
		<title>${blog.TITLE} --${blog.USERNAME}</title>
		<%@include file="../common/common.jsp" %>
		<link rel="stylesheet" href="${basePath}/resource/css/detail.css"/>
		<script type="text/javascript" src="${basePath}/resource/js/krry_music.js" ></script>
		<script type="text/javascript" src="${basePath}/resource/js/krry_play.js" ></script>
		<script type="text/javascript" src="${basePath}/resource/js/krry_detail.js"></script>
		<script type="text/javascript" src="${basePath}/resource/js/krry_morecomment.js"></script>
	</head>
	<body data-logid="${user.id}" data-opid="${blog.ID}" data-typeid="${blog.CATEGORYID}">
		<!--头部-->
		<%@include file="../common/header.jsp" %>
		<!-- 内容区 -->
		<div class="wrapbox" id="wrapboxfcon">
			<div class="container" id="mobesfcon">
				<a class="con_backAblue" href="${basePath}/blog/AllBlog" class="backnetwork"><span class="icon_backont">&lt;</span><span class="nextword">返回期刊首页</span></a>
				<div class="mbox" id="mboxbb">
					<p id="blogUserId" style="display:none;">${blog.USERID}</p>
					<img src="${basePath}/${blog.IMG}" alt="${blog.MUSICTITLE}" width="960" height="360"/>
					<div class="tit_over">
						<h1><i class="iconfont icon-music fz32" style="display:inline-block"></i>${blog.TITLE}</h1>
						<p class="authormusicBlog">作者：
							<a class="b_linka" href="${basePath}/blog/personBlog/${blog.USERID}" target="_blank" title="点击查看${blog.USERNAME}发布的音乐博客">${blog.USERNAME}</a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;歌手：
							<a class="b_linka" href="${basePath}/blog/searchBlog?searchkeywords=${blog.MUSICTOR}" target="_blank" title="点击搜索${blog.MUSICTOR}">${blog.MUSICTOR}</a>
						</p>
						<p><span class="createTime">${blog.CREATETIME}</span><span class="musicTitlem">${blog.MUSICTITLE}</span> 
							<i class="timermusic"><span id="time">${blog.MUSICTIME}</span>/<span id="ptime">00:00</span></i>
						</p>
						<a href="javascript:void(0);" title="快捷键Ctrl+Enter" class="ke_op"><i class="iconfont icon-bofang fz64"></i></a>
						<!-- 音轨的盒子 -->
						<div id="wrapbox"></div>
					</div>
					<div class="controlTime" id="conTimes">
						<div class="c_played" id="c_playplay"></div>
						<div class="c_cing">
							<div class="c_curr" id="c_currcurr"></div>
						</div>
					</div>
				</div>
				<audio src="${basePath}/${blog.MUSICLINK}" id="audio"></audio>
				<div class="pis_fvc">
					<p class="fvc_pp">
						<span class="pis-fcc3">专题：<a href="${basePath}/blog/kindOfBlog/${blog.CATEGORYID}" target="_blank" title="点击查看专题：${blog.NAME}">${blog.NAME}</a></span>
						<span class="pis-fvcsapn">评论数：<span class="p_s_numf">${blog.COMMENTS}</span></span>
						<span class="pis-fc2">/</span>
						<span class="pis-fvcsapn">点击数：${blog.HITS}</span>
					</p>
				</div>
				<div class="content mt8">
					${blog.DESCRIPTION}
				</div>
				<!-- 歌词区域 -->
				<div class="lrc_muit">
					<img class="lrcbackgreen" width="860" height="539" alt="歌词背景" src="${basePath}/resource/images/lrcback.jpg" />
					<div class="lrc_content">
						<div class="lrc_currjz">
							<p class="musictitle_lrc">${blog.MUSICTITLE}</p>
							<div class="lc_ball">
								<!--音量控制-->
								<div class="b_ball">
									<div class="a_small"></div>
									<div class="a_big">
										<div class="a_current"></div>
									</div>
								</div>
								<div class="b_muit"></div>
							</div>
							<!-- 全屏歌词按钮 -->
							<div class="complelrc" title="全屏歌词"><img src="${basePath}/resource/images/backlrc.png" alt="歌词按钮" width="20" height="20"/></div>
							<!-- 歌词区域 -->
							<div class="lrc_content_box">
								<p class="lrc_content_notext"></p>
								<ul id="lrcly">
								</ul>
							</div>
							<!-- 歌词区域的进度条 -->
							<div class="lrccontroll" id="listControllerlrc">
								<div class="b_ballcontroll" id="controlllrcID">
									<div class="a_smallcontroll" id="small_lrcID"></div>
									<div class="a_bigcontroll" id="big_lrcID">
										<div class="a_currentcontroll" id="current_lrcID"></div>
									</div>
								</div>
							</div>
							<div class="timeontheroot"><span id="ptime2">00:00</span>/${blog.MUSICTIME}</div>
							<!-- 存放歌词的路径 -->
							<p style="display:none;" class="hidetextlrc">${blog.MUSICLRCLINK}</p>
							<!-- 是否是删除了歌词 1是删除 -->
							<p style="display:none" class="is_deleteLrc">${blog.ISDELETELRC}</p>
						</div>
					</div>
				</div>
				
				<!-- 全屏歌词 -->
				<div class="l_con">
					<span class="con_close">×</span>
					<img src="${basePath}/${blog.IMG}" height="200" alt="专题"/>
					<p class="con_title">${blog.MUSICTITLE}</p>
					<ul id="lyrics">
						<li style="line-height:255px;height:255px;text-align:center;font-size:18px;color:#FB2727;font-weight:bold;">暂无歌词</li>
					</ul>
				</div>
				
				<!-- 相关期刊 -->
				<div class="relation">
					<p class="re_h1">
						<i class="iconfont icon-zhuanti fz32 relafz32"></i>
						<span class="re_spanre">相关期刊</span>
						<a class="re_spanname respan_a" href="${basePath}/blog/kindOfBlog/${blog.CATEGORYID}" target="_blank" title="点击查看专题：${blog.NAME}">${blog.NAME}</a><span class="re_spanname">更多相关期刊：</span>
					</p>
					<ul id="relationbox">
						
					</ul>
				</div>
	
				<div class="clearfix"></div>
				
				<!-- 评论 -->
				<div class="pititle">
					<i class="iconfont icon-pinglun desc-pinglun" title="评论数"></i><span class="pif-ff2">评论</span>
					<span class="pis-fc3">共 <span class="pi-flag">${blog.COMMENTS}</span> 条评论</span>
				</div>
				<div id="comments">
					<div class="areabox">
						<textarea id="content" maxlength="400" onkeyup="krryRealtion.setCacheData(this)" placeholder="请输入你要讲评论(不超过400字)..."></textarea>
						<div class="subtn"><a href="javascript:void(0);" onclick="krryRealtion.saveComment(this)" class="fr"><i class="iconfont icon-fasong"></i><span class="text">发表评论</span></a></div>
					</div>
					<hr class="comment_hr"/>
					<div class="commentbox" id="krrycommentbox"></div>
					<div class="commentmore" style="display:none;">下拉加载更多评论</div>
				</div>
				<!--ie678不支持--->
			</div>
		</div>
		<!-- end 内容区 -->
		
		
		<!--底部-->
		<%@include file="../common/footer.jsp" %>
		
		<script>
			String.prototype.replaceAll = function(s1,s2){
				return this.replace(new RegExp(s1,"gm"), s2);
			};
			var massage = $(".mt8").text();
			massage = massage.replaceAll("\n","<br>");
			$(".mt8").html(massage);


			var createTime = $(".createTime").text();
			createTime = createTime.substring(0,10);
			$(".createTime").text(createTime);

			function trimTitle(title){
				var tiIndex = title.lastIndexOf(".");
				//如果没有后缀名
				if(tiIndex == -1) return title;
				else return title.substring(0,tiIndex);
			}
			
			var musicTitle = $(".musicTitlem").text();
			$(".musicTitlem").text(trimTitle(musicTitle));
			$(".musictitle_lrc").text(trimTitle(musicTitle));
			$(".con_title").text(trimTitle(musicTitle));
			
			//歌词进度条的显示
			$(".lrc_currjz").hover(function(){
				$(".lrccontroll").stop().fadeIn(150);
			},function(){
				$(".lrccontroll").stop().fadeOut(150);
			});
			
			//键盘事件
			document.onkeyup = function(ev){
				var e = ev||window.event;
				//按下回车键（13）加ctrl键执行
				if( e.keyCode==13 && e.ctrlKey ){
					$(".ke_op").click();
				}
			};
			
		</script>
	</body>
</html>