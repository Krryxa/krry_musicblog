
/*损坏图片的处理方案*/
$(function(){
	//图片损坏的解决方案
	$("img").on("error",function(){
		$(this).attr("src",basePath+"/resource/images/noimage.gif");
	});
	var height = $(window).height();
	height = height - 225;
	$(".container").css("min-height",height);
	$(window).resize(function(){
		height = $(window).height();
		height = height - 225;
		$(".container").css("min-height",height);
	});
	krryRealtion.init();
	krryRealtion.load();
	krryRealtion.loadComment();
	
	
});

var krryRealtion = {
	//初始化
	init:function(){
		//本地存储信息
		if(window.localStorage){
			var opid = $("body").data("opid");
			var text = localStorage.getItem("krry_detail_"+opid);
			$("#content").val(text);
		}
		
	},
	load:function(){
		var typeId = $("body").data("typeid");
		var filterId = $("body").data("opid");
		$.ajax({
			type:"post",
			data:{filterId:filterId,typeId:typeId},
			url:basePath+"/blog/relation.do",
			success:function(data){
				var html = "";
				if(data!=null && data.length>0){
					for(var i=0,len=data.length;i<len;i++){
						if(i==3){
							html+="<li style='margin-right:0;'><a href='"+basePath+"/blog/detail/"+data[i].ID+".do'><img src='"+basePath+"/"+data[i].IMG+"' alt='"+data[i].TITLE+"' /></a><a href='"+basePath+"/blog/detail/"+data[i].ID+".do' class='rp_t'>"+data[i].TITLE+"<img src='"+basePath+"/resource/images/cover_play.png' width='40' alt='播放' height='40'/></a></li>";
						}else{
							html+="<li><a href='"+basePath+"/blog/detail/"+data[i].ID+".do'><img src='"+basePath+"/"+data[i].IMG+"' alt='"+data[i].TITLE+"' /></a><a href='"+basePath+"/blog/detail/"+data[i].ID+".do' class='rp_t'>"+data[i].TITLE+"<img src='"+basePath+"/resource/images/cover_play.png' width='40' alt='播放' height='40'/></a></li>";
						}
					}
					var slen = 4 - data.length;
					for(var j=0;j<slen;j++){
						if(j==slen-1){
							html+="<li style='margin-right:0;'><img class='ke_imgs' src='"+basePath+"/resource/images/noimg.jpg' alt='暂无期刊'/></li>";
						}else{
							html+="<li><img class='ke_imgs' src='"+basePath+"/resource/images/noimg.jpg' alt='暂无期刊'/></li>";
						}
					}
				}else{
					$(".relation").remove();
				}
				$("#relationbox").html(html);
				//图片损坏的解决方案
				$("img").on("error",function(){
					$(this).attr("src",basePath+"/resource/images/noimage.gif");
				});
			}
		});
	},
	mark:true,
	saveComment:function(obj){
		if(!krryRealtion.mark)return;
		var userName = $("#username").text();
		if(isEmpty(userName)){
			krryLogin.login();
			return false;
		}
		var description = $("#content").val();
		//当前登录用户Id
		var loginId = $("body").data("logid");
		//获取博文ID
		var blogId = $("body").data("opid");
		//获取博主ID
		var userId = $("#blogUserId").text();
		if(isEmpty(description)){
			krryMessage.tip("请输入评论信息...");
			$("#content").focus();
			return;
		}
		//清空并且获取焦点
		$("#content").val("").focus();
		krryRealtion.mark = false;
		$(obj).removeAttr("onclick").find(".text").text("发表中");
		$.ajax({
			type:"post",
			data:{description:description,blogId:blogId,userId:userId},
			url:basePath+"/comment/save.do",
			success:function(data){
				$(".comment_hr").show();
				description = description.replaceAll("\n","<br>");
				$("#krrycommentbox").prepend("<div class='comment' data-opid='"+data.ID+"'>"+
				"	<div class='submitted'> <span rel='sioc:has_creator'><a href='"+basePath+"/blog/personBlog/"+loginId+".do' title='查看"+userName+"' class='username' >"+userName+"</a></span></div>"+
				"	<div class='content'>"+
				"	<span rel='sioc:reply_of' class='rdf-meta element-hidden'></span>"+description+
				"	<p class='submitted'><span class='submortTime'>刚刚</span><span class='com_delete_s com_dele_"+loginId+"' style='display:block;' onclick='krryRealtion.deleteComment(this)'>删除</span></p>"+
				"	</div>"+
				"	</div>");
				krryRealtion.mark = true;
				$(obj).attr("onclick","krryRealtion.saveComment(this)").find(".text").text("发表评论");
				//获取当前评论数 
				var countCom = $(".container .pititle .pis-fc3 .pi-flag").text();
				//评论数+1
				countCom++;
				//异步更新页面显示的评论数
				$(".container .pititle .pis-fc3 .pi-flag").text(countCom);
				$(".container .pis_fvc .fvc_pp .p_s_numf").text(countCom);
				
				if(window.localStorage){
					var opid = $("body").data("opid");
					localStorage.removeItem("krry_detail_"+opid);
				}
			}
		});
	},
	timer:null,
	loadComment:function(){
		clearTimeout(this.timer);
		this.timer = setTimeout(function(){
			var blogId = $("body").data("opid");
			$.ajax({
				type:"post",
				data:{blogId:blogId},
				url:basePath+"/comment/load.do",
				success:function(data){
					if(data){
						var html = "";
						var dataArr = data.comments; //从map集合中拿出comments
						var countComents = data.countComments; //从map集合中拿出评论数量
						var len=dataArr.length;

						if(countComents > 5){
							$(".commentmore").show();
						}
						if(countComents == 0){
							$("#comments hr").hide();
						}
						
						for(var i=0;i<len;i++){
							var datajson = dataArr[i];
							var descript = datajson.DESCRIPTION;
							descript = descript.replaceAll("\n","<br>");
							html+="<div class='comment' data-opid='"+datajson.ID+"'>"+
							"	<div class='submitted'> <span rel='sioc:has_creator'><a href='"+basePath+"/blog/personBlog/"+datajson.REPLYUSERID+".do' title='查看"+datajson.USERNAME+"' class='username' >"+datajson.USERNAME+"</a></span></div>"+
							"	<div class='content'>"+
							"	<span rel='sioc:reply_of' class='rdf-meta element-hidden'></span>"+descript+
							"	<p class='submitted'><span class='submortTime'>"+datajson.CREATETIME+"</span><span class='com_delete_s com_dele_"+datajson.REPLYUSERID+"' onclick='krryRealtion.deleteComment(this)'>删除</span></p>"+
							"	</div>"+
							"	</div>";
						}
						$("#krrycommentbox").append(html);
						//判断是否展示删除评论按钮
						krryRealtion.showDeleteCommentBut();
					}
				}
			});
		},200);
	},
	//删除评论
	deleteComment:function(obj){
		$.tzAlert({content:"您确定要删除吗？",title:"温馨提示",callback:function(ok){
			if(ok){
				//等待状态
				$("#tzloading").remove();//先移除
				$(".allping_con").show();
				loading("正在删除",900);//再展示
				
				var objComment = $(obj).parents(".comment");
				//获取评论的ID
				var commentId = objComment.data("opid");
				$.ajax({
					type:"post",
					data:{commentId:commentId},
					url:basePath+"/comment/deleteComment.do",
					success:function(data){
						//提示框去掉
						$("#tzloading").animate({"top":20},function(){
							$(this).remove();
						});
						$(".allping_con").hide();
						krryMessage.tip("删除成功!!!");
						//该评论渐渐消失
						objComment.fadeOut(800,function(){
							$(this).remove();
						});
						//获取当前评论数 
						var countCom = $(".container .pititle .pis-fc3 .pi-flag").text();
						//评论数-1
						countCom--;
						//异步更新页面显示的评论数
						$(".container .pititle .pis-fc3 .pi-flag").text(countCom);
						$(".container .pis_fvc .fvc_pp .p_s_numf").text(countCom);
					}
				});
			}
		}});
	},
	//控制展示删除评论按钮
	showDeleteCommentBut:function(){
		//控制评论删除按钮的展示（默认隐藏，若是博主ID，展示该博客评论的全部删除按钮，若是评论者ID，则只展示该用户评论的删除按钮）
		//当前登录用户Id
		var loginId = $("body").data("logid");
		//博主Id
		var blogUserId = $("#blogUserId").text();
		//如果是用户自己的博客，则展示全部的删除按钮
		if(loginId == blogUserId){
			$(".com_delete_s").show();
		}else if(loginId != null){
			//若评论者登录，只展示评论者的删除按钮
			$(".com_dele_"+loginId).show();
		}else{
			//游客，不做任何事
		}
	},
	setCacheData:function(obj){
		var val = obj.value;
		if(isNotEmpty(val)){
			if(window.localStorage){
				var opid = $("body").data("opid");
				localStorage.setItem("krry_detail_"+opid, val);
			}
		}
	}
};