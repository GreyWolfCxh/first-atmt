<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<meta name="decorator" content="default"/>
<style type="text/css">
html,body{
    width: 100%;
    height: 100%;
    overflow:hidden;
    margin:0px;
}
.container{
    width: 400px;
    height: 300px;
    margin: auto;
    margin-top: 250px;
}
#main{
	width:100%;
	height:100%;
	margin:0px;
	padding:0px;
}
.text_input{
	width:200px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#loginButton").click(function(){
		$('#login_form').submit();
	}); 
	$("body").bind('keyup',function(event) { 
		  if(event.keyCode==13){
			  $('#loginButton').trigger("click"); 
		  }   
	});
 	window.onload = function () {  
        if (window.parent.window != window) {  
            window.top.location = "${path}/sys/login.view";  
        }  
    }
 	
});
if(window != top){
    top.location.href = location.href;
}
</script>
</head>
<body>
	<div id="main" class="easyui-panel" border="false" >
	<div class="container">
	    <div class="easyui-panel" title="登陆" style="width:400px" >
	    	<form id="login_form" method="post" action="${path}/sys/login">
	    		<table cellpadding="5">
	    			<tr>
	    				<td>账号:</td>
	    				<td><input class="text_input" type="text" name="username"  ></input></td>
	    			</tr>
	    			<tr>
	    				<td>密码:</td>
	    				<td><input class="text_input" type="password" name="password" ></input></td>
	    			</tr>
	    			<tr>
	    				<td></td>
	    				<td>${errorMessage }</td>
	    			</tr>
	    			<tr>
						<td></td>
						<td>
							<input type="submit" class="easyui-linkbutton"  id="loginButton" value="登陆" ></input>
							<input type="button" class="easyui-linkbutton"  value="注册" onclick="javascript:goRegister()"></input>	
						</td>
					</tr>
	    		</table>
	    	</form>
	    </div>
	</div>
	</div>
    <script>
        function goRegister(){
            window.location.href="${path}/register";
        }
    </script>
</body>
</html>