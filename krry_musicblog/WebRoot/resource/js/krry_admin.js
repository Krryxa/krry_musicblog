$(function(){
	krryLogin.loginSuccess();
	krryTop.init();
	krryCommon.loadImage();
	krryCommon.center();
});


var krryCommon = {
	loginIndex:1, //记住登录失败的次数
	loadImage:function(){
		$(".ke_imgs").on("error",function(){
			$(this).attr("src",basePath+"/resource/images/noimg.jpg");
		});
	},
	
	center:function(){
		$("#userCenter").click(function(){
			if(!$("#username").text()){
				krryLogin.login();
			}
		});
	}
};


//置顶事件
var krryTop = {
	init:function(){
		$(window).scroll(function(){
			var top = $(this).scrollTop();
			$(".backTop")[top>=200?"show":"hide"]();
		});

		$(".backTop")["on"]("click",function(){
			$("html,body")["animate"]({scrollTop:0},200);
		});
	}
};

var krryMessage = {
	tip:function(message){
		$("#messagetip").remove();
		$("body").append("<div id='messagetip'>"+
		"<span><i class='iconfont icon-bell'></i>"+message+"</span>"+
		"</div>");
		$("#messagetip").animate({top:0},700).delay(1000).animate({top:-56});
	}	
};


var krryLogin = {
	flag:true,
	//退出登录
	logout:function(obj){
		$.tzAlert({content:"您确定要退出吗？",title:"温馨提示",callback:function(ok){
			if(ok){
				$("#userCenter").attr("href","javascript:void(0)");
				$.ajax({
					type:"post",
					url:basePath+"/login/logout",
					success:function(data){
						if(data=="success"){
							krryMessage.tip("已退出登录...");
//							var html = "<a href='javascript:void(0);' onclick='krryLogin.login()'>登陆</a>"+
//							"<a href='javascript:void(0);' onclick='krryLogin.resi()'>注册</a>";
//							$("#loginbox").html(html);
							window.location.href = basePath;
						}
					}
				});
			}
		}});
	},
	loginSuccess:function(){
		$.ajax({
			type:"post",
			url:basePath+"/login/success",
			success:function(data){
				var html = "";
				if(data){//登录成功
					$("#userCenter").attr("href",basePath+"/admin/index");
					 html = "<span style='color:#363636;font-size:14px;'>欢迎：</span><a href='"+basePath+"/admin/index' target='_blank' id='username' class='userlogined' title='"+data.username+"的个人中心' style='margin-left:0;'>"+data.username+"</a>"+
					"<a href='javascript:void(0);' onclick='krryLogin.logout(this)'><i class='iconfont icon-tuichu'></i>退出</a>";
				}else{
					 html = "<a href='javascript:void(0);' onclick='krryLogin.login()'>登陆</a>"+
					"<a href='javascript:void(0);' onclick='krryLogin.resi()'>注册</a>";
				}
				$("#loginbox").html(html);
			}
		});
	},
	
	login:function(){
		$("#login_dialog").remove();
		$(".dialogover").remove();
		$("body").append("<div id='login_dialog'>"+
		"	<div class='login_close'>×</div>"+
		"	<div class='loginwrap'>"+
		"	<div class='logo'>"+
		"	<a href='javascript:void(0)' title='首页'><img src='"+basePath+"/resource/images/logo22.png' height='45' style='margin:-18px 0;'/></a>"+
		"	</div>	"+
		"	<div class='cnt_i'>"+
		"	<p><input type='text' class='inp kr_admin' placeholder='请输入昵称或账号..' autocomplete='off' autofocus='autofocus' id='name'/></p>"+
		"	<p class='login_error login_admin'></p>"+
		"	<p><input type='password' placeholder='请输入密码...' autocomplete='off' class='inp kr_pass' id='password'/></p>"+
		"	<p class='login_error login_pass'></p>"+
		"	<p class='login_yanz'><input type='text' placeholder='请输入验证码...' maxlength='4' autocomplete='off' class='inp kr_code' id='code'/><img src='"+basePath+"/kaptcha/code' class='yanz_img' onclick='krryLogin.changeyanz($(this));'></p>"+
		"	<p class='login_error login_code'></p>"+
		"	<p><a href='javascript:void(0);' class='subbtn lo_subb'><i class='iconfont icon-bell'></i>登陆</a></p>"+
		"	<a href='javascript:void(0);' class='a_change'>没有Krry账号？点击注册</a>"+
		"	</div>	"+
		"	</div>"+
		"	</div>"+
		"	<div class='dialogover'></div>");
		
		if(this.flag){
			$("#login_dialog").addClass("animated bounceInDown");
			setTimeout(function(){
				$("#login_dialog").removeClass("animated bounceInDown");
			},1000);
		}else{
			$("#login_dialog").addClass("animated bounceInLeft");
			setTimeout(function(){
				$("#login_dialog").removeClass("animated bounceInLeft");
			},1000);
		}
		
		//点击转换成注册界面
		$(".a_change").click(function(){
			krryLogin.flag = false;
			$("#login_dialog").addClass("animated bounceOutRight");
			setTimeout(function(){
				$("#login_dialog").removeClass("animated bounceOutRight");
				krryLogin.resi();
			},500);
		});
		
		$(document).keydown(function(e){
			if(e.keyCode==13){
				$("#login_dialog").find(".lo_subb").trigger("click");
			}
		});
		
		this.set();
		
		//点击该区域以外的时候执行的事件
//		$("#login_dialog").next().off("click").on("click",function(){
//			$("#login_dialog").add(this).fadeOut("slow",function(){
//				$(this).remove();
//			});
//		});
		
	},
	
	resi:function(){
		$("#login_dialog").remove();
		$(".dialogover").remove();
		$("body").append("<div id='login_dialog' style='height:560px;margin-top:-280px;'>"+
		"	<div class='login_close'>×</div>"+
		"	<div class='loginwrap'>"+
		"	<div class='logo'>"+
		"	<a href='javascript:void(0)' title='首页'><img src='"+basePath+"/resource/images/logo22.png' height='45' style='margin:-18px 0;'/></a>"+
		"	</div>	"+
		"	<div class='cnt_i'>"+
		"	<p><input type='text' class='inp kr_name' placeholder='请输入昵称...' maxlength='9' autocomplete='off' autofocus='autofocus' id='othername'/></p>"+
		"	<p class='login_error login_name'></p>"+
		"	<p><input type='text' class='inp kr_admin_res' placeholder='请输入手机号码或邮箱...' autocomplete='off' autofocus='autofocus' id='email'/></p>"+
		"	<p class='login_error login_res'></p>"+
		"	<p><input type='password' placeholder='请输入密码...' autocomplete='off' class='inp kr_respass' id='password'/></p>"+
		"	<p class='login_error login_pass'></p>"+
		"	<p><input type='password' placeholder='请确认密码...' autocomplete='off' class='inp kr_pass2' id='password2'/></p>"+
		"	<p class='login_error login_pass2'></p>"+
		"	<p class='login_yanz resgi_yanz'><input type='text' placeholder='请输入验证码...' maxlength='4' autocomplete='off' class='inp kr_code' id='code'/><img src='"+basePath+"/kaptcha/code' class='yanz_img' onclick='krryLogin.changeyanz($(this));'></p>"+
		"	<p class='login_error login_code resgi_yanz'></p>"+
		"	<p><a href='javascript:void(0);' class='subbtn re_subb'><i class='iconfont icon-bell'></i>注册</a></p>"+
		"	<a href='javascript:void(0);' class='a_change'>已有Krry账号？点击登录</a>"+
		"	</div>	"+
		"	</div>"+
		"	</div>"+
		"	<div class='dialogover'></div>");
		
		if(this.flag){
			$("#login_dialog").addClass("animated bounceInDown");
			setTimeout(function(){
				$("#login_dialog").removeClass("animated bounceInDown");
			},1000);
		}else{
			$("#login_dialog").addClass("animated bounceInLeft");
			setTimeout(function(){
				$("#login_dialog").removeClass("animated bounceInLeft");
			},1000);
		}
		
		//点击转换成登录界面
		$(".a_change").click(function(){
			krryLogin.flag = false;
			$("#login_dialog").addClass("animated bounceOutRight");
			setTimeout(function(){
				$("#login_dialog").removeClass("animated bounceOutRight");
				krryLogin.login();
			},500);
		});
		
		this.set();
		
	},
	
	set:function(){
		var $email = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		var $phone = /^1[3|4|5|7|8]\d{9}$/;
		var $password = /^[A-Za-z0-9]+$/;
		
		//设置一开始窗口的聚焦表单
		$("#othername").focus();
		$("#name").focus();
		//注册验证
		$(".kr_name").blur(resname);
		$(".kr_admin_res").blur(resuser);
		$(".kr_respass").blur(respassword);
		$(".kr_pass2").blur(respassword2);
		//登录验证
		$(".kr_admin").blur(lousername);
		$(".kr_pass").blur(lopassword);
		$(".kr_code").blur(locode);
		
		//注册窗口的昵称提示信息
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
		
		//注册窗口的验证账号信息
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
		
		//注册窗口的密码验证信息
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
			}else if(password.length < 6 || password.length > 16){
				$(".login_pass").text("请设置密码长度为6~16");
				$("#password").focus();
				return false;
			}else{
				$(".login_pass").text("");
				return password;
			}
		};
		
		//注册窗口的确认密码信息
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
		
		//登录窗口的验证信息
		function lousername(){
			var name = $("#name").val();
			if(isEmpty(name)){
				$(".login_admin").text("请输入昵称或账号");
				$("#name").focus();
				return null;
			}else{
				$(".login_admin").text("");
				return name;
			}
		};
		function lopassword(){
			var password = $("#password").val();
			if(isEmpty(password)){
				$(".login_pass").text("请输入密码");
				$("#password").focus();
				return null;
			}else{
				$(".login_pass").text("");
				return password;
			}
		};
		
		//检查 验证码是否为空
		function locode(){
			var code = $("#code").val();
			if(isEmpty(code)){
				$(".login_code").text("请输入四位验证码");
				return null;
			}else{
				$(".login_code").text("");
				return code;
			}
		};

		//点击关闭窗口按钮
		$(".login_close").click(function(){
			krryLogin.flag = true;
			$("#login_dialog").addClass("animated bounceOutUp");
			setTimeout(function(){
				$("#login_dialog").hide();
				$(".dialogover").hide();
				$(".login_close").removeClass("animated bounceOutUp");
				$("#login_dialog").remove();
			},500);
		});

		//显示和隐藏关闭按钮
		$("#login_dialog").hover(function(){
			$(".login_close").show();
		},function(){
			$(".login_close").hide();
		});
		
		//给登录按钮绑定点击事件
		$("#login_dialog").find(".lo_subb").off("click").on("click",loginMain);
		
		//给注册按钮绑定点击事件
		$("#login_dialog").find(".re_subb").off("click").on("click",resigiMain);
		
		//登录点击的主方法
		function loginMain(){
			var $btn = $(this);
			var name = lousername();
			var password = lopassword();
			var code = locode();
			if(!name || !password){
				return;
			}
			
			if(krryCommon.loginIndex >= 3){ //失败3次显示验证码表单
				$(".a_change").css("margin", "22px 40px 10px 70px");
				$(".login_yanz").show();
				$(".login_code").show();
				if(!code){
					return;
				}
			}
			//传递给服务器端的数据
			var params = {name:name,password:password,code:code};
			//杀掉当前点击事件
			$btn.off("click").text("登录中...");
			$.ajax({
				type:"post",
				url:basePath+"/login/logined",
				data:params,
				error:function(){
					//若出错，重新绑定点击事件
					$btn.on("click",loginMain).html("<i class='iconfont icon-bell'></i>登陆");
				},
				success:function(data){
					$btn.on("click",loginMain).html("<i class='iconfont icon-bell'></i>登陆");
					if(data=="success"){
						$btn.text("登录成功");
						krryMessage.tip("登录成功...");
						//关闭窗口
						$(".login_close").trigger("click");
						krryLogin.loginSuccess();
						//更改登陆的用户信息
					}else if(data=="name_null"){
						krryMessage.tip("登录失败...请输入昵称或账号");
						$(".login_admin").text("请输入昵称或账号");
						krryCommon.loginIndex++;
						krryLogin.changeyanz($(".yanz_img"));//执行更换验证码
						$("#name").focus();
					}else if(data=="password_null"){
						krryMessage.tip("登录失败...请输入密码");
						$(".login_pass").text("请输入密码");
						krryCommon.loginIndex++;
						krryLogin.changeyanz($(".yanz_img"));
						$("#password").focus();
					}else if(data=="error_code"){
						krryMessage.tip("登录失败...验证码错误");
						$(".login_code").text("请输入正确的四位验证码");
						krryCommon.loginIndex++;
						krryLogin.changeyanz($(".yanz_img"));
					}else if(data=="error_password"){
						krryMessage.tip("登录失败...密码错误");
						$(".login_pass").text("请输入正确的密码");
						krryCommon.loginIndex++;
						krryLogin.changeyanz($(".yanz_img"));
						$("#password").focus();
					}else{
						krryMessage.tip("登录失败...用户名不存在");
						$(".login_admin").text("请输入正确的昵称或账号");
						krryCommon.loginIndex++;
						krryLogin.changeyanz($(".yanz_img"));
						$("#name").focus();
					}
				}
			});
		}
		
		//注册点击的主方法
		function resigiMain(){
			var $btn = $(this);
			var name = resname();//昵称 ,去掉前后的空格
			var email = resuser();//邮箱
			var password = respassword2();//密码
			var code = locode(); //验证码
			if(!name || !password || !email || !code){
				return;
			}
			
			//传递给服务器端的数据	
			var params = {name:name,email:email,password:password,code:code};
			//杀掉当前点击事件
			$btn.off("click").text("注册中...");
			$.ajax({
				type:"post",
				url:basePath+"/login/resig",
				data:params,
				error:function(){
					//若出错，重新绑定点击事件
					$btn.on("click",resigiMain).html("<i class='iconfont icon-bell'></i>注册");
				},
				success:function(data){
					$btn.on("click",resigiMain).html("<i class='iconfont icon-bell'></i>注册");
					if(data=="success"){
						$btn.text("注册成功");
						krryMessage.tip("注册成功...");
						//关闭窗口
						$(".login_close").trigger("click");
						krryLogin.loginSuccess();
						//更改登陆的用户信息
					}else if(data=="name_null"){
						krryMessage.tip("注册失败...请输入昵称");
						$(".login_name").text("请输入昵称");
						$("#othername").focus();
					}else if(data == "email_null"){
						krryMessage.tip("注册失败...请输入账号");
						$(".login_res").text("请输入手机号码或邮箱");
						$("#email").focus();
					}else if(data=="password_null"){
						krryMessage.tip("注册失败...请输入密码");
						$(".login_pass").text("请输入密码");
						$("#password").focus();
					}else if(data=="error_code"){
						krryMessage.tip("登录失败...验证码错误");
						$(".login_code").text("请输入正确的四位验证码");
						krryCommon.loginIndex++;
						krryLogin.changeyanz($(".yanz_img"));
					}else if(data == "Has_name"){
						krryMessage.tip("注册失败...昵称已存在");
						$(".login_name").text("请输入重新输入昵称");
						$("#othername").focus();
					}else if(data == "Has_email"){
						krryMessage.tip("注册失败...账号已存在");
						$(".login_res").text("请重新输入手机号码或邮箱");
						$("#email").focus();
					}
				}
			});
		}
	},
	changeyanz:function(obj){
		obj.attr("src",basePath+"/kaptcha/code?d="+new Date().getTime());
	}
};




