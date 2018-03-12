
//获取每张图片的宽度
 var Banner = {
		 len:6, //拿到初始化后的图片个数4+2
		 imgWidth:303,
		 imgIndex:1,//一开始下标是取1，不是0
		 
		 //设置自动播放banner图
		 BannerTime:null,
		 nowTime:0,
		
		 //不用此方法了，在web层已经放进作用域，在前台用el表达式搞定了
//		 recomfun:function(){
//			var params = {pageSize:4};
//			$.ajax({
//				url:basePath+"/blog/loadDataRecom.do",
//				data:params,
//				type:"post",
//				success:function(data){
//					if(data){
//						data.forEach(function(obj,index){
//							$(".c_canBanner ul li").eq(index).find("a").attr("href",basePath+"/blog/detail/"+obj.ID+".do");
//							$(".c_canBanner ul li").eq(index).find("img").attr({
//								"src":basePath+"/"+obj.IMG,
//								"alt":obj.TITLE
//							});
//							$(".c_canBanner ul li").eq(index).find(".recomtextover").text(obj.TITLE);
//							$(".c_canBanner ul li").eq(index).find(".authorrecom").text("作者："+obj.USERNAME);
//						});
//					}
//				}
//			});
//		},
	 
 		//初始化Banner图,首尾添加两张
		visorhide:function(){
			var ul = $(".c_canBanner").find("ul");
			var first = ul.children().first().clone(); //克隆第一张图片
			var last = ul.children().last().clone(); //克隆最后一张图片
			$(".c_canBanner ul").prepend(last);
			$(".c_canBanner ul").append(first);
			$(".c_canBanner").css({"marginLeft":-Banner.imgWidth}); //一开始就是第二张图片
			
			//控制banner图的两个耳朵的出现和隐藏
			$(".c_last").hover(function(){
				$(this).css({backgroundPosition:"0 0"});
			},function(){
				$(this).css({backgroundPosition:"-84px 50%"});
			});
			$(".c_next").hover(function(){
				$(this).css({backgroundPosition:"-208px 0"});
			},function(){
				$(this).css({backgroundPosition:"-125px 50%"});
			});
		},
		
		btnclick:function(){
			$(".c_bta").hover(function(){
				Banner.imgIndex = $(this).parents(".b_cir").index() + 1;
				$(this).addClass("btnSelect").parents(".b_cir").siblings().find(".c_bta").removeClass("btnSelect");//因为c_bta没有兄弟姐妹，只有他的父母有兄弟姐妹，通过他父母的兄弟姐妹找到c_bta，一次移除其他兄弟姐妹的样式
				$(".c_canBanner").stop().animate({"marginLeft":-Banner.imgIndex*Banner.imgWidth});
			});
		},
		
		autoPlay:function(){
			Banner.BannerTime = setInterval(function(){
				$(".c_next").trigger("click");
			},3000);
		},
		
		moseoverwhen:function(){
			$(".c_canBanner").mouseover(function(){
				clearInterval(Banner.BannerTime);
			}).mouseout(function(){
				Banner.autoPlay();
			});
			//设置鼠标进入耳朵的时候，清除定时器
			$(".btnBan").hover(function(){
				clearInterval(Banner.BannerTime);
			},function(){ //离开耳朵的时候
				Banner.autoPlay();
			});
		},
		
		earwhen:function(flag){
			//当点击耳朵的时候
			if(new Date() - Banner.nowTime > 500){
				Banner.nowTime = new Date();
				if(flag){ //true代表左耳朵
					var tindex = (Banner.imgIndex == 0) ? 0 : --Banner.imgIndex;
				}else{ //右耳朵
					var tindex = (Banner.imgIndex == Banner.len) ? Banner.len : ++Banner.imgIndex;
				}
				Banner.changeBanner(tindex);
			}
		},

		//点击左右耳朵的方法
		changeBanner:function($index){
			$(".c_bta").eq($index-1).addClass("btnSelect").parents(".b_cir").siblings().find(".c_bta").removeClass("btnSelect");
			$(".c_canBanner").stop(true, true).animate({"marginLeft":-Banner.imgWidth*$index},function(){
				if($index == 0){ //判断回到最后一张图片
					$(".c_canBanner").css({"marginLeft":-Banner.imgWidth*(Banner.len - 2)});//所有图片回到最终状态
					$(".c_bta").eq(Banner.imgIndex-1).addClass("btnSelect").parents(".b_cir").siblings().find(".c_bta").removeClass("btnSelect");
					Banner.imgIndex = Banner.len - 2;
				}else if($index >= Banner.len - 1){ //判断回到第一张图片
					$(".c_canBanner").css({"marginLeft":-Banner.imgWidth});//所有图片回到最初状态
					$(".c_bta").eq(0).addClass("btnSelect").parents(".b_cir").siblings().find(".c_bta").removeClass("btnSelect");
					Banner.imgIndex = 1;
				}
			});
		}
	};
 	
// 	Banner.recomfun();
 	Banner.moseoverwhen();
 	Banner.btnclick(); //点击下标
 	Banner.visorhide();//鼠标滑进耳朵的时候
 	Banner.autoPlay();//一开始设置自动播放轮播图
 	//当点击左耳朵
	$(".c_last").click(function(){
		Banner.earwhen(true);
	});
	//当点击右耳朵
	$(".c_next").click(function(){
		Banner.earwhen(false);
	});
	
//3D翻转Banner
//var Banner3D3D = {
//			z:0,//设定每个方块的层级
//			index:0,
//			len:$(".Banner3D .btn a").length, //共四个按钮
//			timerq:null,//定时器
//			
//			//从后台或取数据
//			recomfun:function(){
//				var params = {pageSize:4};
//				$.ajax({
//					url:basePath+"/blog/loadDataRecom.do",
//					data:params,
//					type:"post",
//					success:function(data){
//						if(data){
//							data.forEach(function(obj,index){
//								var BanObj = ".Ban_li"+index;
//								$(BanObj).attr("href",basePath+"/blog/detail/"+obj.ID+".do");
//								$(BanObj).find("li .recomtextover").text(obj.TITLE);
//								$(BanObj).find("li .authorrecom").text("作者："+obj.USERNAME);
//								$(BanObj).find("li").css("background-image","url('"+basePath+"/"+obj.IMG+"')");
//							});
//						}
//					}
//				});
//			},
//			
//			change:function(){
//				Banner3D.index = (Banner3D.index < Banner3D.len-1) ? ++Banner3D.index : 0;
//				$(".Banner3D .ul").css({
//					transform:"translateZ(-126px) rotateX("+Banner3D.index*-90+"deg)",
//				});
//				$(".Banner3D .btn a").eq(Banner3D.index).addClass("selll").siblings().removeClass("selll");
//			},
//			//动态生成方块数
//			number:function(num){
//				var BanWidth = $(".Banner3D").width() / num; //获取每个方块的宽度
//				for(var i = 0;i < num;i++){
//					if(i == 0) $(".Banner3D ul").html(""); //每次调用的时候，先清空
//					$(".Banner3D ul").append(
//					"<div class='ul'>"+
//					"<a class='Ban_li0' href='javascript:void(0);'>"+
//					"<li><span class='recomtextover'></span><span class='authorrecom'></span></li></a>"+
//					"<a class='Ban_li1' href='javascript:void(0);'>"+
//					"<li><span class='recomtextover'></span><span class='authorrecom'></span></li></a>"+
//					"<a class='Ban_li2' href='javascript:void(0);'>"+
//					"<li><span class='recomtextover'></span><span class='authorrecom'></span></li></a>"+
//					"<a class='Ban_li3' href='javascript:void(0);'>"+
//					"<li><span class='recomtextover'></span><span class='authorrecom'></span></li></a>"+
//					"</div>");
//					//设置每个方块动画执行的时间，动画延迟执行时间
//					$(".Banner3D .ul").eq(i).css({
//						transition:"0.8s "+0.5*i/num+"s"
//					});
//					//设置每个方块的图片的位置
//					$(".Banner3D .ul").eq(i).find("li").css({
//						"backgroundPosition":-(i)*BanWidth+"px 0",
//					});
//					//设置一半方块后的层级
//					if(i > num/2){
//						Banner3D.z--;
//						$(".Banner3D .ul").eq(i).css({
//							zIndex:Banner3D.z
//						});
//					}
//				}
//
//				$(".Banner3D .ul").css({
//					transform:"translateZ(-126px) rotateX("+Banner3D.index*-90+"deg)",
//				});
//
//				//设置方块和每个面的宽度
//				$(".Banner3D .ul").css({
//					width:BanWidth
//				});
//				$(".Banner3D ul li").css({
//					width:BanWidth
//				});
//			},
//			
//			timerer:function(){
//				Banner3D3D.timerq = setInterval(function(){
//					Banner3D3D.change();
//				},3000);
//			}
//			
//			
//		};
//		
//		//定义四个Banner3D图
//		Banner3D.recomfun();
//		Banner3D.number(2);//方块数 
//		
//		Banner3D.timerer();//一开始启动一次
//		
//		$(".Banner3D .btn a").hover(function(){
//			index = $(this).index();
//			$(this).addClass("selll").siblings().removeClass("selll");
//			$(".Banner3D .ul").css({
//				transform:"translateZ(-126px) rotateX("+index*-90+"deg)",
//			});
//		});
//		$(".Banner3D").mouseover(function(){
//			clearInterval(Banner3D.timerq);
//		}).mouseout(function(){
//			Banner3D.timerer();
//		});
		
		