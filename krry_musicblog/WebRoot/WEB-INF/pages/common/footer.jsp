<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="footer">
	<div class="content">
		<div class="foot_left">
			<div class="relatihref">相关链接</div>
			<a target="_blank" href="${basePath}/krry_project">Krry项目集锦</a>
			<a target="_blank" href="${basePath}/Lily_music">Lily_music</a>
			<div class="gsw" style="text-align:left;">© 2018 乐诗</div>
		</div>
		<div class="foot_center">
			<div class="myself_bottom">艾涵 - WeChat ID：xiaoyue942698320</div>
			<div class="cs_conbottom">
				<div style="width:360px;margin:0 auto;">
					<span style="float: left;">粤ICP备17158733号</span>
		 			<a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=44081102000040" style="margin-top: 5px;display:inline-block;text-decoration:none;height:20px;float: right;line-height:20px;"><img src="${basePath}/resource/images/beian.png" style="float:left;"/><p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#e1e1e1;">粤公网安备44081102000040号</p></a>
		 		</div>
			</div>
		</div>
		<div class="foot_right">
			<div class="con_focusus">
				<div class="myqrcode"><img alt="关注我们" width="120" src="${basePath}/resource/images/myqrcode.jpg"></div>
			</div>
			<div class="focus_detail">关注乐诗</div><br/>
			<div class="con_focusus conmoney">
				<div class="myqrcode"><img alt="关注我们" width="120" src="${basePath}/resource/images/money.jpg"></div>
			</div>
			<div class="focus_detail_right">有你更美好</div><br/>
			<div class="bottomlogo"><img alt="底部logo" height="30" src="${basePath}/resource/images/bottoms.png"></div>
		</div>
	</div>
</div>
<!--回到顶部-->
<div class="backTop">
	<a href="javascript:void(0);"></a>
</div>
<script>
	$(".con_focusus").hover(function(){
		$(this).find(".myqrcode").show();
		$(this).find(".myqrcode").stop().animate({
			opacity:1,
			top:-92
		},300);
	},function(){
		$(this).find(".myqrcode").stop().animate({
			top:0,
			opacity:0
		},80,function(){
			$(this).find(".myqrcode").hide();
		});
	});
</script>