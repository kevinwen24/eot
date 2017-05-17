$(function(){
	$(".header_nav").on("click" , function() {
		if($(this).attr("menu_select") == undefined || !$(this).attr("menu_select")) {
			$(this).find("span").attr("class","glyphicon glyphicon-chevron-down");
			$(this).next().slideDown(200);
			$(this).attr("menu_select","true")
		} else {
			$(this).find("span").attr("class","glyphicon glyphicon-chevron-left");
			$(this).removeAttr("menu_select");
			$(this).next().slideUp();
		}
	})
});
