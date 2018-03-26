
//评论的分页
var krryMoreComment = {
		coutSum:5,  //能够点击这里，说明是超过5条以上的数据了
		pageNo:0,
		pageSize:5,
		nowTime:0,
		mark:true,
		timer:null,
		loadWind:function(){
			var closeee = false;
			//当滚动条到达距离底部180px时
			$(window).scroll(function(){
				if(!closeee){
					closeee = true;
					return;
				}
				clearTimeout(krryMoreComment.timer);
				//可视高度
	            var cheight = window.innerHeight || document.documentElement.clientHeight;
	            // 滚动条高度
	            var ctop = document.body.scrollTop ||document.documentElement.scrollTop;

	           //文档的高度
	           	if(cheight+ctop+100 > document.body.scrollHeight && krryMoreComment.mark){
	           		krryBlog.timer = setTimeout(function(){
	           			loadingmore($(".commentmore"));
	           			krryMoreComment.init();
	           		},200);
	           		
	           }
			});
		},
		init:function(){
			if(new Date() - krryMoreComment.nowTime > 500){
				krryMoreComment.nowTime = new Date();
				krryMoreComment.pageNo++;
				if(!krryMoreComment.mark) return;
				var blogId = $("body").data("opid");
				var pno = krryMoreComment.pageNo * krryMoreComment.pageSize;
	 			var psize = krryMoreComment.pageSize*(krryMoreComment.pageNo+1);
	 			var params = {
	 				pageNo:pno,
	 				pageSize:psize,
	 				blogId:blogId
	 			};
	 			$.ajax({
	 				type:"post",
	 				data:params,
	 				url:basePath+"/comment/load",
	 				success:function(data){
	 					if(data){
	 						krryMoreComment.coutSum += 5; //统计应该出现的评论数
	 						var dataArr = data.comments; //从map集合中拿出comments
	 						var countComents = data.countComments; //从map集合中拿出评论数量
							var len=dataArr.length;
							var html = "";
							for(var i=0;i<len;i++){
								var datajson = dataArr[i];
								var descript = datajson.DESCRIPTION;
								descript = descript.replaceAll("\n","<br>");
								html+="<div class='comment' data-opid='"+datajson.ID+"'>"+
								"	<div class='submitted'> <span rel='sioc:has_creator'><a href='"+basePath+"/blog/personBlog/"+datajson.REPLYUSERID+"' title='查看"+datajson.USERNAME+"' class='username' >"+datajson.USERNAME+"</a></span></div>"+
								"	<div class='content'>"+
								"	<span rel='sioc:reply_of' class='rdf-meta element-hidden'></span>"+descript+
								"	<p class='submitted'><span class='submortTime'>"+datajson.CREATETIME+"</span><span class='com_delete_s com_dele_"+datajson.REPLYUSERID+"' onclick='krryRealtion.deleteComment(this)'>删除</span></p>"+
								"	</div>"+
								"	</div>";
							}
							$("#krrycommentbox").append(html);
							//判断是否展示删除评论按钮
							krryRealtion.showDeleteCommentBut();
							if(countComents <= krryMoreComment.coutSum){
								krryMoreComment.mark = false;
								$(".commentmore").hide();
								return;
							}else{
								$(".commentmore").html("下拉加载更多评论...");
							}
						}else{
							krryMoreComment.mark = false;
							$(".commentmore").hide();
		 				}
	 				}
	 			});
			}
		},
};
$(function(){
	krryMoreComment.loadWind();
});







