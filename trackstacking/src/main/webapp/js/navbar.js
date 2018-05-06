$(function(){
		
		//处理登录
		$("#login-submit").submit(function(){
			var email=$("#inputEmail").val();
	        var password=$("#inputPassword").val();
	        var data = {        
			        "email": email,
			        "password":password,
			 };
	        url = "login.do";
	        $.ajax({
	            type:"POST",
	            url:url,
	            data:data,
	            success:function(data){
	            	var res=JSON.parse(data);
	                if(res.status==200){
	                    $("#SignInModalCenter").modal('hide');
	                    location.reload();
	                }else{
	                	$('#collapse-error-hint').html(res.msg);
	                	$('#collapse-error-hint').collapse()
	                }
	            }
	        });
	        return false;
	        
		});//处理登录 End

	
	
	//获取验证码
	$("#get-validate-code").click(function(){
		var email=$("#inputEmail-signup").val();
		var btn=$(this);
		if(!checkEmail(email)){
			$('#collapse-error-hint-signup').html("请输入正确的邮箱");
        	$('#collapse-error-hint-signup').collapse()
			return;
		}
        var data = {        
		        "email": email,
		 };
        url = "getValidateCode.do";
        $.ajax({
            type:"POST",
            url:url,
            data:data,
            success:function(data){
            	var res=JSON.parse(data);
            	if(res.status==200){
            		settime(btn);
            	}
            	$('#collapse-error-hint-signup').html(res.msg);
            	$('#collapse-error-hint-signup').collapse();
            }
        });
        
	  });//获取验证码 End
	
	
	
	//处理注册
	$("#register-submit").submit(function(){
			var email=$("#inputEmail-signup").val();
	        var password=$("#inputPassword-signup").val();
	        var passwordAgain=$("#inputPasswordAgain-signup").val();
	        if(passwordAgain!=password){
	        	$('#collapse-error-hint-signup').html("两次密码不一致");
	        	$('#collapse-error-hint-signup').collapse();
	        	return false;
	        }
	        var validateCode=$("#validate-code-signup").val();
	        var data = {        
			        "email": email,
			        "password":password,
			        "validateCode":validateCode,
			 };
	        url = "register.do";
	        $.ajax({
	            type:"POST",
	            url:url,
	            data:data,
	            success:function(data){
	            	var res=JSON.parse(data);
	                if(res.status==200){
	                    $("#SignUpModalCenter").modal('hide');
	                    location.reload();
	                }else{
	                	$('#collapse-error-hint-signup').html(res.msg);
	                	$('#collapse-error-hint-signup').collapse()
	                }
	            }
	        });
	        return false;
	        
		});//处理注册 End
		
	
	});
	
	
	//验证邮箱
	function checkEmail(str){
		   var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		   if(re.test(str)){
			   return true;
		   }else{
			   return false;
		   }
	}//验证邮箱 End
	
	
	//限制60s获取一次验证码
	var waitTime=60;
	var cnt=waitTime;
	function settime(val) {
		if (cnt == 0) {
			val.attr("disabled", false);
			val.html("重新获取");
			val.css({
			"background":"#007BFF"
			}); 
			cnt = waitTime;
			return false;
		} else {
			val.attr("disabled", true);
			val.html("正在获取"+cnt);
			val.css({
			"background":"#ccc"
			});
			cnt--;
		}
		setTimeout(function() {
			settime(val)
		},1000);
	}//限制60s获取一次验证码 End