<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="footer">
	<div class="content">
		<div class="foot_left">
			<div class="focus_detail">关注乐诗</div><br/>
			<div class="con_focusus">
				<div class="myqrcode"><img alt="关注我们" width="120" src="${basePath}/resource/images/myqrcode.jpg"></div>
			</div>
			<div class="gsw" style="position:absolute;bottom: 0;">© 2018 乐诗</div>
		</div>
		<div class="foot_center">
			<div class="myself_bottom">艾涵 - WeChat ID：xiaoyue942698320</div>
			<div class="cs_conbottom">粤ICP备17158733号</div>
		</div>
		<div class="foot_right">
			<div class="focus_detail_right">有你更美好</div><br/>
			<div class="con_focusus conmoney">
				<div class="myqrcode" style="right:0"><img alt="关注我们" width="120" src="${basePath}/resource/images/money.jpg"></div>
			</div>
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
		},800,function(){
			$(this).find(".myqrcode").hide();
		});
	});
</script>