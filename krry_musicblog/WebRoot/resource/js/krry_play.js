//页面播放器业务
var kePlay = {
	flag:true,
	init:function(){
		$(".ke_op").on("click",function(){
			//点击播放，才加入音乐src地址，这样才能实现边播放边加载
			//而若一开始就添加了src地址，点击播放时，会等待音乐加载完成才会播放，体验不好
			if(kePlay.flag){
				//点击播放时添加音乐路径，只添加一次
				var is_href_song = $(".is_href_song").text();
				var vallsmusicHref = $("#fromdataAu").text();
				//如果是上传的歌曲，那就要拼接上服务器地址
				if(is_href_song == 0){
					$("#audio").attr("src",basePath+"/"+vallsmusicHref);
				}else{//跨域请求的无法获取音频数据，所以这里不做音频处理
					$("#audio").attr("src",vallsmusicHref);
				}
				kePlay.flag = false;
			}
			
			var $i=$(this).find("i");
			$i.toggleClass("icon-bofang icon-iconfont32");
			var field = $i.hasClass("icon-iconfont32")?"play":"stop";
			krAudio[field]();
			$(this).stop().animate({top:$i.hasClass("icon-iconfont32")?-207:0},"slow");
			$(".ke_op").toggleClass("r");
			
		});
	}
};


$(function(){
	//播放器初始化
	krAudio["init"](function(ok,ftime,percent){
		/*if(ok){
			$("#time").html(ftime);
		}else{
			$("#ptime").html(ftime);
		}*/
		$("#"+(ok?"time":"ptime")).html(ftime);
		$("#"+(ok?"time22":"ptime2")).html(ftime);
		if(!ok){
			$("#percent").html((percent+"%"));
			$(".p_over").width(percent+"%");
			
		}
	});
	
	//业务功能初始化
	//kePlay.init();
	kePlay["init"]();
	
});