$(function(){
	var isShow=false;
	$(".my_info_btn").click(function(){
		if(!isShow){
			$(".my_info_dropdown_menu").animate(
				{
					left: -80, opacity: 'show'
	 			},
	 			{ 
	 				duration: 500
	 			}
 			);
 			isShow=true;
		}else{
			$(".my_info_dropdown_menu").animate(
				{
					left: 0, opacity: 'hide'
	 			},
	 			{ 
	 				duration: 500
	 			}
	 		);
 			isShow=false;
		}
		
	});
	$(document).click(function(){
		if(isShow){
			$(".my_info_dropdown_menu").animate(
				{
					left: 0, opacity: 'hide'
	 			},
	 			{ 
	 				duration: 500
	 			}
	 			
	 	);
	 	isShow=false;
	 }
	});
});
