<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="header">
	<div class="heardbox">
		<div class="c_left">
			<a href="${basePath}" class="logo"><img src="${basePath}/resource/images/krrylogo.png" width="60" title="krrylogo"></a>
			<ul class="nav">
				<li><a href="${basePath}"><i class="iconfont icon-yingsaitong"></i>首页</a></li>
				<li><a href="${basePath}/blog/AllBlog" target="_blank"><i class="iconfont icon-music"></i>期刊</a></li>
				<li class="overfindzhong"><a href="javascript:void(0);"><i class="iconfont icon-zhuanti1"></i>专题</a>
					<div class="overfindcontainer">
						<div class="opyao didid"><a href="${basePath}/blog/kindOfBlog/1" target="_blank" style="height:50px;">摇滚</a></div>
						<div class="opliu didid"><a href="${basePath}/blog/kindOfBlog/2" target="_blank" style="height:50px;">流行</a></div>
						<div class="opzhong didid"><a href="${basePath}/blog/kindOfBlog/3" target="_blank" style="height:50px;">中国风</a></div>
						<div class="opming didid"><a href="${basePath}/blog/kindOfBlog/4" target="_blank" style="height:50px;">轻音乐</a></div>
						<div class="ophuai didid"><a href="${basePath}/blog/kindOfBlog/5" target="_blank" style="height:50px;">怀旧</a></div>
						<div class="ophei didid"><a href="${basePath}/blog/kindOfBlog/6" target="_blank" style="height:50px;">传奇</a></div>
					</div>
				</li>
				<li><a href="javascript:void(0);" target="_blank" id="userCenter"><i class="iconfont icon-gerenzhongxinyonghu01"></i>个人中心</a></li>
			</ul>
		</div>
		<div class="boxsinput">
			<form action="${basePath}/blog/searchBlog" method="get" onkeydown="if(event.keyCode==13)return false;">
				<input type="text" class="search-input" maxlength="18" name="searchkeywords">
				<button class="search-btn" type="button"></button>
				<button class="submitsearch" type="submit" style="display:none;"></button>
			</form>
		</div>
		<div class="c_right" id="loginbox">
			<a href="javascript:void(0);" onclick="krryLogin.login()">登陆</a>
			<a href="javascript:void(0);" onclick="krryLogin.resi()">注册</a>
		</div>
	</div>
</div>
<script type="text/javascript">

	$(".search-btn").click(function(){
		//如果不为空，才可以搜索
		if(!isEmpty($(".search-input").val())){
			var text = $(".search-input").val();
			$(".search-input").val($.trim(text)); //截取关键字首尾的空白字符
			$(".submitsearch").trigger("click");
		}
	});
	$(".search-input").focus(function(){
		$(this).css({
			"background":"#fff",
			"box-shadow":"1px 1px 1px #ECECEC inset"
		});
		$(this).animate({
			"width":"105"
		},150);
		//敲回车也能搜索
		$(document).keydown(function(e){
			//如果不为空，才可以搜索
			if(e.keyCode==13 && !isEmpty($(".search-input").val())){
				var text = $(".search-input").val();
				$(".search-input").val($.trim(text)); //截取关键字首尾的空白字符
				$(".submitsearch").trigger("click");
			}
		});
	});
	$(".search-input").blur(function(){
		$(this).css({
			"background":"#ededed",
			"box-shadow":"1px 1px 1px #ECECEC inset"
		});
		$(this).animate({
			"width":"65"
		},150);
		//失焦时解除绑定回车事件 
		$(document).unbind("keydown");
	});
	
	
	$(".overfindzhong").hover(function(){
		$(".overfindcontainer").stop().slideDown(300);
	},function(){
		$(".overfindcontainer").stop().slideUp(300);
	});
</script>

