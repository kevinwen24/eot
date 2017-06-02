	
function show_fail_message(str){
	$(".fail_message_container").html(str);
	$(".fail_message_container").css("display","block");
	setTimeout(function(){
		$(".message_container").css("display","none");
	}, 2000);
};

function show_success_message(str){
	$(".success_message_container").html(str);
	$(".success_message_container").css("display","block");
	setTimeout(function(){
		$(".message_container").css("display","none");
	}, 2000);
};


function getObjById(key) {
    return document.getElementById(key);
}

function getObjIndexFirstByName(key) {
    return document.getElementsByName(key)[0];
}

function inputValueTrim(ele) {
    return ele.value.trim()
}

function setEleStyleDiaplay(ele,attr) {
    ele.style.display=attr;
}

function setEleStylevisibility(ele,attr) {
    ele.style.visibility = attr;
}

function setEleBorder(ele,attr) {
    ele.style.border=attr;
}
