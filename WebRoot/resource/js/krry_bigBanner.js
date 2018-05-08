	$(function(){
		var index = 0;
		var len = $("#slidbig ul li").length;
		$("#tabbig a").hover(function(){
			index = $(this).index();
			$(this).addClass("selbig").siblings().removeClass("selbig");
			$("#slidbig ul li").eq(index).show().stop().animate({"opacity":1},700).siblings().stop().animate({"opacity":0},700,function(){$(this).hide();});
		});
		
		//轮播图改变，左耳朵false 右耳朵true
		function change(flag){
			if(flag){
				index = (index == len-1) ? 0 : ++index;
			}else{
				index = (index == 0) ? len-1 : --index;
			}
			$("#tabbig a").eq(index).addClass("selbig").siblings().removeClass("selbig");
			$("#slidbig ul li").eq(index).show().animate({"opacity":1},700).siblings().animate({"opacity":0},700,function(){$(this).hide();});
		}

		var nowTime = 0;
		
		//点击左耳朵
		$("#prevbig").click(function(){
			if(new Date() - nowTime > 700){
				change(false);
				nowTime = new Date();
			}
		});
		//点击右耳朵
		$("#nextbig").click(function(){
			if(new Date() - nowTime > 700){
				change(true);
				nowTime = new Date();
			}
		});
		
		//banner图动画定时器
		var bigtime = null;

		//鼠标滑到Banner
		$("#slidbig").hover(function(){
			clearInterval(bigtime);
			$(".earbig .eebig").stop(true).animate({"opacity":1},400);
		},function(){
			start();
			$(".earbig .eebig").stop(true).animate({"opacity":0},400);
			
		});
		
		//鼠标滑到五个按钮的时候
		$("#tabbig a").hover(function(){
			clearInterval(bigtime);
		},function(){
			start();
		});
		

		start();
		function start(){
			bigtime = setInterval(function(){
				change(true);
			},2500);
		}
	});
