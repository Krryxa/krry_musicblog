//页面播放器业务
var kePlay = {
	init:function(){
		$(".ke_op").on("click",function(){
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
		$("#"+(ok?"time":"ptime2")).html(ftime);
		if(!ok){
			$("#percent").html((percent+"%"));
			$(".p_over").width(percent+"%");
			
		}
	});
	
	//业务功能初始化
	//kePlay.init();
	kePlay["init"]();
		
		
});