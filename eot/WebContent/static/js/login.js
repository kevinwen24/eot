function login(){
    //test server validation
    var formIsSub = true;
    var userId = getObjIndexFirstByName("userId").value;
    var password = getObjIndexFirstByName("password").value;
    var radioVal=$('input:radio[name="role"]:checked').val();
    var tip_message = getObjById("tip_message");

    if(!userId.trim() && !password.trim() && !radioVal) {
        formIsSub = false;
        tip_message.style.visibility="visible";
        tip_message.innerHTML = "请输入相应内容！";
        return;
    }
    
    if(!userId.trim() && !password.trim()) {
        formIsSub = false;
        tip_message.style.visibility="visible";
        tip_message.innerHTML = "请输入相应账号密码！";
        return;
    }

    if(!userId.trim()){
        setEleStylevisibility(tip_message, "visible");
        tip_message.innerHTML = "请输入相应的账号";
        formIsSub = false;
        return;
    }
    
    if(!password.trim()){
        setEleStylevisibility(tip_message, "visible");
        tip_message.innerHTML = "请输入相应的密码";
        formIsSub = false;
        return;
    }

    if(!radioVal){
    	setEleStylevisibility(tip_message, "visible");
        tip_message.innerHTML = "请选择账号类型！";
        formIsSub = false;
        return;
    }

    if(isNaN(userId)){
        setEleStylevisibility(tip_message, "visible");
        tip_message.innerHTML = "账号输入不合法,必须是数字类型！";
        formIsSub = false;
        return;
    }
    
    if(formIsSub){
        var form = document.forms.loginForm;
        form.submit();
    }
}
window.onload = function(){
    var userId = getObjIndexFirstByName("userId");
    var password = getObjIndexFirstByName("password");
    var errorUserName = getObjById("error_userName");
    var errorPassword = getObjById("error_password");
    var tip_message = getObjById("tip_message");
    userId.onfocus = function(){
        setEleStyleDiaplay(errorUserName,"none");
        setEleStylevisibility(tip_message, "hidden");
    }
    
    password.onfocus = function(){
        setEleStyleDiaplay(errorPassword,"none");
        setEleStylevisibility(tip_message, "hidden");
    }
}