	
$(function(){
	
});
function show_fail_message(str){
	$(".fail_message_container").html(str);
	$(".fail_message_container").css("display","block");
	setTimeout(function(){
		$(".message_container").css("display","none");
	}, 2000);
};