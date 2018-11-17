<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="${staticPath}/css/wechat/weui.css"/>
    <link rel="stylesheet" href="${staticPath}/css/wechat/weuix.css"/>
    
<%-- <script type="text/javascript" src="${staticPath}/jquery-easyui/jquery-1.8.0.min.js"></script> --%>
<script type="text/javascript" src="${staticPath}/jquery/jquery.form.js"></script>


     <script src="${staticPath}/js/wechat/zepto.js"></script>
    <script type="text/javascript" src="${staticPath}/js/wechat/jweixin-1.0.0.js"></script>
    <script src="${staticPath}/js/wechat/weui.min.js"></script>
    <!--<script src="js/example.js"></script>-->
    <script>
        $(function(){


        });

    </script>
    <style>
   
   #icon{
        font-size: 24px;
        line-height: 40px;
        margin: 5px 0;
        color:#10AEFF;
        -webkit-transition: font-size 0.5s ease-out 0s;
        -moz-transition: font-size 0.5s ease-out 0s;
        transition: font-size 0.5s ease-out 0s;

    }
</style>
 <style>
     #cs #w{height:50px;width:100px;margin:5px 15px;
        float: left;
        }
    </style>

</head>

<body ontouchstart class="page-bg">


<div class="page-bd">
    
    <div class="weui-panel weui-panel_access">
       
           
            
            	
      <div style="padding-left: 20px;padding-right: 20px;">
            		
        <div class="weui-tab">
            <div class="weui-navbar">
                <div class="weui-navbar__item weui-bar__item_on" id="1" onclick="findMyAppoint(1)">
             	         代办理
                </div>
                <div class="weui-navbar__item" id="2" onclick="findMyAppoint(2)">
                	历史记录
                </div>
                <div class="weui-navbar__item" id="3" onclick="findMyAppoint(3)">
                  	已过期
                </div>
                
            </div>
            
            </div>
            
            
            
            
            
            
            <div id="myAppoint" style="padding-top: 60px;">
           <%--  <c:choose>
            <c:when test="${appointList.size()>0 }">
            <c:forEach items="${appointList }" var="at">
            <div class="weui-tab__panel" style="margin-top: 10px;">
				<p>预约码：${at.appointmentCode }</p>
            	<p>预约时间：${at.appointmentDay }|${at.period }|${at.timeItersal }</p>	
            	<p>预约违章类型：${at.illegalType}</p>
            	<p>预约违章处理窗口：${at.appointmentWindow }</p>
            	<p>违章处理地址：${at.appointmentAddress }</p>
            	<p>预约状态：待办理<a href="${path}/wechat/delMyAppoint?id=${at.id}" class="weui-btn weui-btn_primary">取消预约</a>
            	</p>
            </div>
            
            </c:forEach>
            </c:when>
            
            </c:choose> --%>
            
        </div>
        
       </div>
             
    </div>
    
   <input  id="userCode" value="${userCode}" type="hidden"  / >  	
    
</div>

    <script type="text/javascript">
    $(function(){
    //初始化记录
    $("#myAppoint").html("");
    $.ajax({
	    	type:"post",
	    	data:{"status":"1","userCode":$("#userCode").val()},
	    	url:"${path}/wechat/findMyAppoint",
	    	success:function(result){
		    	console.log("result-->"+result);
		    	var len=result.appointList.length;
		    	if(len==0){
	            	$("#myAppoint").append("无预约记录！");
	            	return;
		    	}
		    	
		    	for(var i=0;i<len;i++){
		    	var status=result.appointList[i].status;
		    	var statusWZ="代办理";
		    	var href="<a href='javascript:;' class='weui-btn weui-btn_primary' id='"+result.appointList[i].id+"' onclick='cancelAppoint(this)'>取消预约</a>";
		    	if(status==1){
		    	statusWZ="待办理"+href;
		    	}
		    	if(status==2){
		    	statusWZ="已办理";
		    	}
		    	if(status==3){
		    	statusWZ="已过期";
		    	}
		    	//预约时间
		    	var appointmentDay=result.appointList[i].appointmentDay;
		    	var date = new Date(appointmentDay); 
		    	var year=date.getFullYear();
		    	var mon=date.getMonth()+1;
		    	var day=date.getDate();
		    	var date2=year+"年"+mon+"月"+day+"日";
		    	var period=result.appointList[i].period;
		    	var periodWZ="上午";
		    	if(period==2){
		    		periodWZ="下午";
		    	}
		    	var timeItersal=result.appointList[i].timeItersal;
		    	var time=date2+" "+periodWZ+" "+timeItersal;
		    	var html="<div class='weui-tab__panel' style='margin-top: 10px;'>"
					+"<p>预约码："+result.appointList[i].appointmentCode+"</p>"
	            	+"<p>预约时间："+time+"</p>"	
	            	+"<p>预约违章类型："+result.appointList[i].illegalType+"</p>"
	            	+"<p>预约违章处理窗口："+result.appointList[i].appointmentWindow+"</p>"
	            	+"<p>违章处理地址："+result.appointList[i].appointmentAddress+"</p>"
	            	+"<p>预约状态："+statusWZ
	            	+"</p>"
	            	+"</div>";
	            	$("#myAppoint").append(html);
	            	
		    	}
	    	},
	    	error:function(result){
	    		$("#myAppoint").append("无预约记录！");
	            	return;
	    	}
    	})
    
    
    
    
    
    
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        });
    });
    
    
    
    function findMyAppoint(status){
    $("#myAppoint").html("");
    	$.ajax({
	    	type:"post",
	    	data:{"status":status,"userCode":$("#userCode").val()},
	    	url:"${path}/wechat/findMyAppoint",
	    	success:function(result){
		    	console.log("result-->"+result);
		    	var len=result.appointList.length;
		    	if(len==0){
	            	$("#myAppoint").append("无预约记录！");
	            	return;
		    	}
		    	
		    	for(var i=0;i<len;i++){
		    	var status=result.appointList[i].status;
		    	var statusWZ="代办理";
		    	var href="<a href='javascript:;' class='weui-btn weui-btn_primary' id='"+result.appointList[i].id+"' onclick='cancelAppoint(this)'>取消预约</a>";
		    	if(status==1){
		    	statusWZ="待办理"+href;
		    	}
		    	if(status==2){
		    	statusWZ="已办理";
		    	}
		    	if(status==3){
		    	statusWZ="已过期";
		    	}
		    	//预约时间
		    	var appointmentDay=result.appointList[i].appointmentDay;
		    	var date = new Date(appointmentDay); 
		    	var year=date.getFullYear();
		    	var mon=date.getMonth()+1;
		    	var day=date.getDate();
		    	var date2=year+"年"+mon+"月"+day+"日";
		    	var period=result.appointList[i].period;
		    	var periodWZ="上午";
		    	if(period==2){
		    		periodWZ="下午";
		    	}
		    	var timeItersal=result.appointList[i].timeItersal;
		    	var time=date2+" "+periodWZ+" "+timeItersal;
		    	var html="<div class='weui-tab__panel' style='margin-top: 10px;'>"
					+"<p>预约码："+result.appointList[i].appointmentCode+"</p>"
	            	+"<p>预约时间："+time+"</p>"	
	            	+"<p>预约违章类型："+result.appointList[i].illegalType+"</p>"
	            	+"<p>预约违章处理窗口："+result.appointList[i].appointmentWindow+"</p>"
	            	+"<p>违章处理地址："+result.appointList[i].appointmentAddress+"</p>"
	            	+"<p>预约状态："+statusWZ
	            	+"</p>"
	            	+"</div>";
	            	$("#myAppoint").append(html);
	            	
		    	}
	    	},
	    	error:function(result){
	    		$("#myAppoint").append("无预约记录！");
	            	return;
	    	}
    	})
    	
    }
    
    
     function cancelAppoint(obj){
    		$.ajax({
	    	type:"post",
	    	data:{"id":obj.id,"userCode:":$("#userCode").val()},
	    	url:"${path}/wechat/delMyAppoint",
	    	success:function(result){
	    	alert(result.status);
		    	console.log("result-->"+result);
		    	 $("#myAppoint").html("");
		    	findMyAppoint(1);
    		},
    		error:function(result){
    			alert("系统繁忙，请稍后再试！");
    		}
    		});
    } 
    
    
</script>
<br>
<br>

</body>
</html>