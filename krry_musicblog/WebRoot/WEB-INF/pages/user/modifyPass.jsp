<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="../common/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="Description" content="乐诗博客是一个音乐、日记分享平台，我们致力于让用户发表自己的心情，分享自己喜爱的音乐，聆听你我的声音">
		<title>修改用户信息</title>
		<%@include file="../common/common.jsp" %>
		<link rel="stylesheet" href="${basePath}/resource/css/animate.css"/>
		<style>
			.ttbodyy{    width: 960px;
					    margin: 20px auto 0px;
					    padding: 6px;min-height: 650px;
					}
			#modify{    width: 480px;
			    border-radius: 20px;
			    background: linear-gradient(rgba(255, 175, 175, 0.9),rgba(255, 189, 132, 0.9));
			    position:absolute;
			    z-index: 10;
			}
			.lo_title{font-size: 20px;
					    color: #fff;
					    text-align: center;
					    position: relative;
					    top: 27px;}
			.login_close{width: 23px;
					    height: 26px;
					    color: #fff;
					    cursor: pointer;
					    float: right;
					    margin-top: 6px;
					    margin-right: 10px;
					    font-size: 30px;
					    transition:.6s;
					    display:none;}
			.login_close:hover{color:red;transition:.6s;}
			.login_error{width: 298px;
						padding-right: 18px;
					    text-align: right;
					    font-size: 12px;
					    height: 28px;
					    float: left;
					    color:#FF0050;}
			.dialogover{position:fixed;
				top:0;
				left:0;
				right:0;
				bottom:0;
				background:#111;
				opacity:0.5;
				z-index:9;
			}
			
			#modify .loginwrap{width:329px;margin:-24px auto;}	
			#modify .logo{width:198px;height:38px;margin:29px auto;}
			#modify .cnt_i{margin-top:35px;}
			
			#modify .cnt_i  .inp{font-size:14px;height:36px;width:224px;border:none;text-indent:0.5em;font-family:inherit;color:#666;outline:none}
			#modify .subbtn{margin-top: 22px;margin-bottom: 62px;height:25px;width:130px;border-radius:10px;display:inline-block;text-align: center;padding:6px 0;color:#fff;transition:background 1s ease;}
			#modify .lo_subb{background:#32A724;}
			#modify .re_subb{background:#E88B00;}
			#modify .subbtn:hover{background:#E24A02;}
			.a_change{margin: 40px 40px 10px 70px;
				    display: block;
				    color: #fff;transition:.6s;}
			.a_change:hover{color:red;transition:.6s;}
			
			.c_right .userlogined{color:#f90;transition:.6s;}
			.c_right .userlogined:hover{color:red;transition:.6s;}
			.cntarea {
			    width: 212px;
			    background: #fff;
			    padding: 6px;
			    height: 69px;
			    border:0;
			    overflow-y: auto;
			}
			textarea {
			    overflow: auto;
			    resize: none;
			}
			.pesocen{    float: left;
    					margin-right: 1px;}
			.buttontotnt{text-align:center;margin: 16px;}
			.re_back{background:#ff6969;}
			
			.wordwradn{width: 300px;height:56px;}
			.wordmodig{cursor:pointer;float:right;}
			.wordmodig:hover{color:#dd5862;transition:.3s;}
			.modipassword{display:none;}
			
			.jianjiwerq{width: 300px;height:56px;}
			.jianjiwer{cursor:pointer;float:right;}
			.jianjiwer:hover{color:#dd5862;transition:.3s;}
			
			.allping_con{width:100%;height:100%;background:rgba(0,0,0,0.6);position:fixed;left:0;top:0;z-index:100;display:none;text-align:center;}
		</style>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<div class="allping_con"></div>
		<div class="wrapbox">
			<div class="ttbodyy">
				<a href="${basePath}" class="backnetwork"><span class="nextword">首页</span></a>
				<img class="nextjming" src="${basePath}/resource/images/next.png" alt="下一级" width="20" height="20"><a href="${basePath}/admin/index" class="backnetwork"><span class="nextword">个人中心</span></a>
				<img class="nextjming" src="${basePath}/resource/images/next.png" alt="下一级" width="20" height="20"><a class="modifianoao" href="${basePath}/admin/modifyCenter/${user.ID}" class="backnetwork"><span class="nextword modififf">修改个人信息</span></a>
				<br>
				<div id='modify' data-id="${user.ID}">
					<div class='loginwrap'>
						<div class='logo'>
							<p class="lo_title">修改个人信息</p>
						</div>
						<div class='cnt_i'>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;昵称：<input type='text' class='inp kr_name' placeholder='请输入昵称...' maxlength='9' autocomplete='off' value="${user.USERNAME}" autofocus='autofocus' id='othername'/></p>
							<p class='login_error login_name'></p>
							<p>号码/邮箱：<input type='text' class='inp kr_admin_res' placeholder='请输入手机号码或邮箱...' autocomplete='off' autofocus='autofocus' value="${user.EMAIL}" id='email'/></p>
							<p class='login_error login_res'></p>
							<p style="height: 109px"><span class="pesocen">&nbsp;个人简介：</span><textarea class="cntarea" id="description" placeholder="不超过100字" onpropertychange="textchange(this);" oninput="textchange(this);">${user.DESCRIPTION}</textarea></p>
							<p class='login_error'></p>
							<p class="wordwradn"><span class="wordmodig">修改密码</span></p>
							<div class="modipassword">
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;原密码：<input type='password' placeholder='请输入原密码...' autocomplete='off' class='inp kr_respass12' id='password12'/></p>
								<p class="passwordLInkg" style="display:none">${user.PASSWORD}</p>
								<p class='login_error login_pass12'></p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新密码：<input type='password' placeholder='请输入新密码...' autocomplete='off' class='inp kr_respass' id='password' /></p>
								<p class='login_error login_pass'></p>
								<p>&nbsp;确认密码：<input type='password' placeholder='请确认新密码...' autocomplete='off' class='inp kr_pass2' id='password2'/></p>
								<p class='login_error login_pass2'></p>
								<p class="jianjiwerq"><span class="jianjiwer">收起，不修改密码</span></p>
							</div>
							<span class="buttontotnt"><a href='javascript:void(0);' class='subbtn re_subb'>确认修改</a></span>
							<span class="buttontotnt"><a href="${basePath}/admin/index" class='subbtn re_back'>返回</a></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	  <!--底部-->
		<%@include file="../common/footer.jsp" %>
		<script type="text/javascript">
			var $email = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
			var $phone = /^1[3|4|5|7|8]\d{9}$/;
			var $password = /^[A-Za-z0-9]+$/;
			
			$(window).resize(changeLogin);
			changeLogin();
			function changeLogin(){
				var $box = $("#modify");
				//盒子的宽高
				var width = $box.width();
				var height = $box.height();
				//可视区域的宽高
				var H = $(".wrapbox").height();
				var W = $(".wrapbox").width();
				//盒子的位置
				var top = H/2 - height/2;
				var left = W/2 - width/2;
				$box.css({
					top:top,
					left:left
				});
			}
			
			
			//控制底部
			var height = $(window).height();;
			var Hei = height - 154;
			$(".ttbodyy").css("height",Hei);
			
			$(window).resize(function(){
				height = $(window).height();
				Hei = height - 154;
				$(".ttbodyy").css("height",Hei);
			});
			
			//验证
			$(".kr_name").blur(resname);
			$(".kr_admin_res").blur(resuser);
			$(".kr_respass").blur(respassword);
			$(".kr_respass12").blur(respassword12);
			$(".kr_pass2").blur(respassword2);
			
			//昵称提示信息
			function resname(){
				var name = $("#othername").val();
				if(isEmpty(name)){
					$(".login_name").text("请输入昵称");
					$("#othername").focus();
					return false;
				}else{
					$(".login_name").text("");
					return name;
				}
			}
			
			//验证账号信息
			function resuser(){
				var name = $("#email").val();
				if(isEmpty(name)){
					$(".login_res").text("请输入手机号码或邮箱");
					$("#email").focus();
					return false;
				}else if(!$email.test(name) && !$phone.test(name)){
					$(".login_res").text("手机号码或邮箱地址格式不正确");
					$("#email").focus();
					return false;
				}else{
					$(".login_res").text("");
					return name;
				}
			}
			//原密码
			function respassword12(){
				var password = $("#password12").val();
				if(isEmpty(password)){
					$(".login_pass12").text("请输入原密码");
					$("#password12").focus();
					return false;
				}else if(!$password.test(password)){
					$(".login_pass12").text("密码中不可带有特殊字符");
					$("#password12").focus();
					return false;
				}else if((password.length < 6) || (password.length > 16)){
					$(".login_pass12").text("密码长度为6~16");
					$("#password12").focus();
					return false;
				}else{
					$(".login_pass12").text("");
					return password;
				}
			};
			
			//新密码
			function respassword(){
				var password = $("#password").val();
				if(isEmpty(password)){
					$(".login_pass").text("请输入密码");
					$("#password").focus();
					return false;
				}else if(!$password.test(password)){
					$(".login_pass").text("密码中不可带有特殊字符");
					$("#password").focus();
					return false;
				}else if((password.length < 6) || (password.length > 16)){
					$(".login_pass").text("请设置密码长度为6~16");
					$("#password").focus();
					return false;
				}else{
					$(".login_pass").text("");
					return password;
				}
			};
			
			//确认密码信息
			function respassword2(){
				var pass = respassword();
				var pass2 = $("#password2").val();
				if(isEmpty(pass2)){
					$(".login_pass2").text("请再次输入密码");
					return false;
				}else if(pass != pass2){
					$(".login_pass2").text("两次输入的密码不匹配");
					return false;
				}else{
					$(".login_pass2").text("");
					return pass2;
				}
			}
			
			//修改密码的标志true修改
			var flag = false;
			
			//点击修改密码
			$(".wordmodig").click(function(){
				$(".wordwradn").hide();
				$(".modipassword").fadeIn();
				changeLogin();//改变窗口位置
				flag = true;
			});
			
			//点击收起
			$(".jianjiwer").click(function(){
				$(".wordwradn").fadeIn();
				$(".modipassword").hide();
				changeLogin();//改变窗口位置
				flag = false;
			});
			
			//确认修改
			$(".re_subb").click(function(){
				//用户名验证
				if(!resname()) return;
				//如果手机号码或邮箱格式不正确
				if(!resuser()) return;
				
				var id = $("#modify").data("id");
				var username = $("#othername").val();
				var email = $("#email").val();
				var description = $("#description").val();
				var password12 = $("#password12").val();//原密码
				var password2 = $("#password2").val(); //新密码
				
				var params;
				if(!flag){
					params = {
						id:id,
						username:username,		
						email:email,
						description:description
					};
					$("#tzloading").remove();//先移除
					$(".allping_con").show();
					loading("正在保存",900);//再展示

					$.ajax({
						type:"post",
						url:basePath+"/admin/updateUser",
						data:params,
						success:function(data){
							if(data=="success"){
								//提示框去掉
								$("#tzloading").animate({"top":20},function(){
									$(this).remove();
								});
								$(".allping_con").hide();
								krryMessage.tip("修改成功!!!");
								//1秒后跳转回首页
								setTimeout(function(){
									window.location.href = basePath;
								},1000);
							}
						}
					});
				}else{
					//判断新密码输入格式是否正确
					if(!respassword()) return;
					//判断第二次密码输入是否与第一次相同
					if(!respassword2()) return;
					//判断原密码是否正确
					var oripassword = password12;//原密码
					var mdpassword = $(".passwordLInkg").text();//加密的原密码
					$.ajax({
						type:"post",
						url:basePath+"/admin/oripassword",
						data:{id:id,password:oripassword,mdpassword:mdpassword},
						success:function(data){
							//原密码输入错误
							if(data=="fail"){
								$(".login_pass12").text("原密码输入错误，请重新输入");
								return;
							}else{
								params = {
									id:id,
									username:username,
									password:password2,
									email:email,
									description:description
								};
								
								$("#tzloading").remove();//先移除
								$(".allping_con").show();
								loading("正在保存",900);//再展示

								$.ajax({
									type:"post",
									url:basePath+"/admin/updateUser",
									data:params,
									success:function(data){
										if(data=="success"){
											//提示框去掉
											$("#tzloading").animate({"top":20},function(){
												$(this).remove();
											});
											$(".allping_con").hide();
											krryMessage.tip("修改成功!!!");
											//1秒后跳转回首页
											setTimeout(function(){
												window.location.href = basePath;
											},1000);
										}
									}
								});
							}
						}
					});
				}
			});
			
			function textchange(obj){
				if($(obj).val().length>100){
					var text = $(obj).val().substring(0,100);
					$(obj).val(text);
				}
					
			};
		</script>
  	</body>
</html>
