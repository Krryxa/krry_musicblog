//博客首页
var krryBlog = {
	coutBlog:0,
	pageNo:0,
	pageSize:5,
	nowTime:0,
	timer:null,
	mark:true,//标记数据是否加载完毕 false表示加载完毕，true表示还可以继续加载
	loadWind:function(){
		var closeee = false;
		//当滚动条到达距离底部180px时
		$(window).scroll(function(){
			if(!closeee){
				closeee = true;
				return;
			}
			clearTimeout(krryBlog.timer);
			//可视高度
            var cheight = window.innerHeight || document.documentElement.clientHeight;
            // 滚动条高度
            var ctop = document.body.scrollTop ||document.documentElement.scrollTop;

           //文档的高度
           	if(cheight+ctop+70 > document.body.scrollHeight && krryBlog.mark){
           		krryBlog.timer = setTimeout(function(){
           			loadingmore($(".loadmore"));
           			krryBlog.loadData();
           		},200);
           }
		});
	},
	loadData:function(){
		krryBlog.pageNo++;
		this.load();
	},
	load:function(){
		if(new Date() - krryBlog.nowTime > 200){
			krryBlog.nowTime = new Date();
			if(!krryBlog.mark)return;
			var pno = krryBlog.pageNo * krryBlog.pageSize; 
 			var psize = krryBlog.pageSize*(krryBlog.pageNo+1);
 			var params = {
 				pageNo:pno,
 				pageSize:psize
 			};
			$.ajax({
				type:"post",
				url:basePath+"/blog/loadData",
				data:params,
				success:function(data){
					if(data){
						krryBlog.coutBlog += 5;
						var dataArr = data.blogs;//从map集合中拿出博客
						var len = dataArr.length;
						var countBlogs = data.coutBlogs;//从map集合中拿出博客数量
						if(countBlogs > 5){
							$(".loadmore").show();
						}
						
						var html = "";
						for(var i = 0;i < len;i++){
							var datajson = dataArr[i];
							var desc = datajson.DESCRIPTION;
							if(desc.length>90)desc = desc.substring(0,90)+"......";
							html += "<li class='items'>"+
								 	"	<a href='"+basePath+"/blog/detail/"+datajson.ID+"' class='imgbox pr'>"+
								 	"		<img class='lazy' alt='"+datajson.TITLE+"' src='"+basePath+"/"+datajson.IMG+"' style='display: inline;' />"+
								 	"		<div class='iover'></div>"+
								 	"		<img class='i_playindex' src='"+basePath+"/resource/images/cover_play.png' alt='播放按钮' width='40' height='40'/>"+
								 	"	</a>"+
								 	"	<div class='slbox'>"+
								 	"		<h3 class='title'><a href='"+basePath+"/blog/detail/"+datajson.ID+"'>"+datajson.TITLE+"</a></h3>"+
								 	"		<p class='info'>"+
								 	"			<span><i class='iconfont icon-time' title='创建时间'></i>"+datajson.CREATETIME+"</span>"+
								 	"			<span class='commentsCenter'><i class='iconfont icon-pinglun' title='评论数'></i>"+datajson.COMMENTS+"</span>"+
								 	"			<span><i class='iconfont icon-dianji' title='点击数'></i>"+datajson.HITS+"</span>"+
									"			<span class='comentrightz'><i class='iconfont icon-zhuanti1' title='专题'></i>"+datajson.NAME+"</span>"+
								 	"		</p>"+
									"		<p title='作者' class='usernamemusicBlog'>作者："+datajson.USERNAME+"</p>"+
								 	"		<p class='desc'>"+desc+"</p>"+
								 	"	</div>"+
								 	"</li>";
						}
						$("#databox .data_test").remove();
						$("#databox").append(html);
						if(countBlogs <= krryBlog.coutBlog){
							krryBlog.mark = false;
							//数据加载完毕
							$(".loadmore").hide();
						}else{
							//加载更多数据
							$(".loadmore").html("<span>下拉加载更多博客...</span>");
						}
					}else{
						krryBlog.mark = false;
						//数据加载完毕
						$(".loadmore").hide();
	 				}
					//图片损坏的处理方案
					$("img").on("error",function(){
						$(this).attr("src",basePath+"/resource/images/noimg.jpg");
					});
	 			}
	 		});
		}
	},
	
	//置顶期刊
//	loadTop:function(){
//		var params = {pageSize:3};
//		$.ajax({
//			type:"post",
//			url:basePath+"/blog/loadDataTop",
//			data:params,
//			success:function(data){
//				if(data){
//					data.forEach(function(obj,index){
//					//xml文件的sql语句设置了大图片排在第一，所以index为0的是大图片
//						if(index==0){
//							//设置图片
//							$(".bg_pic .imgi").find("img").attr({
//								"src":basePath+"/"+obj.IMG,
//								"alt":obj.TITLE
//							});
//							//设置a标签
//							$(".bg_pic .btext").attr({
//								"href":basePath+"/blog/detail/"+obj.ID+"",
//								"title":obj.TITLE
//							});
//							$(".bg_pic .btext").html("<p class='cp_h1'>"+obj.TITLE+"<span class='bigauthorbot'>作者："+obj.USERNAME+"</span></p>");
//						}else{
//							if(index==1){
//								//图片
//								$(".lister1").find("img").attr({
//									"src":basePath+"/"+obj.IMG,
//									"alt":obj.TITLE
//								});
//								//a标签
//								$(".lister1 .btext2").attr({
//									"href":basePath+"/blog/detail/"+obj.ID+"",
//									"title":obj.TITLE
//								});
//								$(".lister1 .btext2").text(obj.TITLE);
//								$(".lister1 .small_authorbot").text("作者："+obj.USERNAME);
//							}else{
//								//图片
//								$(".lister2").find("img").attr({
//									"src":basePath+"/"+obj.IMG,
//									"alt":obj.TITLE
//								});
//								//a标签
//								$(".lister2 .btext2").attr({
//									"href":basePath+"/blog/detail/"+obj.ID+"",
//									"title":obj.TITLE
//								});
//								$(".lister2 .btext2").text(obj.TITLE);
//								$(".lister2 .small_authorbot").text("作者："+obj.USERNAME);
//							}
//						}
//					});
//				}
//				//图片损坏的处理方案
//				$("img").on("error",function(){
//					$(this).attr("src",basePath+"/resource/images/noimg.jpg");
//				});
//			}
//		});
//	},
	
	//加载热门期刊
//	loadHot:function(){
//		var params = {pageSize:1};
//		$.ajax({
//			type:"post",
//			url:basePath+"/blog/loadDataHot",
//			data:params,
//			success:function(data){
//				if(data){
//					data.forEach(function(obj,index){
//						if(index==0){
//							//点击数
//							$("#wrighHot .pull-right span").text(obj.HITS);
//							//a标签
//							$("#rightHot .conHover").attr({
//								"href":basePath+"/blog/detail/"+obj.ID+"",
//								"title":obj.TITLE
//							});
//							//图片
//							$("#rightHot .conHover .Hotitems").find("img").attr({
//								"src":basePath+"/"+obj.IMG,
//								"alt":obj.TITLE
//							});
//							//文字
//							$("#rightHot .conHover .Hotitems .back .b_spant1").text(obj.TITLE);
//							$("#rightHot .conHover .Hotitems .back .b_spant2").text("作者："+obj.USERNAME);
//						}
//					});
//				}
//				//图片损坏的处理方案
//				$("img").on("error",function(){
//					$(this).attr("src",basePath+"/resource/images/noimg.jpg");
//				});
//			}
//		});
//	},
	
	save:function(){
		
	},
	
	update:function(){
		
	},
	
	del:function(){
		
	},
	
	search:function(){
		
	},
	subdesc:function(desc){
		if(desc.length>60)desc = desc.substring(0,60)+"...";
		return desc;
	}
};

$(function(){
	loadingmore($(".loadmore"));
//	krryBlog.load();
//	krryBlog.loadWind(); //控制滚动条的事件加载更多数据

	var height = $(window).height();
	height = height - 296;
	$(".wrapbox").css("min-height",height);
	$(window).resize(function(){
		height = $(window).height();
		height = height - 296;
		$(".wrapbox").css("min-height",height);
	});
	//裁剪一开始10条信息的desc的值
	$("#databox .data_test li").each(function(){
		var descc = $(this).find(".desc").text();
		$(this).find(".desc").text(krryBlog.subdesc(descc));
	});
	//图片损坏的处理方案
	$("img").on("error",function(){
		$(this).attr("src",basePath+"/resource/images/noimg.jpg");
	});
});

