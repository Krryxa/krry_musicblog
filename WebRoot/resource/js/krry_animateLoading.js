(function($){
	$.loading = function(options){
		var opts = $.extend({},$.loading.template,$.loading.defaults,options);
		var $div = $(opts["t"+opts.mark]);
		$div.width(opts.width).height(opts.height).css("marginTop",(opts.target.height()/2-opts.height/2));
		//$div.find("*").css("background","green")
		opts.target.html($div);
	};
	
	$.loading.defaults = {
		width:40,
		height:40,
		mark:1
	};
	
	$.loading.template = {
		t1:"<div class='sk-cube-grid'>"+
			"      <div class='sk-cube sk-cube1'></div>"+
			"      <div class='sk-cube sk-cube2'></div>"+
			"      <div class='sk-cube sk-cube3'></div>"+
			"      <div class='sk-cube sk-cube4'></div>"+
			"      <div class='sk-cube sk-cube5'></div>"+
			"      <div class='sk-cube sk-cube6'></div>"+
			"      <div class='sk-cube sk-cube7'></div>"+
			"      <div class='sk-cube sk-cube8'></div>"+
			"      <div class='sk-cube sk-cube9'></div>"+
			"    </div>",
		t2:" <div class='sk-rotating-plane'></div>",
		t3:"<div class='sk-folding-cube'>"+
			"      <div class='sk-cube1 sk-cube'></div>"+
			"      <div class='sk-cube2 sk-cube'></div>"+
			"      <div class='sk-cube4 sk-cube'></div>"+
			"      <div class='sk-cube3 sk-cube'></div>"+
			"    </div>",
		t4:"<div class='sk-spinner sk-spinner-pulse'></div>",
		t5:"<div class='sk-wandering-cubes'>"+
		   "   <div class='sk-cube sk-cube1'></div>"+
		   "   <div class='sk-cube sk-cube2'></div>"+
		   "</div>",
		t6:"<div class='sk-wave'>"+
			"   <div class='sk-rect sk-rect1'></div>"+
			"   <div class='sk-rect sk-rect2'></div>"+
			"   <div class='sk-rect sk-rect3'></div>"+
			"   <div class='sk-rect sk-rect4'></div>"+
			"   <div class='sk-rect sk-rect5'></div>"+
			"</div>",
		t7:"<div class='sk-circle'>"+
			"   <div class='sk-circle1 sk-child'></div>"+
			"   <div class='sk-circle2 sk-child'></div>"+
			"   <div class='sk-circle3 sk-child'></div>"+
			"   <div class='sk-circle4 sk-child'></div>"+
			"   <div class='sk-circle5 sk-child'></div>"+
			"   <div class='sk-circle6 sk-child'></div>"+
			"   <div class='sk-circle7 sk-child'></div>"+
			"   <div class='sk-circle8 sk-child'></div>"+
			"   <div class='sk-circle9 sk-child'></div>"+
			"   <div class='sk-circle10 sk-child'></div>"+
			"   <div class='sk-circle11 sk-child'></div>"+
			"   <div class='sk-circle12 sk-child'></div>"+
			"</div>",
		t8:"<div class='sk-double-bounce'>"+
			"   <div class='sk-child sk-double-bounce1'></div>"+
			"   <div class='sk-child sk-double-bounce2'></div>"+
			" </div>",
		t9:"<div class='sk-chasing-dots'>"+
			"   <div class='sk-child sk-dot1'></div>"+
			"   <div class='sk-child sk-dot2'></div>"+
			"</div>",
		t10:"<div class='sk-three-bounce'>"+
			"  <div class='sk-child sk-bounce1'></div>"+
			"  <div class='sk-child sk-bounce2'></div>"+
			"  <div class='sk-child sk-bounce3'></div>"+
			"</div>",
		t11:"<div class='sk-fading-circle'>"+
			"	<div class='sk-circle1 sk-circle'></div>"+
			"	<div class='sk-circle2 sk-circle'></div>"+
			"	<div class='sk-circle3 sk-circle'></div>"+
			"	<div class='sk-circle4 sk-circle'></div>"+
			"	<div class='sk-circle5 sk-circle'></div>"+
			"	<div class='sk-circle6 sk-circle'></div>"+
			"	<div class='sk-circle7 sk-circle'></div>"+
			"	<div class='sk-circle8 sk-circle'></div>"+
			"	<div class='sk-circle9 sk-circle'></div>"+
			"	<div class='sk-circle10 sk-circle'></div>"+
			"	<div class='sk-circle11 sk-circle'></div>"+
			"	<div class='sk-circle12 sk-circle'></div>"+
			"</div>"
	}

})(jQuery)