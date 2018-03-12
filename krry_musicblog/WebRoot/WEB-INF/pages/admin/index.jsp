<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="Description" content="乐诗博客是一个音乐、日记分享平台，我们致力于让用户发表自己的心情，分享自己喜爱的音乐，聆听你我的声音">
		<title>我的音乐博客</title>
		<%@include file="../common/common.jsp" %>
		<link rel="stylesheet" href="${basePath}/resource/css/animate.css"/>
		<script type="text/javascript" src="${basePath}/resource/js/krry_page.js"></script>
		<style>
			.ttbodyy{min-height:450px;}
			.modimenu{float:right;transition:.3s;}
			.modimenu:hover{color:#dd5862;transition:.3s;}
			.addmenu{margin-top:25px;font-size: 14px;float: left;
				    display: block;transition:.6s;
				    width: 80px;
				    height: 35px;
				    text-align: center;
				    line-height: 35px;
				    background: #1ACE94;
				    color: #fff;position: absolute;
				    border-radius: 10px;}
			.addmenu:hover{transition:.6s;background:#FF6857;}
			.ke_tabbox{width:960px;background:#f9f9f9;margin:20px auto 0;position:relative;}
			.ke_tabbox .sendMy{text-align: center;
					font-family: "微软雅黑";
					font-size: 28px;
					-webkit-text-fill-color: transparent;
					background: -webkit-gradient(linear,left top,left bottom,from(#FD8700),to(#FF00B1));
					-webkit-background-clip: text;
					margin:8px auto 0;line-height: 35px;}
			.ke_tabbox .ke_table{width:100%;margin-top: 26px;}
			.ke_tabbox  th{background:#ccc;font-weight:bold;}
			.ke_tabbox .ke_table td,th{border:1px solid #fff;padding:4px 12px;color:#666;font-size:12px;}
			/*分页相关*/
			.tzPage{font-size: 12px;
				    position: absolute;
				    bottom: -42px;
				    right: 0px;}
    		
    		#tbody tr:hover{background:#eaeaea;}
    		#tbody .t_mode{padding-right:4px;}
    		#tbody .t_avbiaoq:hover{color:#FF6857;transition:.4s}
    		#tbody .t_dele{padding-left:4px;}
    		
			.tzPage a{text-decoration:none;border:none;color:#7d7d7d;background-color:#f2f2f2;border-radius: 3px;}
			.tzPage a:hover{background:#dd5862;color:#FFF;}
			.tzPage a,.tzPage span{display:block;float:left;padding:0em 0.5em;margin-right:5px;margin-bottom:5px;min-width:1em;text-align:center;line-height: 22px;height: 22px;}
			.tzPage .current{background:#dd5862;color:#FFF;border:none;border-radius: 3px;}
			.tzPage .current.prev,.tzPage .current.next{color:#999;border:1px solid #e5e5e5;background:#fff;}
			.tm_psize_go{margin-right:4px;float:left;height:24px;line-height:33px;position:relative;border:1px solid #e5e5e5;color:#999}
			#tm_pagego{border-radius:3px;height:22px;width:30px;float:left;text-align:center;border:1px solid #e5e5e5;line-height: 22px;color:#999}
			.sortdesc{border-top:5px solid;width:0px;height:0px;display:inline-block;vertical-align:middle;border-right:5px solid transparent;border-left:5px solid transparent;margin-left:5px;}
			.sortasc{border-bottom:5px solid;width:0px;height:0px;display:inline-block;vertical-align:middle;border-right:5px solid transparent;border-left:5px solid transparent;margin-left:5px;}
			.red{color:red}	
			.green{color:green}
			
			.hideAdd{height: 300px;
				    text-align: center;
				    line-height: 300px;
				    margin-top: 16px;display:none;}
			.hideAdd a{font-size:28px;-webkit-text-fill-color:transparent;background: -webkit-gradient(linear,left top,left bottom,from(#FD0051),to(#A22C93));-webkit-background-clip: text;}
	
		</style>
	</head>
	<body>
	<%@include file="../common/header.jsp" %>
		<div class="ttbodyy">
				<div class="wrapbox">
				<div class="ke_tabbox">
					<a href="${basePath}" class="backnetwork"><span class="icon_backont">&lt;</span><span class="nextword">返回首页</span></a><br>
					<a href="${basePath}/admin/add.do" class="addmenu">添加期刊</a>
					<p class="sendMy">我的音乐博客(<span>${itemCount}</span>)</p>
					<a href="${basePath}/admin/modifyCenter/${user.id}.do" class="modimenu">修改个人信息</a>
					<table class="ke_table">
						<thead>
							<tr>
								<th style="width:31px;">ID</th>
								<th style="width:220px;">标题</th>
								<th style="width:63px;">分类</th>
								<th style="width:106px;">作者</th>
								<th style="width:165px;">发布时间</th>
								<th style="width:100px;">点击数/评论数</th>
								<th style="width:145px;">发布状态（点击更改）</th>
								<th style="width:88px;">操作</th>
							</tr>
						</thead>
		
							<!-- ${krry:getChar(bindex.index+1)} -->
						
						<tbody id="tbody" data-itemcount="${itemCount}">
							<c:forEach var="blog" items="${blogs}" varStatus="bindex">
								<tr data-categoryid="${blog.CATEGORYID}" data-userid="${blog.USERID}" data-opid="${blog.ID}">
									<td><input type='checkbox' value='${blog.ID}'></td>
									<td><a class="t_avbiaoq" href="${basePath}/blog/detail/${blog.ID}.do" target="_blank" title="${blog.TITLE}">${blog.TITLE}</a></td>
									<td><a class="t_avbiaoq" href="${basePath}/blog/kindOfBlog/${blog.CATEGORYID}.do" target="_blank" title="${blog.NAME}">${blog.NAME}</a></td>
									<td><a class="t_avbiaoq" href="${basePath}/blog/personBlog/${blog.USERID}.do" target="_blank" title="${blog.USERNAME}">${blog.USERNAME}</a></td>
									<td>${blog.CREATETIME}</td>
									<td>${blog.HITS}/${blog.COMMENTS}</td>
									<td><a href="javascript:void(0);" onclick="krryAdminBlog.status(this)" data-opid="${blog.ID}" data-mark="${blog.STATUS}" class="${blog.STATUS==1?'green':'red'}">${blog.STATUS==1?"已发布":"未发布"}</a></td>
									<td>
										<a class="t_avbiaoq t_mode" href="${basePath}/admin/edit/${blog.ID}.do">修改</a>
										<a class="t_avbiaoq t_dele" href="javascript:void(0);" onclick="krryAdminBlog.del(this)" data-opid="${blog.ID}">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="krryPage"></div>
				</div>
				
				<div class="hideAdd animated rotateIn">
					<a href="${basePath}/admin/add.do">还没有发布过音乐博客？快快点我吧~~</a>
				</div>
			</div>
		</div>
		<!--底部-->
		<%@include file="../common/footer.jsp" %>
		<script type="text/javascript">
		
			var krryAdminBlog = {
				initPage:function(itemCount){
					$("#krryPage").tzPage(itemCount, {
						num_display_entries : 5, //主体页数
						num_edge_entries : 4,//边缘页数
						current_page : 0,//指明选中页码
						items_per_page : 10, //每页显示多条条
						prev_text : "上一页",
						next_text : "下一页",
						showGo:true,//显示
						showSelect:false,
						callback : function(pageNo, psize) {//会回传两个参数，第一个当前页，第二个显示的页数
							krryAdminBlog.loadData(pageNo,psize);
						}
					});
				},
				loadData:function(pageNo,pageSize){
					$.ajax({
						type:"post",
						url:basePath+"/admin/loadTemplate.do",
						data:{pageNo:pageNo*pageSize,pageSize:pageSize},
						success:function(data){
							if(data){
								var html = "";
								var blogArr = data.blogs;
								for(var i=0,len=blogArr.length;i<len;i++){
									var json = blogArr[i];
									html+="	<tr data-categoryid='"+json.CATEGORYID+"' data-userid='"+json.USERID+"' data-opid='"+json.ID+"'>"+
									"	<td><input type='checkbox' value='"+json.ID+"'></td>"+
									"	<td><a class='t_avbiaoq' href='"+basePath+"/blog/detail/"+json.ID+".do' target='_blank' title='"+json.TITLE+"'>"+json.TITLE+"</a></td>"+
									"	<td><a class='t_avbiaoq' href='"+basePath+"/blog/kindOfBlog/"+json.CATEGORYID+".do' target='_blank' title='"+json.NAME+"'>"+json.NAME+"</a></td>"+
									"	<td><a class='t_avbiaoq' href='"+basePath+"/blog/personBlog/"+json.USERID+".do' target='_blank' title='"+json.USERNAME+"'>"+json.USERNAME+"</a></td>"+
									"	<td>"+json.CREATETIME+"</td>"+
									"	<td>"+json.HITS+"/"+json.COMMENTS+"</td>"+
									"	<td><a href='javascript:void(0);' onclick='tzAdminBlog.status(this)' data-opid='"+json.ID+"' data-mark='"+json.STATUS+"'  class='"+(json.STATUS==1?'green':'red')+"'>"+(json.STATUS==1?'已发布':'未发布')+"</a></td>"+
									"	<td>"+
										"	<a class='t_avbiaoq t_mode' href='"+basePath+"/admin/edit/"+json.ID+".do'>修改</a>"+
										"	<a class='t_avbiaoq t_dele' href='javascript:void(0);' onclick='krryAdminBlog.del(this)' data-opid='"+json.ID+"'>删除</a>"+
									"	</td>"+
									"	</tr>";
								}
								$("#tbody").html(html);
							}
						}
					});
				},
				
				del:function(obj){
					$.tzAlert({content:"您确定删除吗？",title:"Krry的温馨提示",callback:function(ok){
						if(ok){
							var opid = $(obj).data("opid");
							$.ajax({
								type:"post",
								url:basePath+"/admin/delete.do",
								data:{id:opid},
								success:function(data){
									krryMessage.tip(data=="success"?"删除成功!":"删除失败!");
									if(data=="success"){
										$(obj).parents("tr").fadeOut("slow",function(){
											$(this).remove();
											var ij = $(".ke_tabbox .sendMy span").text();
											$(".ke_tabbox .sendMy span").text(ij-1);
										});
									}
								}
							});
						}
					}});
				},
				status:function(obj){
					var opid = $(obj).data("opid");
					var status = $(obj).data("mark");
					var mark = (status==1) ? 0 : 1;
					$(obj).toggleClass("green red").html(status!=1?"已发布":"未发布");
					$(obj).data("mark",mark);
					$.ajax({
						type:"post",
						url:basePath+"/admin/update.do",
						data:{id:opid,status:mark},
						success:function(data){
							krryMessage.tip(data=="success"?"操作成功!":"操作失败!");
						}
					});
				}
						
			};
			
			krryAdminBlog.initPage($("#tbody").data("itemcount"));
			
			
			//控制底部
			var height = $(window).height();;
			var Hei = height - 154;
			$(".ttbodyy").css("height",Hei);
			
			$(window).resize(function(){
				height = $(window).height();
				Hei = height - 154;
				$(".ttbodyy").css("height",Hei);
			});
			
			//控制博客为空时的文字显示效果
			var count = $("#tbody").data("itemcount");
			if(count == 0){
				$(".hideAdd").show();
			}
			
			
		</script>
  	</body>
</html>
