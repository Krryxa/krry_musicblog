//播放对象
function dom(id){
	return document.getElementById(id);
};

//播放器
var krAudio = {
	audioDom:null,
	init:function(callback){//播放器初始化
		this.audioDom = dom("audio");
		this.audioDom.volume = 0.5;//默认一半音量
		this.time(callback);
	},
	
	//播放
	play:function(){
		this.audioDom.play();
	},
	
	//暂停
	stop:function(){
		this.audioDom.pause();
	},
	
	time:function(callback){//时间
		var $this = this;
		//加载完毕的函数 
		this.audioDom.addEventListener("canplaythrough",function(){
			if(callback)callback.call(this,true,$this.format(this.duration));
		});
		//播放中的函数 timeupdate
		this.audioDom.addEventListener("timeupdate",function(){
			//获取总时长
			var time = this.duration;
			//获取播放时长
			var ctime = this.currentTime;
			var percent = ((ctime / this.duration) * 100).toFixed(2);
			if(callback)callback.call(this,false,$this.format(ctime),percent);

			//获取播放进度
			var scurrent = ctime / time;
			//转换成百分比
			var percent = scurrent * 100;
			//根据歌曲进度赋值
			$(".controlTime .c_played").width(percent+"%");
			$(".controlTime .c_curr").css("left",percent+"%");
			//赋值到歌词区域的进度条
			$(".a_smallcontroll").width(percent+"%");
			$(".a_currentcontroll").css("left",percent+"%");
		});
		this.audioDom.addEventListener("ended",function(){
			$(".ke_op").click();
		});
	},
	
	format:function(time){//日期格式化
		var m=Math.floor(time/60);
		var s =Math.floor(time%60);
		if(m<10)m="0"+m;
		if(s<10)s="0"+s;
		return m+":"+s;
	},
	
	mute:function(){//静音
		
	},
	
	next:function(){//下一首
		
	},
	
	prev:function(){//上一首
		
	},
	
	randomMusic:function(){//随机播放
		
	},
	
	complelrc:function(){ //点击全屏歌词按钮
		//点击全屏歌词按钮
		var lrcLrc = true;
		var nowTime = 0;
		$(".complelrc").click(function(){
			if(new Date() - nowTime > 700){
				nowTime = new Date();
				if(lrcLrc){
					$(".l_con").removeClass("animated rollOut").show().addClass("animated rollIn");
					lrcLrc = false;
				}else{
					$(".l_con").removeClass("animated rollIn").addClass("animated rollOut");
					setTimeout(function(){
						$(".l_con").hide();
					},700);
					lrcLrc = true;
				}
			}
		});
		//点击歌词屏幕的×
		$(".con_close").click(function(){
			$(".l_con").removeClass("animated rollIn").addClass("animated rollOut");
			setTimeout(function(){
				$(".l_con").hide();
			},700);
			lrcLrc = true;
		});
	},
	
	loadLrc:function(){//加载歌词
		var vallrc = $(".hidetextlrc").text();
		//如果没有上传歌词或者删除了歌词
		if(!vallrc || $(".is_deleteLrc").text() == 1){
			$(".lrc_content_notext").text("暂无歌词");
			$(".lrc_content_notext").show();
			return;
		}
		$.ajax({  //异步请求获取本地歌词
			url:basePath+"/"+vallrc,
			type:"post",
			success:function(data){
				//第一次分离歌词
				var lrcArr = data.split("[");
				//存放分离后的歌词
				var html = "";
				var lrclast = null; //记录上一行的歌词
				var lrcmes = null; //记录当前行的歌词
				var bofo = -1; //记录上一行歌词的秒数
				var ms = -1; //当前这一行的秒数
				for(var i = 0;i < lrcArr.length;i++){
					//第二次分割歌词，变成["03:01.08","这个世界变得更加美丽"],数组以逗号分隔
					var arr = lrcArr[i].split("]");
					//取到数组arr下标为1的歌词部分
					//将上一行的歌词赋值给lrclast
					lrclast = lrcmes; 
					//得到当前歌词
					lrcmes = arr[1];
					//取到时间
					var time = arr[0].split("."); //变成["03:01","08"]
					//取到time下标为0的分钟和秒
					var ctime = time[0].split(":"); //变成["03","01"];
					//将上一行的秒数赋值给bofo
					bofo = ms;
					//转化成秒数
					ms = ctime[0]*60 + ctime[1]*1;
					//如果上一行和当前行秒数相同，则当前行秒数++ ,解决秒数相同的办法
					if(bofo == ms){
						ms++;
					}else if(ms >= 0){
						if(!isNaN(bofo)){ //如果是数字
							var classeName = "l_"+bofo;
							var concon = bofo;//bofo会自增，所以下面for循环条件用这个变量来代替
							for(var j = 0;j < ms-concon-1;j++){
								classeName += " l_"+ ++bofo;
							}
							if(ms>=0 && lrclast != null){
								html += "<li class='"+classeName+"'>"+lrclast+"</li>";
							}
						}
					}
				}
				//装载最后一行歌词的机制，先获取歌曲总时间
				setTimeout(function(){
					var allall = krAudio.audioDom.duration;
					var classlaName = "l_"+ms;
					var conben = ms; //ms会自增，所以下面for循环条件必须用这个变量来代替
					for(var j = 0;j < allall-conben-1;j++){
						classlaName += " l_"+ ++ms;
					}
					html += "<li class='"+classlaName+"'>"+lrcmes+"</li>";
					//把解析好的歌词放入歌词展示区中
					$("#lrcly").html(html);
					$("#lyrics").html(html);
				},200);
			}
		});
		// 联动音乐播放歌词
		krAudio.audioDom.addEventListener("timeupdate",function(){
			//获取当前播放时间,获得的是秒数
			var time = this.currentTime;
			//解析音乐对应的时间
			var m = parseInt(time / 60);//获取此时的分钟
			var s = parseInt(time); //转换int类型，获取此时的秒数
			$(".l_"+s).addClass("lrcsel").siblings().removeClass("lrcsel");
			//歌词滚动条，使歌词在中间的计算公式：
			//第n行歌词*li的高度-歌词区域中间的li（就是包括这个li,取这个li的一半）以上的li的总高度
			//局部歌词的控制
			$(".lrc_content_box").stop().animate({
				scrollTop:(($(".lrcsel").index()+1)*29 - 145)//减去159.5的偏差，使当前歌词在中间
			},240);
			//全屏歌词的控制
			$("#lyrics").stop().animate({
				scrollTop:(($(".lrcsel").index()+1)*24 - 168)//减去159.5的偏差，使当前歌词在中间
			},240);
		});
	},
	controlTime:function(){//拖动进度条
		var conTime = null;
		dom("mboxbb").onmousemove = function(){
			dom("conTimes").style.display = "block";
			dom("conTimes").style.opacity = "1";
			clearTimeout(conTime);
		};

		dom("mboxbb").onmouseleave = function(){
			dom("conTimes").style.opacity = "0";
			conTime = setTimeout(function(){
				dom("conTimes").style.display = "none";
			},2000);
		};
		//主屏幕点击拖拽进度条
		dom("conTimes").onmousedown = function(e){
			//获取点击的位置
			var _this = this;
			var e = e || window.event;
			var x = e.clientX;
			//获取起点位置
			var le = _this.offsetLeft;
			var mbox = dom("mobesfcon").offsetLeft;
			var mbsre = dom("wrapboxfcon").offsetLeft;
			//获取进度条总宽度
			var maxWidth = _this.offsetWidth;
			//当前点击的进度为
			var left = x - le - mbox - mbsre;
			//换算成百分比
			var per = left/maxWidth*100;
			if(per < 0) per = 0;
			if(per > 100) per = 100;
			dom("c_playplay").style.width = per+"%";
			dom("c_currcurr").style.left = per+"%";
			//联动进度
			krAudio.audioDom.currentTime = krAudio.audioDom.duration*per/100;

			document.onmousemove = function(e){
				var e = e || window.event;
				var x1 = e.clientX;
				//当前点击的进度为
				var left1 = x1 - le - mbox - mbsre;
				//换算成百分比
				var per1 = left1/maxWidth*100;
				if(per1 < 0) per1 = 0;
				if(per1 > 100) per1 = 100;
				dom("c_playplay").style.width = per1+"%";
				dom("c_currcurr").style.left = per1+"%";
				//联动进度
				krAudio.audioDom.currentTime = krAudio.audioDom.duration*(per1/100);
			};
			document.onmouseup = function(){
				document.onmousemove = null;
				document.onmouseup = null;
			};
		};
		
		//歌词区域点击拖拽进度条
		dom("controlllrcID").onmousedown = function(e){
			//获取点击的位置
			var _this = this;
			var e = e || window.event;
			var x = e.clientX;
			//获取起点位置
			var le = $(this).offset().left;
			//获取进度条总宽度
			var maxWidth = _this.offsetWidth;
			//当前点击的进度为
			var left = x - le;
			//换算成百分比
			var per = left/maxWidth*100;
			if(per < 0) per = 0;
			if(per > 100) per = 100;
			dom("small_lrcID").style.width = per+"%";
			dom("current_lrcID").style.left = per+"%";
			//联动进度
			krAudio.audioDom.currentTime = krAudio.audioDom.duration*per/100;

			document.onmousemove = function(e){
				var e = e || window.event;
				var x1 = e.clientX;
				//当前点击的进度为
				var left1 = x1 - le;
				//换算成百分比
				var per1 = left1/maxWidth*100;
				if(per1 < 0) per1 = 0;
				if(per1 > 100) per1 = 100;
				dom("small_lrcID").style.width = per1+"%";
				dom("current_lrcID").style.left = per1+"%";
				//联动进度
				krAudio.audioDom.currentTime = krAudio.audioDom.duration*(per1/100);
			};
			document.onmouseup = function(){
				document.onmousemove = null;
				document.onmouseup = null;
			};
		};
	},
	controlVoice:function(){//拖动音量条
		var lockvolume = true; //静音的锁
		//单击和拖动控制音量
		$(".b_ball").mousedown(function(e){
			//获取点击的位置
			var _this = $(this);
			//获取起点x轴坐标
			var begin = _this.offset().left;
			//获取音量条总宽度
			var fin = _this.width();
			//获取当前音量的宽度

			/*这是点击改变音量*/
			//获取鼠标点击的x轴坐标
			var x1 = e.clientX || e.pageX;
			var width1 = x1 - begin;
			// 判断边界
			if(width1 < 0) width1 = 0;
			if(width1 > fin) width1 = fin; //总长度fin
			$(".a_small").width(width1 + "px");
			$(".a_current").css("left",width1 + "px");
			//根据当前音量条赋值
			krAudio.audioDom.volume = width1 / fin;//[0-1]之间
			if(krAudio.audioDom.volume > 0){
				$(".b_muit").css({
					"background-position": "0px -200px"
				});
				lockvolume = true;
			}else{
				$(".b_muit").css({
					"background-position": "0px -220px"
				});
				lockvolume = false;
			}
			
			$(document).mousemove(function(e){//点击后移动的时候
				//获取鼠标点击的x轴坐标
				var x = e.clientX || e.pageX;
				var width = x - begin;
				// 判断边界
				if(width < 0) width = 0;
				if(width > fin) width = fin; //总长度fin
				$(".a_small").width(width + "px");
				$(".a_current").css("left",width + "px");
				//根据当前音量条赋值
				krAudio.audioDom.volume = width / fin;//[0-1]之间
				if(krAudio.audioDom.volume > 0){
					$(".b_muit").css({
						"background-position": "0px -200px"
					});
					lockvolume = true;
				}else{
					$(".b_muit").css({
						"background-position": "0px -220px"
					});
					lockvolume = false;
				}
			}).mouseup(function(){ //当鼠标弹起的时候，取消绑定这几个事件
				$(document).unbind("mousemove");
				$(document).unbind("mouseup");
			});
		});

		var currentVolume = 0;   //储存当前的音量，为恢复音量做准备
		var currentWidth = 0;  //储存当前音量条的长度
		//点击音量图标设置静音和恢复音量
		$(".b_muit").mousedown(function(){
			if(lockvolume){
				$(".b_muit").css({
					"background-position": "0px -220px"
				});
				currentVolume = krAudio.audioDom.volume;//储存当前的音量，为恢复音量做准备
				currentWidth = $(".a_small").width();  //储存当前音量条的长度
				//设置音量条长度为0
				$(".a_small").width(0 + "px");
				$(".a_current").css("left",0 + "px");
				krAudio.audioDom.volume = 0;
				lockvolume = false;
			}else{
				$(".b_muit").css({
					"background-position": "0px -200px"
				});
				//恢复之前音量条长度
				$(".a_small").width(currentWidth + "px");
				$(".a_current").css("left",currentWidth + "px");
				krAudio.audioDom.volume = currentVolume;//恢复当前音量
				lockvolume = true;
			}
		});
	}
};

var krBar = {
	arr:[],//定义一个容器，装载每一个bar对象
	mw:2,/*每个一个元素的宽度*/
	init:function(){
		//获取盒子对象
		var boxDom = dom("wrapbox");
		//获取盒子对象宽度
		var bwidth = boxDom.clientWidth;
		var cells = Math.floor(bwidth / this.mw);
		boxDom.style.width = (cells+1) * this.mw+"px";
		for(var i=0;i<=cells;i++){
			var spanDom = document.createElement("span");
			spanDom["className"] = "items";
			css(spanDom,{left:i*krBar.mw,width:krBar.mw-1});
			boxDom.appendChild(spanDom);
			krBar.arr.push(spanDom);
		}
	}
};


var krryMusic = {
	mark:false,
	
	init:function(){//ie11以上的浏览器才支持 
		//1:音频上下文===html5+ajax+audioContext   html5+audio+audioContext  
		window.AudioContext = window.AudioContext || window.webkitAudioContext || window.mozAudioContext || window.msAudioContext;
		/*动画执行的兼容写法*/
		window.requestAnimationFrame = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.msRequestAnimationFrame;
		//2:初始化音轨对象
		var audioContext = new window.AudioContext();
		return audioContext;
	},
	
	parse:function(audioContext,audioDom,callback){
		try{
			//拿到播放器去解析你音乐文件
			var audioBufferSouceNode = audioContext.createMediaElementSource(audioDom);
			//创建解析对象
			var analyser = audioContext.createAnalyser();
			//将source与分析器连接
			audioBufferSouceNode.connect(analyser); 
			//将分析器与destination连接，这样才能形成到达扬声器的通路
			analyser.connect(audioContext.destination);
			//调用解析音频的方法
			krryMusic.data(analyser,callback);
		}catch(e){
			
		}
	},
	
	data:function(analyser,callback){
		if(krryMusic.mark){
			//讲音频转换一个数组
			var array = new Uint8Array(analyser.frequencyBinCount);
			analyser.getByteFrequencyData(array);
			//通过回调函数返回
			if(callback)callback(array);
			requestAnimationFrame(function(){
				krryMusic.data(analyser,callback);
			});
		}
	}
};

window.onload = function(){
	krAudio.loadLrc(); //装载和联动歌词
	krAudio.complelrc(); //全屏歌词
	krAudio.controlTime(); //控制拖动进度条
	krAudio.controlVoice(); //控制音量
	krBar.init();
	//点击音乐播放后触发函数
	var audioDom = dom("audio");
	var audioContext = krryMusic.init();
	audioDom.onplay = function(){
		krryMusic.mark = true;//播放的时候就打开
		//获取音轨解析对象
		var len = krBar.arr.length;
		krryMusic.parse(audioContext,audioDom,function(dataArr){//1024
			for(var i=0;i<len;i++){
				krBar.arr[i].style.height = dataArr[i]+"px";
				krBar.arr[i].style.background = "linear-gradient(#dcdcdc,#b7b7b7,#a0a0a0,#a0a0a0,#dedede)";
			}
		});
	};
	
};