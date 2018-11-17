<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta charset="utf-8">  
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="${staticPath}/css/wechat/weui.css"/>
    <link rel="stylesheet" href="${staticPath}/css/wechat/weuix.css"/>
    
	<script type="text/javascript" src="${staticPath}/jquery/jquery.form.js"></script>


     <script src="${staticPath}/js/wechat/zepto.js"></script>
    <script type="text/javascript" src="${staticPath}/js/wechat/jweixin-1.0.0.js"></script>
    <script src="${staticPath}/js/wechat/weui.min.js"></script>
    <script>
        $(function(){


        });

    </script>
    <script type="text/javascript">  
    
    //检查form
		function checkForm(){
			//短信验证
		　var phoneC="<%=session.getAttribute("phone")%>"; 
			　var codeC="<%=session.getAttribute("code")%>"; 
			var phone=$("#phone").val();
			var code=$("#code").val();
			console.log("codec--->"+codeC);
			console.log("phoneC--->"+phoneC);
			console.log("code--->"+code);
			console.log("phone--->"+phone);
			if(phoneC!=phone || codeC!=code){
			alert("请输入正确验证码！");
			return false;
			}
			//预约时间区间
			var timeItersal=$("#timeItersal").val();
			if(timeItersal==null||timeItersal==undefined||timeItersal==""){
			alert("请先选中预约时间");
				return false;
			}
			
			//上下午时间
			var period=$("#period").val();
			if(period==null||period==undefined||period==""){
			alert("请先选中预约时间");
				return false;
			}
			//放号日期
			var appointmentDay=$("#appointmentDay").val();
			if(appointmentDay==null||appointmentDay==undefined||appointmentDay==""){
			alert("请先选中预约时间");
				return false;
			}
			
			//var phoneC=$("#phoneC").val();
			//var codeC=$("#codeC").val();
            
			return true;
		}
		
    
    function sendCode(obj){  
        var phone = document.getElementById("phone");  
        var value = phone.value.trim();  
        console.log("phone-->"+phone);
         console.log("value-->"+value);
        if(value && value.length == 11){  
            $.ajax({ 
            	type:"post", 
                cache : false, 
                dataType:"json", 
                url : "${path}/wechat/sendMsgCode",  
                data : {phone : value},
                success:function(result){
                console.log("result--"+result);
                $("#phoneC").val(result.phone);
                 $("#codeC").val(result.code);
                console.log("result--"+result.phone);
                 console.log("result--"+result.code);
                 console.log("result--"+result.code);
                }
                  
            });  
            // 5分钟内禁止点击  
            for (var i = 1; i <= 300; i++) {  
                // 1秒后显示  
                window.setTimeout("updateTime(" + (300 - i) + ")", i * 1000);  
            }  
        }else{  
            alert("请输入正确的手机号码");  
            phone.focus();  
              
        }  
    }  
      
    function updateTime(i){  
        // setTimeout传多个参数到function有点麻烦，只能重新获取对象  
        var obj = document.getElementById("validationCode");  
        if(i > 0){  
            obj.innerHTML  = "距离下次获取还有" + i + "秒";  
            obj.disabled = true;  
        }else{  
            obj.innerHTML = "获取验证码";  
            obj.disabled = false;  
        }  
    }  
      
  <%--   function checkTime(){  
        var sendCodeTime = <%=(Long)session.getAttribute("SEND_CODE_TIME")%>;  
        if(sendCodeTime){  
            var nowTime = new Date().getTime();  
            var flag = Math.floor((nowTime - sendCodeTime)/1000);  
            if(flag < 60){  
                var end = 60 - flag;  
                // 进页面马上开始，选i为0  
                for (var i = 0; i <= end; i++) {  
                    window.setTimeout("updateTime(" + (end - i) + ")", i * 1000);  
                }  
            }  
        }  
    }   --%>
      
      
</script>  
</head>  
<body onload="checkTime();">  
    <div align="center">  
        <div>  
            <form id="validateForm" action="${path}/wechat/validate" onSubmit="return checkForm()">  
                <div>手机号：<input id="phone" type="text" name="phone" value="" maxlength="11"/></div>  
                <div>验证码：<input type="text" id="code" name="code"><button id="validationCode" type="button" onclick="sendCode(this);" title="获取验证码">获取验证码</button></div>  
                <div><button type="submit"  title="提交">提交</button></div>  
            </form>  
        </div>  
    </div>  
</body>  
</html>  