<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<meta name="Keywords" content="乐诗,krrymusic,音乐博客,博客,musicblog,音乐分享,音乐分类,音乐专题,摇滚,流行,中国风,怀旧,轻音乐,传奇,音乐互动,博文心情,言论自由">
		<meta name="Description" content="乐诗博客是一个音乐、日记分享平台，我们致力于让用户发表自己的心情，分享自己喜爱的音乐，聆听你我的声音">
		<title>乐诗博客 - 音乐分享、博文心情、言论自由</title>
		<%@include file="../common/common.jsp" %>
		<link rel="stylesheet" type="text/css" href="${basePath}/resource/css/bigBanner.css" />
		<link rel="stylesheet" href="${basePath}/resource/css/smallBanner.css"/>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<!-- 内容区 -->
		<div class="wrapbox">
			<!-- Banner -->
			<div class="boxbig">
				<div id="slidbig">
					<ul>
						<li style="display:block;opacity:1">
							<a href="${basePath}/blog/detail/${blogsBan[0].ID}.do">
								<img src="${basePath}/${blogsBan[0].IMG}" alt="${blogsBan[0].TITLE}" width="960" height="360"/>
							</a>
						</li>
						<li>
							<a href="${basePath}/blog/detail/${blogsBan[1].ID}.do">
								<img src="${basePath}/${blogsBan[1].IMG}" alt="${blogsBan[1].TITLE}" width="960" height="360"/>
							</a>
						</li>
						<li>
							<a href="${basePath}/blog/detail/${blogsBan[2].ID}.do">
								<img src="${basePath}/${blogsBan[2].IMG}" alt="${blogsBan[2].TITLE}" width="960" height="360"/>
							</a>
						</li>
						<li>
							<a href="${basePath}/blog/detail/${blogsBan[3].ID}.do">
								<img src="${basePath}/${blogsBan[3].IMG}" alt="${blogsBan[3].TITLE}" width="960" height="360"/>
							</a>
						</li>
						<li>
							<a href="${basePath}/blog/detail/${blogsBan[4].ID}.do">
								<img src="${basePath}/${blogsBan[4].IMG}" alt="${blogsBan[4].TITLE}" width="960" height="360"/>
							</a>
						</li>
					</ul>
					<div class="earbig">
						<div class="eebig" id="prevbig"></div>
						<div class="eebig" id="nextbig"></div>
					</div>
				</div>
				<div id="tabbig">
					<a href="javascript:void(0);" class="selbig"></a>
					<a href="javascript:void(0);"></a>
					<a href="javascript:void(0);"></a>
					<a href="javascript:void(0);"></a>
					<a href="javascript:void(0);"></a>
				</div>
			</div>
			<!-- 分割线 -->
			<div class="indexxianleft"></div>
			<!-- 中心 -->
			<div class="left_right">
				<!-- 中心中心 -->
				<div class="w_left">
				 	<!-- 内容区域 -->
				 	<div class="cntbox">
				 		<div class="c_concenterone">
					 		<div class="c_litt_div"><h3 class="c_litt_title"><span></span>精选博客</h3><div class="clear"></div></div>
					 		<div class="cheader"  id="cheaderbox">
						 		<!-- 大图片 -->
						 		<div class="bg_pic pr">
									<div class="iover2"></div>
									<div class="imgi">
										<img src="${basePath}/${blogsTop[0].IMG}" alt="${blogsTop[0].TITLE}"/>
									</div>
									<a href="${basePath}/blog/detail/${blogsTop[0].ID}.do" title="${blogsTop[0].TITLE}" class="btext">
										<p class="cp_h1">${blogsTop[0].TITLE}<span class="bigauthorbot">作者：${blogsTop[0].USERNAME}</span></p>
									</a>
								</div>
								<!-- 小图片 -->
								<div class="small_pic pr">
									<div class="iover2"></div>
									<div>
										<img src="${basePath}/${blogsTop[1].IMG}" alt="${blogsTop[1].TITLE}"/>
									</div>
									<a href="${basePath}/blog/detail/${blogsTop[1].ID}.do" title="${blogsTop[1].TITLE}" class="btext2">${blogsTop[1].TITLE}</a>
									<span class="small_authorbot">作者：${blogsTop[1].USERNAME}</span>
								</div>
								<div class="small_pic pr last_smal_pic">
									<div class="iover2"></div>
									<div>
										<img src="${basePath}/${blogsTop[2].IMG}" alt="${blogsTop[2].TITLE}"/>
									</div>
									<a href="${basePath}/blog/detail/${blogsTop[2].ID}.do" title="${blogsTop[2].TITLE}" class="btext2">${blogsTop[2].TITLE}</a>
									<span class="small_authorbot">作者：${blogsTop[2].USERNAME}</span>
								</div>
								<div class="clear"></div>
						 	</div>
						 </div>
					 	<div class="list_xian"></div>
					 	<div class="c_conleftt">
						 	<div class="c_litt_div"><h3 class="c_litt_title"><span></span>最新期刊</h3>
						 		<div class="v_ttmore">
							 		<a href="${basePath}/blog/kindOfBlog/1.do" target="_blank">摇滚</a>
							 		<a href="${basePath}/blog/kindOfBlog/2.do" target="_blank">流行</a>
							 		<a href="${basePath}/blog/kindOfBlog/3.do" target="_blank">中国风</a>
							 		<a href="${basePath}/blog/kindOfBlog/4.do" target="_blank">轻音乐</a>
							 		<a href="${basePath}/blog/kindOfBlog/5.do" target="_blank">怀旧</a>
							 		<a href="${basePath}/blog/kindOfBlog/6.do" target="_blank">传奇</a>
							 		<a href="${basePath}/blog/AllBlog.do" target="_blank">更多></a>
						 			<div class="clear"></div>
						 		</div>
						 		<div class="clear"></div>
						 	</div>		 	
						 	<div class="listbox">
						 		<ul id="databox">
						 			<div class="data_test">
						 			<!-- 最新博客 -->
						 				<c:forEach items="${blogsNew}" var="list">
								 			<li class="items">
												<a href="${basePath}/blog/detail/${list.ID}.do" class="imgbox pr">
													 <img class="lazy" alt="${list.TITLE}" src="${basePath}/${list.IMG}" style="display: inline;" />
													 <div class="iover"></div>
													 <img class="i_playindex" src="${basePath}/resource/images/cover_play.png" alt="播放按钮" width="40" height="40"/>
												</a>
										 		<div class="slbox">
										 			<h3 class="title"><a href="${basePath}/blog/detail/${list.ID}.do">${list.TITLE}</a></h3>
										 			<p class="info">
										 				<span><i class="iconfont icon-time" title="创建时间"></i>${list.CREATETIME}</span>
										 				<span class="commentsCenter"><i class="iconfont icon-pinglun" title="评论数"></i>${list.COMMENTS}</span>
										 				<span><i class="iconfont icon-dianji" title="点击数"></i>${list.HITS}</span>
														<span class="comentrightz"><i class="iconfont icon-zhuanti1" title="专题"></i><a class="usercateyid" href="${basePath}/blog/kindOfBlog/${list.CATEGORYID}.do">${list.NAME}</a></span>
										 			</p>
													<p title="作者" class="usernamemusicBlog">作者：<a class="userIdmusicBlog" href="${basePath}/blog/personBlog/${list.USERID}.do">${list.USERNAME}</a></p>
										 			<p class="desc">${list.DESCRIPTION}</p>
										 		</div>
										 	</li>
									 	</c:forEach>
									 </div>
						 		</ul>
						 	</div>
					 	</div>
					 	<div class="loadmore">下拉加载更多博客</div>
					 	<!-- <a href="javascript:void(0);" onclick="krryBlog.loadData(this)" class="loadmoreA"><i class="iconfont icon-jiazai"></i><span class="text">加载更多数据</span></a> -->
				 		<!-- 右侧 -->
					 	<div class="wt_rightcon">
							<div class="w_right" id="wrighHot">
							 	<div class="hitwringw">
								 	<span class="hotimgban"><img alt="热门" src="${basePath}/resource/images/most.png" width="22"/></span><span class="hotbang">热门期刊</span>
									<p class='pull-right frranie'><span>${blogsHot.HITS}</span>次点击</p>
								</div>
								<div class='bg_pic pr' id='rightHot'>
									<div class='Hotitems'>
										<a class="conHover" href="${basePath}/blog/detail/${blogsHot.ID}.do" title="${blogsHot.TITLE}">
											<div class="hotcontainerimg">
												<img src="${basePath}/${blogsHot.IMG}" alt="${blogsHot.TITLE}" width='303' height='200'/>
												<div class="iover"></div>
												<img class="i_playindex" src="${basePath}/resource/images/cover_play.png" alt="播放按钮" width="40" height="40"/>
											</div>
										</a>
										<div class='back'>
											<span class="b_spant1">${blogsHot.TITLE}</span>
											<span class="b_spant2">-${blogsHot.USERNAME}</span>
										</div>
									</div>
								</div>
							</div>
							 <!-- 推荐期刊 -->
							 <div class="tuijianqikan">
							 	<i class="recombang iconfont icon-zhuanti fz32 relafz32"></i><span class="recombang reconsize">推荐期刊</span>
							 </div>
							 <!--Banner-->
							 <div class="c_Bannercontainer">
								 <div class="c_canBanner" id="c_smallbanner">
									<ul>
										<c:forEach items="${blogsRecom}" var="list">
											<li>
												<a href="${basePath}/blog/detail/${list.ID}.do">
													<img src="${basePath}/${list.IMG}" alt='${list.TITLE}' width='303' height='200'/>
												</a>
												<p class='recomtextover'>${list.TITLE}</p>
												<span class='authorrecom'>作者：${list.USERNAME}</span>
											</li>
										</c:forEach>
									</ul>
									<div class="clearfix" style="height:0"></div>
								 </div>
								 <a href="javascript:void(0)" title="上一张" class="btnBan c_last"></a>
								 <a href="javascript:void(0)" title="下一张" class="btnBan c_next"></a>
								 <div class="c_bottom">
									<div class="b_cir"><a href="javascript:void(0)" class="c_bta btnSelect"></a></div>
									<div class="b_cir"><a href="javascript:void(0)" class="c_bta"></a></div>
									<div class="b_cir"><a href="javascript:void(0)" class="c_bta"></a></div>
									<div class="b_cir"><a href="javascript:void(0)" class="c_bta"></a></div>
								 </div>
							 </div>
							 <!-- 特别感谢 -->
							 <div id="speciThanks">
							 	<div class="c_litt_div"><h3 class="c_litt_title"><span></span>特别感谢</h3><div class="clearfix" style="height:0"></div></div>
							 	<ul>
							 		<li style="margin-top:0;margin-left:0">
							 			<img alt="特别感谢" src="${basePath}/resource/images/thank/my.jpg" width="87" height="87" />
							 			<span style="color:#dd5862">my</span>
							 		</li>
							 		<li style="margin-top:0;">
							 			<img alt="特别感谢" src="${basePath}/resource/images/thank/ling.jpg" width="87" height="87" />
							 			<span>好朋友、玲</span>
							 		</li>
							 		<li style="margin-top:0;">
							 			<img alt="特别感谢" src="${basePath}/resource/images/thank/bo.jpg" width="87" height="87" />
							 			<span>德哥</span>
							 		</li>
							 		<li style="margin-left:0;">
							 			<img alt="特别感谢" src="${basePath}/resource/images/thank/Arry.jpg" width="87" height="87" />
							 			<span>Arry老师</span>
							 		</li>
							 		<li>
							 			<img alt="特别感谢" src="${basePath}/resource/images/thank/KEKE.jpg" width="87" height="87" />
							 			<span>KeKe老师</span>
							 		</li>
							 		<li>
							 			<img alt="特别感谢" src="${basePath}/resource/images/thank/yu.jpg" width="87" height="87" />
							 			<span>淑琼</span>
							 		</li>
							 		<li style="margin-left:0;">
							 			<img alt="特别感谢" src="${basePath}/resource/images/thank/zhong.jpg" width="87" height="87" />
							 			<span>巧巧</span>
							 		</li>
							 		<li>
							 			<img alt="特别感谢" src="${basePath}/resource/images/thank/gui.jpg" width="87" height="87" />
							 			<span>林小姐</span>
							 		</li>
							 		<li>
							 			<img alt="特别感谢" src="${basePath}/resource/images/thank/jing.jpg" width="87" height="87" />
							 			<span>精灵</span>
							 		</li>
							 		<div class="clearfix"></div>
							 	</ul>
							 	<div class="Thanhengxian"></div>
							 	<p class="thankword">感谢你们的支持和意见</p>
							 </div>
						</div>
				 	</div>
				 </div>
				 <div class="clearfix"></div>
			 </div>
		</div>
		<div class="clearfix"></div>
		<!-- end 内容区 -->
		<!--底部-->
		<%@include file="../common/footer.jsp" %>
		<script type="text/javascript" src="${basePath}/resource/js/krry_bigBanner.js"></script>
		<script type="text/javascript" src="${basePath}/resource/js/krry_Banner.js"></script>
		<script type="text/javascript">

		</script>
	</body>
</html>