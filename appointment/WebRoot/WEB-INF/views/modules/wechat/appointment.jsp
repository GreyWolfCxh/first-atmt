<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="${staticPath}/css/wechat/weui.css"/>
    <link rel="stylesheet" href="${staticPath}/css/wechat/weuix.css"/>
    
	<script type="text/javascript" src="${staticPath}/jquery/jquery.form.js"></script>


     <script src="${staticPath}/js/wechat/zepto.js"></script>
    <script type="text/javascript" src="${staticPath}/js/wechat/jweixin-1.0.0.js"></script>
    <script src="${staticPath}/js/wechat/weui.min.js"></script>
    <script src="${staticPath}/js/example.js"></script>
    <style>
    .div{
    	color:blue;
    }
    
    .div2{
    	color:red !important;
    }
    </style>
   <style>
   /* 图标样式 */
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
    
   <script type="text/javascript">
    $(function(){
    //违章类型选择
     $('.weui-btn').on('click', function () {
            $(this).addClass('weui-btn_primary').siblings('.weui-btn_primary').removeClass('weui-btn_primary');
        });
        //短信验证,初始化--5分钟有效
		var phoneC="<%=session.getAttribute("phone")%>"; 
	      　var codeC="<%=session.getAttribute("code")%>";  
			if(phoneC!=null){
				$("#phoneC").val(phoneC);
			}
			if(codeC!=null){
			$("#codeC").val(codeC);
			}
        
    });
    //检查预约form
	function checkForm(){
			//短信验证
		   <%-- var phoneC="<%=session.getAttribute("phone")%>"; 
			var codeC="<%=session.getAttribute("code")%>";  --%>
			var phoneC=$("#phoneC").val();
			var codeC=$("#codeC").val();
			var phone=$("#phone").val();
			var code=$("#code").val();
			console.log("codec--->"+codeC);
			console.log("phoneC--->"+phoneC);
			console.log("code--->"+code);
			console.log("phone--->"+phone);
			/* if(phoneC!=phone || codeC!=code){
			alert("phoneC:"+phoneC+"-phone--"+phone);
			alert("codeC:"+codeC+"--code-"+code);
			alert("请输入正确验证码！");
			return false;
			} */
			//预约时间区间
			var timeItersal=$("#timeItersal").val();
			if(isNulls(timeItersal)){
				alert("请先选中预约时间");
				return false;
			}
			//放号日期
			 var remarks1=$("#remarks1").val();
			if(isNulls(remarks1)){
				alert("请先选中预约时间");
				return false;
			} 
			
			return true;
		}//end checkForm
		//判断非空
		function isNulls(val){
			if(val==null||val==undefined||val==""){
				return true;
			} 
			return false;
		}
		
	//预约日期项点击改变背景
    function chgColor(obj){
	    $(".weui-navbar__item").removeClass("weui-bar__item_on");
	    $(obj).addClass('weui-bar__item_on');
	    //显示相应日期的放号数量，如果该日期没有放号，默认为剩余0个。
	    getTime(obj);
    }
    
    //下一步，提交form表单
    function next(){
    
    $("#subForm").attr("disabled", true);
    $("#form").submit();
    }
    
    //点击预约日期获取预约放号情况
    function getTime(obj){
    	//var day="2018-10-29";
    	var day=obj.id;
    	//处理窗口id
    	var windowId=$("#windowId").val();
    	//接收选中的预约日期
    	 $("#remarks1").val(day);
    	console.log("day--->"+day);
    	 $("#leftTable").html("");  
		 $("#rightTable").html(""); 
    	$.ajax({
			dataType:'json',
			async:false,
			data:{"date":day,"windowId":windowId},
			url:"${path}/wechat/getRelease",
			success:function(result){
				console.log("测试——--------------》"+result);
					//显示该日期的放号数量情况
						//上午		
						var tableStr = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
					    	var len = result.resultSet.length;  
					   		 for ( var i = 0; i < len; i++) {  
					   		 var time=result.resultSet[i].timeIterval.substring(0,2);
					   		 if(time.indexOf(":") != -1 ){
						      	time=time.substring(0, 1);
						      }
					   		 var ch="剩余:";
					   		 var num=result.resultSet[i].appointmentNumber;
					   		  if(result.resultSet[i].operationNumber<result.resultSet[i].appointmentNumber){
					   		  	num=result.resultSet[i].operationNumber;
					   		  }
					   		  var color="background-color:white;";
					        tableStr = tableStr + "<tr>"  
					                +"<td id='"+time+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+result.resultSet[i].timeIterval+"' lang='"+num+"' style='color:#000000;' onclick='change(this,1);'>"
					                +"<span style='font-size:16px;'>上午"
					                +result.resultSet[i].timeIterval+"</span></br>"
					                +"<span style='font-size:16px;text-align:center;'>"+ch+"</span>"
					                +"<span id='"+result.resultSet[i].id+"'  style='font-size:16px;text-align:center;'>"+num+"个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					                
					     }  
					    if(len==0){  
					       var timeIterval="9:00-12:00"
					    	var id="am1";
					    	var num=0;
					        tableStr = tableStr + "<tr>"  
					                +"<td id='"+timeIterval+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+timeIterval+"' lang='"+num+"' style='color:#000000;'  onclick='change(this,1);'>"
					                +"<span style='font-size:16px;'>上午"
					                +timeIterval+"</span></br>"
					                +"<span style='font-size:16px;'>剩余："+"</span>"
					                +"<span id='"+id+"' style='font-size:16px;'>"+"0个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					    }  
					    tableStr = tableStr + "</table>";  
				    //下午
						var tableStr2 = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
					    var len2 = result.resultSet2.length;  
					    for ( var i = 0; i < len2; i++) {  
					     var time=result.resultSet2[i].timeIterval.substring(0,2);
					      if(time.indexOf(":") != -1 ){
					      	time=time.substring(0, 1);
					      }
					      var ch="剩余:";
					   		 var num=result.resultSet2[i].appointmentNumber;
					   		  if(result.resultSet2[i].operationNumber<result.resultSet2[i].appointmentNumber){
					   		  	num=result.resultSet2[i].operationNumber;
					   		  }
					   		  var color2="background-color:white;";
					        tableStr2 = tableStr2 + "<tr>"  
					                +"<td id='"+time+"' style='"+color2+"'   >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+result.resultSet2[i].timeIterval+"' lang='"+num+"' onclick='change(this,2);'>"
					                +"<span style='font-size:16px;'>下午"
					                +result.resultSet2[i].timeIterval+"</span></br>"
					                +"<span style='font-size:16px;text-align:center;'>"+ch+"</span>"
					                +"<span id='"+result.resultSet2[i].id+"'   style='font-size:16px;text-align:center;'>"+num+"个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					    }  
					    if(len2==0){  
					        var timeIterval="14:00-18:00"
					    	var id="pm1";
					    	var num=0;
					        tableStr2 = tableStr2 + "<tr>"  
					                +"<td id='"+timeIterval+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+timeIterval+"' lang='"+num+"' onclick='change(this,2);'>"
					                +"<span style='font-size:16px;'>下午"
					                +timeIterval+"</span></br>"
					                +"<span style='font-size:16px;text-align:center;'>剩余："+"</span>"
					                +"<span id='"+id+"'   style='font-size:16px;text-align:center;'>"+"0个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					    }  
					    tableStr2 = tableStr2 + "</table>"; 
		    
					    //添加到放号数量情况div中  
					    $("#leftTable").html(tableStr);  
					    $("#rightTable").html(tableStr2);  
					    //查询结果显示
					    $("#result").show();
					    //预约日期项显示
					     $("#times").show();
					     //验证手机div显示
				 		 $("#verifyPhone").show();
						
					},
					error:function(result){
						console.log("汇总失败---》");
						//上午		
						var tableStr = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
					    	var len = 0;  
					     if(len==0){  
					       var timeIterval="9:00-12:00"
					    	var id="am1";
					    	var num=0;
					        tableStr = tableStr + "<tr>"  
					                +"<td id='"+timeIterval+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+timeIterval+"' lang='"+num+"' onclick='change(this,1);'>"
					                +"<span style='font-size:16px;'>上午"
					                +timeIterval+"</span>"
					                +"<span style='font-size:16px;'>剩余："+"</span>"
					                +"<span id='"+id+"' style='font-size:16px;'>"+"0个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					    }  
					    tableStr = tableStr + "</table>";  
				    //下午
						var tableStr2 = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
					    var len2 = 0;  
					    if(len2==0){  
					        var timeIterval="14:00-18:00"
					    	var id="pm1";
					    	var num=0;
					        tableStr2 = tableStr2 + "<tr>"  
					                +"<td id='"+timeIterval+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+timeIterval+"' lang='"+num+"' onclick='change(this,2);'>"
					                +"<span style='font-size:16px;'>下午"
					                +timeIterval+"</span>"
					                +"<span style='font-size:16px;text-align:center;'>剩余："+"</span>"
					                +"<span id='"+id+"'  style='font-size:16px;text-align:center;'>"+"0个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					    }  
					    tableStr2 = tableStr2 + "</table>"; 
					    //添加到div中  
					    $("#leftTable").html(tableStr);  
					    $("#rightTable").html(tableStr2);  
					}
				});
    	
    }//end getTime
    
    <!-- 获取查询字段 -->
     function getSearch(obj){
     //记录违章类型id
     $("#illegalId").val(obj.id);
     $("#illegalType").val(obj.lang);
     //记录查询字段中文名称
     var zfield=[];
     //记录查询字段英文名称
      var efield=[];
  	 $("#result").html(""); //清空违章结果div
  	 $("#result").hide();//隐藏违章结果div
     $("#subNext").html("");//提交div
     $("#select").html("");//窗口下拉框
     $("#selectDiv").hide();//窗口div隐藏
     $("#search").html("");//查询div清空
     $("#result").hide();//违章记录隐藏
     $("#find").hide();//搜索按钮隐藏
     $("#searchs").hide();//查询按钮隐藏
     $("#times").hide();//预约日期项div隐藏
	 $("#verifyPhone").hide();//手机验证div隐藏
    	$.ajax({
    	    type:"post",
    	    dataType:'json',
			async:false,
			data:{"id":obj.id},
			url:"${path}/wechat/getSerachField",
			success:function(result){
			//如果有补充字段，则显示下一步，没有则直接提交预约
				if(JSON.stringify(result.addFields) != "[]"){
						var addFLen=result.addFields.length;
						console.log("addFLen-->"+addFLen);
						var submit="<a href='javascript:;' class='weui-btn weui-btn_primary' id='subForm' onclick='next();' >下一步</a>";
						$("#subNext").append(submit);
						$("#addStatus").val(1);
				}else{
					var submit="<a href='javascript:;' class='weui-btn weui-btn_primary' onclick='next();' >提交预约</a>";
						$("#subNext").append(submit);
						$("#addStatus").val(0);
				}
			//有查询字段
				console.log("ajax执行成功--"+JSON.stringify(result.fields));
				if(JSON.stringify(result.fields) != "[]"){
					console.log("count-----》"+result.fields[0].fieldEname);
					var len=result.fields.length;
					console.log("len-->"+len);
					for(var i=0;i<len;i++){
						var fieldZname=result.fields[i].fieldZname;
						var fieldEname=result.fields[i].fieldEname;
						zfield.push(fieldZname);
						efield.push(fieldEname);
						console.log("fi-->"+fieldEname);
						console.log("fi-->"+fieldZname);
						var input="<input  type='text' id='"+fieldEname+"'   name='"+fieldEname+"'     placeholder='"+fieldZname+"' style='padding-left:10px;margin-bottom: 50px; width:80px; height: 50px;'/>";
						$("#search").append(input);
					}
					var find="<div id='find' style='padding-left: 30px; float: right;'><a href='javascript:;' class='weui-btn weui-btn_mini weui-btn_primary' style=' width: 100px;height: 50px;text-align: center; line-height:50px;' onclick='getSerachResult()'>查询</a></div>";
					$("#search").append(find);
					$("#zfield").val(zfield);
					$("#efield").val(efield);
					$("#searchs").css("display", "block");
					$("#find").show();
					$("#subNext").hide();//提交div 
					$("#title3").html("3.可预约时间选择");
					$("#title4").html("4.手机号码");
				}else{
				//固定的处理窗口
				if(JSON.stringify(result.depts) != "[]"){
					var depts=result.depts;
					var deLen=result.depts.length;
					//记录窗口id
					$("#windowId").val(depts[0].id);
					var html;
					for(var i=0;i<deLen;i++){
					html +='<option value="'+depts[i].id+'">'+depts[i].name+'</option>';
					}
					$("#select").append(html);
				 	$("#selectDiv").show();
				}
				//没有查询字段情况下
				//预约日期div清空
				$("#dates").html("");
				//预约时间日期
					var days=result.listDate;
					var dLen=result.listDate.length;
					var temper=days[0];
			        //记录当前预约时间，默认第一个时间
			        $("#remarks1").val(temper);
					console.log("days-->"+days);
					for(var i=0;i<dLen;i++){
						var dayArr=days[i].split("-");
						var day=dayArr[2];
						var mon=dayArr[1];
						if(day.substring(0,1)=="0"){
							day=day.substring(1,2);
						}
						//预约日期显示，格式"11月11日"，默认第一个选中
						var time=mon+"月"+day+"日";
						if(i==0){
							var date=" <div class='weui-navbar__item   weui-bar__item_on'  id='"+days[i]+"'  onclick='chgColor(this)' >"
	                 		+time
	                 		+"</div>"
						}else{
							var date=" <div class='weui-navbar__item' onclick='chgColor(this)'  id='"+days[i]+"' >"
	                 		+time
	                 		+"</div>"
						}
						//把预约日期加进预约日期项
                 		$("#dates").append(date);	
					}
				//默认显示第一个预约日期的放号数量情况
				//上午		
						var tableStr = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
					    	var len = result.resultSet.length;  
					   		 for ( var i = 0; i < len; i++) {  
					   		 var time=result.resultSet[i].timeIterval.substring(0,2);
					   		 if(time.indexOf(":") != -1 ){
						      	time=time.substring(0, 1);
						      }
					   		 var ch="剩余:";
					   		 var num=result.resultSet[i].appointmentNumber;
					   		  if(result.resultSet[i].operationNumber<result.resultSet[i].appointmentNumber){
					   		  	num=result.resultSet[i].operationNumber;
					   		  }
					   		  var color="background-color:white;";
					       	 tableStr = tableStr + "<tr >"  
					                +"<td id='"+time+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' id='"+result.resultSet[i].timeIterval+"' lang='"+num+"'   style='color:#000000;' onclick='change(this,1);'>"
					                +"<span style='font-size:16px;'>上午"
					                +result.resultSet[i].timeIterval+"</span></br>"
					                +"<span style='font-size:16px;'>"+ch+"</span>"
					                +"<span id='"+result.resultSet[i].id+"' style='font-size:16px;'>"+num+"个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					                
					     }  
					    if(len==0){  
					    	var timeIterval="9:00-12:00"
					    	var id="am1";
					    	var num=0;
					        tableStr = tableStr + "<tr>"  
					                +"<td id='"+timeIterval+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+timeIterval+"' lang='"+num+"'  onclick='change(this,1);'>"
					                +"<span style='font-size:16px;'>上午"
					                +timeIterval+"</span></br>"
					                +"<span style='font-size:16px;'>剩余："+"</span>"
					                +"<span id='"+id+"' style='font-size:16px;'>"+"0个</span>"
					                +"</a></td>"  
					                +"</tr>";   
					    }  
					    tableStr = tableStr + "</table>";  
				    
				    
				    //下午
						var tableStr2 = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
					    var len2 = result.resultSet2.length;  
					    for ( var i = 0; i < len2; i++) {  
					    var time=result.resultSet2[i].timeIterval.substring(0,2);
					    if(time.indexOf(":") != -1 ){
					      	time=time.substring(0, 1);
					      }
					    var ch="剩余:";
					   	var num=result.resultSet2[i].appointmentNumber;
					   		  if(result.resultSet2[i].operationNumber<result.resultSet2[i].appointmentNumber){
					   		  	num=result.resultSet2[i].operationNumber;
					   		  }
					   		  var color2="background-color:white;";
				   		 
					        tableStr2 = tableStr2 + "<tr>"  
					                +"<td id='"+time+"' style='"+color2+"'   >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+result.resultSet2[i].timeIterval+"' lang='"+num+"'   onclick='change(this,2);'>"
					                +"<span style='font-size:16px;'>下午"
					                +result.resultSet2[i].timeIterval+"</span></br>"
					                +"<span style='font-size:16px;text-align:center;'>"+ch+"</span>"
					                +"<span id='"+result.resultSet2[i].id+"'  style='font-size:16px;text-align:center;'>"+num+"个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					    }  
					    if(len2==0){  
					    var timeIterval="14:00-18:00";
					    	var id="pm1";
					    	var num=0;
					        tableStr2 = tableStr2 + "<tr>"  
					                +"<td id='"+timeIterval+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+timeIterval+"' lang='"+num+"'  onclick='change(this,2);'>"
					                +"<span style='font-size:16px;'>下午"
					                +timeIterval+"</span></br>"
					                +"<span style='font-size:16px;text-align:center;'>剩余："+"</span>"
					                +"<span id='"+id+"'  style='font-size:16px;text-align:center;'>"+"0个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					    }  
					    tableStr2 = tableStr2 + "</table>"; 
		    
					    //添加到div中  
					    $("#leftTable").html(tableStr);  
					    $("#rightTable").html(tableStr2);  
						
						$("#title3").html("2.可预约时间选择");
						$("#title4").html("3.手机号码");
				  		$("#times").show();//选择预约时间div
				  		$("#verifyPhone").show();//手机认证div
				 		 $("#subNext").show();//提交div
				}
			},
			error:function(result){
			console.log("执行失败！");
			 $("#times").show();
			$("#verifyPhone").show();
			}
    	});
    	
    }//end getSearch
  	
  	/* 获取查询结果 */
  	function getSerachResult(){
  	console.log("测试---》");
  	//清空违章结果div
  	$("#result").html("");
  	//提交表单隐藏
  	$("#subNext").hide();
  	//获取查询字段的中英文名称
  	var zfield=$("#zfield").val();
  	var efield=$("#efield").val();
  	var zfields=zfield.split(",");
  	var efields=efield.split(",");
  	var len=zfields.length;
  	//动态拼接查询json数据{}
  	var data="{";
  	var illegalId="illegalId";
  	for(var i=0;i<len-1;i++){
  	data+='"'+efields[i]+'":"'+$("#"+efields[i]).val()+'",';
	  	console.log("fffff"+$("#"+efields[i]).val());
	  	}
	 data+='"'+efields[len-1]+'":"'+$("#"+efields[len-1]).val()+'",'
	 +'"'+illegalId+'":'+$("#"+illegalId).val()
	 +"}";
  	console.log("data"+data);
  	//传参
  	var datas= $.parseJSON( data );
  		console.log("data-->"+datas);
  		$.ajax({
    	type:"post",
    	dataType:'json',
    	data:datas,
		async:false,
		url:"${path}/wechat/getSerachResult",
		success:function(result){
			console.log("ajax执行成功--"+JSON.stringify(result.fields));
				if(JSON.stringify(result) != "[]"){
				//查询结果
				var serachResult=result.serachResult;
				console.log("s-------->"+serachResult.status);
				if(serachResult.status ==0 ){
				var html="<span>无违章记录！</span></br>"
				$("#result").append(html);
				$("#result").show();
				console.log("---没有查询结果==========");
				return;
				}
				
					$("#result").show();
				
				
					//预约日期项清空，重新获取
					$("#dates").html(" ");
					//预约时间日期
					var days=result.listDate;
					var dLen=result.listDate.length;
					var temper=days[0];
					//记录预约日期
			        $("#remarks1").val(temper);
					
					console.log("days-->"+days);
					for(var i=0;i<dLen;i++){
						var dayArr=days[i].split("-");
						var day=dayArr[2];
						var mon=dayArr[1];
						if(day.substring(0,1)=="0"){
							day=day.substring(1,2);
						}
						var time=mon+"月"+day+"日";
						if(i==0){
						var date=" <div class='weui-navbar__item weui-bar__item_on' id='"+days[i]+"'  onclick='chgColor(this)' >"
							+time
	                 		+"</div>";
						}else{
						var date=" <div class='weui-navbar__item' id='"+days[i]+"'  onclick='chgColor(this)' >"
							+time
	                 		+"</div>";
						}
						//把预约日期加进预约日期项
                 		$("#dates").append(date);	
					}
					//显示该预约日期下的放号数量情况
					//上午		
						var tableStr = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
					    	var len = result.resultSet.length;  
					   		 for ( var i = 0; i < len; i++) {  
					   		 var time=result.resultSet[i].timeIterval.substring(0,2);
					   		 if(time.indexOf(":") != -1 ){
						      	time=time.substring(0, 1);
						      }
					   		 var ch="剩余:";
					   		 var num=result.resultSet[i].appointmentNumber;
					   		  if(result.resultSet[i].operationNumber<result.resultSet[i].appointmentNumber){
					   		  	num=result.resultSet[i].operationNumber;
					   		  }
					   		  var color="background-color:white;";
				   		  
					        tableStr = tableStr + "<tr>"  
					                +"<td id='"+time+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+result.resultSet[i].timeIterval+"' lang='"+num+"' onclick='change(this,1);'>"
					                +"<span style='font-size:16px;'>上午"
					                +result.resultSet[i].timeIterval+"</span></br>"
					                +"<span style='font-size:16px;text-align:center;'>"+ch+"</span>"
					                +"<span id='"+result.resultSet[i].id+"' style='font-size:16px;text-align:center;'>"+num+"个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					                
					    }  
					    if(len==0){  
					    	var timeIterval="9:00-12:00"
					    	var id="am1";
					    	var num=0;
					        tableStr = tableStr + "<tr>"  
					                +"<td id='"+timeIterval+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+timeIterval+"' lang='"+num+"' onclick='change(this,1);'>"
					                +"<span style='font-size:16px;'>上午"
					                +timeIterval+"</span></br>"
					                +"<span style='font-size:16px;text-align:center;'>剩余："+"</span>"
					                +"<span id='"+id+"' style='font-size:16px;text-align:center;'>"+"0个</span>"
					                +"</a></td>"  
					                +"</tr>";   
					    }  
					    tableStr = tableStr + "</table>";  
				    
				    
				    //下午
						var tableStr2 = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
					    var len2 = result.resultSet2.length;  
					    for ( var i = 0; i < len2; i++) {  
					     var time=result.resultSet2[i].timeIterval.substring(0,2);
					      if(time.indexOf(":") != -1 ){
					      	time=time.substring(0, 1);
					      }
					      var ch="剩余:";
					   	  var num=result.resultSet2[i].appointmentNumber;
					   		  if(result.resultSet2[i].operationNumber<result.resultSet2[i].appointmentNumber){
					   		  	num=result.resultSet2[i].operationNumber;
					   		  }
					   		  var color2="background-color:white;";
				   		 
					        tableStr2 = tableStr2 + "<tr>"  
					                +"<td id='"+time+"' style='"+color2+"'   >"+"<a href='javascript:;' class='aTime' style='color:#000000;'  lang='"+num+"' id='"+result.resultSet2[i].timeIterval+"' onclick='change(this,2);'>"
					                +"<span style='font-size:16px;'>下午"
					                +result.resultSet2[i].timeIterval+"</span></br>"
					                +"<span style='font-size:16px;text-align:center;'>"+ch+"</span>"
					                +"<span id='"+result.resultSet2[i].id+"'  style='font-size:16px;text-align:center;'>"+num+"个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					    }  
					    if(len2==0){  
					    var timeIterval="14:00-18:00";
					    	var id="pm1";
					    	var num=0;
					        tableStr2 = tableStr2 + "<tr>"  
					                +"<td id='"+timeIterval+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+timeIterval+"' lang='"+num+"' onclick='change(this,2);'>"
					                +"<span style='font-size:16px;'>下午"
					                +timeIterval+"</span></br>"
					                +"<span style='font-size:16px;text-align:center;'>剩余："+"</span>"
					                +"<span id='"+id+"' style='font-size:16px;text-align:center;'>"+"0个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					    }  
					    tableStr2 = tableStr2 + "</table>"; 
		    
					    //添加到div中  
					     $("#leftTable").html(tableStr);  
					     $("#rightTable").html(tableStr2);  
						 $("#times").show();//预约日期div
				 		 $("#verifyPhone").show();//手机验证div
						 $("#subNext").show();//提交form div
					
					
				}else{
				  $("#times").show();
				  $("#verifyPhone").show();
				}
			},
			error:function(result){
				console.log("执行失败！");
				 $("#times").show();
				$("#verifyPhone").show();
			}
    	})
  		
  	}//end getSerachResult
  	
  	
  	//点击预约时间区间td
  	function change(obj,period){
  	//该时间区间的预约数量不为0的情况下
  		if(obj.lang>0){
  		console.log("cs--sssss-->"+obj.lang);
  		$("#timeItersal").val(obj.id);
  		//1上午 ，2下午
  		$("#period").val(period);
    		$(".aTime").removeClass("div2");
    		$(obj).addClass('div2');
    	}else{
    		alert("请重新选择时间段！");
    	}
  	}
  	
  	//服务窗口下拉框改变
  	function selectChange(){
       var windowId=document.getElementById("select").value;
       //改变窗口id
       $("#windowId").val(windowId);
       var dates=new Date();
       var day=dates.getDate();
       var year=dates.getFullYear();
       var mon=dates.getMonth()+1;
       if(mon<10){
       	mon="0"+mon;
       }
       if(day<10){
       	day="0"+day;
       }
        var date=year+"-"+mon+"-"+day;
        console.log("date-->"+date);
        $.ajax({
			dataType:'json',
			async:false,
			data:{"date":date,"windowId":windowId},
			url:"${path}/wechat/getRelease",
			success:function(result){
			console.log("测试——--------------》"+result);
				//没有查询字段情况下
				$("#dates").html("");
				//预约时间日期
					var days=result.listDate;
					var dLen=result.listDate.length;
					var temper=days[0];
			        //记录当前选中预约时间
			        $("#remarks1").val(temper);
					console.log("days-->"+days);
					for(var i=0;i<dLen;i++){
						var dayArr=days[i].split("-");
						var day=dayArr[2];
						var mon=dayArr[1];
						if(day.substring(0,1)=="0"){
							day=day.substring(1,2);
						}
						
						var time=mon+"月"+day+"日";
						
						if(i==0){
							var date=" <div class='weui-navbar__item   weui-bar__item_on'  id='"+days[i]+"'  onclick='chgColor(this)' >"
                 			+time
                 			+"</div>"
						}else{
							var date=" <div class='weui-navbar__item' onclick='chgColor(this)'  id='"+days[i]+"' >"
                 			+time
                 			+"</div>"
						}
						//把预约日期放进时间选项卡						
                 		$("#dates").append(date);	
					}
						
						//显示预约日期的放号情况
						//上午		
							var tableStr = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
					    	var len = result.resultSet.length;  
					   		 for ( var i = 0; i < len; i++) {  
					   		 var time=result.resultSet[i].timeIterval.substring(0,2);
					   		 if(time.indexOf(":") != -1 ){
						      	time=time.substring(0, 1);
						      }
					   		 var ch="剩余:";
					   		 var num=result.resultSet[i].appointmentNumber;
					   		  if(result.resultSet[i].operationNumber<result.resultSet[i].appointmentNumber){
					   		  	num=result.resultSet[i].operationNumber;
					   		  }
					   		  var color="background-color:white;";
					       		 tableStr = tableStr + "<tr>"  
					                +"<td id='"+time+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+result.resultSet[i].timeIterval+"' lang='"+num+"' style='color:#000000;' onclick='change(this,1);'>"
					                +"<span style='font-size:16px;'>上午"
					                +result.resultSet[i].timeIterval+"</span></br>"
					                +"<span style='font-size:16px;text-align:center;'>"+ch+"</span>"
					                +"<span id='"+result.resultSet[i].id+"'  style='font-size:16px;text-align:center;'>"+num+"</span>"
					                +"</a></td>"  
					                +"</tr>";  
					                
					   			 }  
							    if(len==0){  
							       var timeIterval="9:00-12:00"
							    	var id="am1";
							    	var num=0;
							        tableStr = tableStr + "<tr>"  
							                +"<td id='"+timeIterval+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+timeIterval+"'  lang='"+num+"' style='color:#000000;'  onclick='change(this,1);'>"
							                +"<span style='font-size:16px;'>上午"
							                +timeIterval+"</span></br>"
							                +"<span style='font-size:16px;'>剩余："+"</span>"
							                +"<span id='"+id+"' style='font-size:16px;'>"+"0个</span>"
							                +"</a></td>"  
							                +"</tr>";  
							    }  
							    tableStr = tableStr + "</table>";  
				    
				    
					   	 //下午
							 var tableStr2 = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
						     var len2 = result.resultSet2.length;  
						     for ( var i = 0; i < len2; i++) {  
						      var time=result.resultSet2[i].timeIterval.substring(0,2);
						      if(time.indexOf(":") != -1 ){
						      	time=time.substring(0, 1);
						      }
						      var ch="剩余:";
					   		 var num=result.resultSet2[i].appointmentNumber;
					   		  if(result.resultSet2[i].operationNumber<result.resultSet2[i].appointmentNumber){
					   		  	num=result.resultSet2[i].operationNumber;
					   		  }
					   		  var color2="background-color:white;";
					        	tableStr2 = tableStr2 + "<tr>"  
					                +"<td id='"+time+"' style='"+color2+"'   >"+"<a href='javascript:;' class='aTime' style='color:#000000;' id='"+result.resultSet2[i].timeIterval+"' lang='"+num+"' onclick='change(this,2);'>"
					                +"<span style='font-size:16px;'>下午"
					                +result.resultSet2[i].timeIterval+"</span></br>"
					                +"<span style='font-size:16px;text-align:center;'>"+ch+"</span>"
					                +"<span id='"+result.resultSet2[i].id+"'   style='font-size:16px;text-align:center;'>"+num+"</span>"
					                +"</a></td>"  
					                +"</tr>";  
					   			 }  
					   		 if(len2==0){  
						        var timeIterval="14:00-18:00"
						    	var id="pm1";
						    	var num=0;
						        tableStr2 = tableStr2 + "<tr>"  
					                +"<td id='"+timeIterval+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' lang='"+num+"' id='"+timeIterval+"' onclick='change(this,2);'>"
					                +"<span style='font-size:16px;'>下午"
					                +timeIterval+"</span></br>"
					                +"<span style='font-size:16px;text-align:center;'>剩余："+"</span>"
					                +"<span id='"+id+"'   style='font-size:16px;text-align:center;'>"+"0个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					  		  }  
					   		 tableStr2 = tableStr2 + "</table>"; 
		    
					    //添加到放号数量div中  
					    $("#leftTable").html(tableStr);  
					    $("#rightTable").html(tableStr2);  
					    //结果记录显示
					    $("#result").show();
					    //预约时间 div显示
					     $("#times").show();
					     //手机验证div显示
				 		 $("#verifyPhone").show();
						
					},
					error:function(result){
						console.log("汇总失败---》");
						//默认显示可预约数量为0
						//上午		
						var tableStr = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
					    var len = 0;  
					     if(len==0){  
					       var timeIterval="9:00-12:00"
					    	var id="am1";
					    	var num=0;
					        tableStr = tableStr + "<tr>"  
					                +"<td id='"+timeIterval+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' lang='"+num+"' id='"+timeIterval+"' onclick='change(this,1);'>"
					                +"<span style='font-size:16px;'>上午"
					                +timeIterval+"</span>"
					                +"<span style='font-size:16px;'>剩余："+"</span>"
					                +"<span id='"+id+"' style='font-size:16px;'>"+"0个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					    }  
					    tableStr = tableStr + "</table>";  
				    
				    
				    //下午
						var tableStr2 = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
					    var len2 = 0;  
					    if(len2==0){  
					        var timeIterval="14:00-18:00"
					    	var id="pm1";
					    	var num=0;
					        tableStr2 = tableStr2 + "<tr>"  
					                +"<td id='"+timeIterval+"'  style='"+color+"'  >"+"<a href='javascript:;' class='aTime' style='color:#000000;' lang='"+num+"' id='"+timeIterval+"' onclick='change(this,2);'>"
					                +"<span style='font-size:16px;'>下午"
					                +timeIterval+"</span>"
					                +"<span style='font-size:16px;text-align:center;'>剩余："+"</span>"
					                +"<span id='"+id+"'  style='font-size:16px;text-align:center;'>"+"0个</span>"
					                +"</a></td>"  
					                +"</tr>";  
					    }  
					    tableStr2 = tableStr2 + "</table>"; 
		    
					    //添加到div中  
					    $("#leftTable").html(tableStr);  
					    $("#rightTable").html(tableStr2);  
					}
				});
  	}//end selectChange
  	
</script>

</head>

<body >


<div class="page-bd" style="height:1200px;">
    
    <div class="weui-panel weui-panel_access"  >
        <div class="weui-panel__bd">
        	<a href="${path }/wechat/toMyAppoint?userCode=${appointmentRecords.userCode}" class="weui-cell weui-cell_access weui-cell_link">
        	 <i class="weui-icon_msg weui-icon-waiting-circle" id="icon"></i><span>我的预约</span>
                <span class="weui-cell__ft" style="padding-left: 50%;padding-right: 10px;float: right;margin-right: 10px;;">点击查看</span>
            </a>
            <div class="weui-media-box weui-media-box_appmsg">
            </div>
            <form id="form" name="form" method="post" action="${path }/wechat/insertAppoinRecord" onSubmit="return checkForm()">
            <div id="1">
            	<p style="padding-left: 20px; height: 10px;">1.违章类型选择</p></br>
            	<div style="padding-left: 20px;padding-top: 1px !important;">
            	<c:choose>
	            	<c:when test="${illegals.size()>0 }">
		            	<c:forEach items="${illegals}" var="is" varStatus="ls">
		            	 <a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_default" style="width: 165px;height: 50px;text-align: center; line-height:50px;" id="${is.id }" lang="${is.illegalName }" onclick="getSearch(this)" >${is.illegalName }</a>
		            	<c:if test="${ls.count%2==0 }"></br></c:if>
		            	</c:forEach>
	            	</c:when>
            	</c:choose>
            	</div>
             </div>
             
             <!--查询div  -->
             <div id="searchs" style="display: none;margin-top: 10px;margin-bottom: 80px;">
             <p style="padding-left: 20px;padding-top: 30px;height: 10px;">2.可预约违章查询</p></br>
            	<div style="padding-left: 30px;" >
            		<div id="search" style="padding-top: 20px;float: left;">
            		  <a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_primary" style=" width: 100px;height: 50px;text-align: center; line-height:50px;" onclick="getSerachResult()">查询</a>
            		  </div>
            	</div>
             </div>
             <!--searchs end-->
             
             </br>
             <!--违法记录  -->
            	<div id="result" style="margin-top: auto; margin-left:30px;margin-right:20px; height:auto;padding-top:5px !important; padding-left:10px !important;padding-right:10px !important;background-color: #EDEDED;display: none;">
            	<!-- 	<span >违法时间：xxx</span></br>
            		<span>案件状态：xxx</span></br>
            		<span>违章处理服务窗口：xxx</span></br> -->
            	</div>
             <!-- 预约时间 -->
             <div id="times" style="display: none;margin-top: 30px;">
            	 <span id="title3" style="padding-left: 20px;padding-top: 30px;">3.可预约违时间选择</span>
            	 <p style="padding-left: 30px;color:orange;">温馨提示：放号时间为工作日9点，敬请留意</p>
            	 <div style="padding-left: 30px;display: none;" id="selectDiv">
            	 <label>选择窗口：</label> <select id="select" onchange="selectChange()"></select>
            	 </div>
            	 </br>
            	<div style="padding-left: 30px;padding-right: 10px;">
			        <div class="weui-tab">
			            <div class="weui-navbar" id="dates">
			              <!--存放预约日期  -->
			            </div>
			            <div class="weui-tab__panel" id="getTimes">
								<div id="leftTable" style="float: left;width:50%;padding-top: 50px;">
								</div>
								<div id="rightTable" style="float: left;width:50%;padding-top: 50px;">
								</div>
			            		
			            </div>
			        </div>
             	</div>
             </div>
          <!-- times end -->   
             
             
             </br>
             <!--手机验证码  -->
            <div id="verifyPhone" style="display: none;margin-top: auto;">
           		 <span id="title4" style="padding-left: 20px;padding-top: 30px;">4.手机号码</span>
            	 </br>
            	<div class="weui-cell weui-cell_vcode">
	                <div class="weui-cell__bd">
	                    <input class="weui-input" type="tel" placeholder="请输入手机号"  id="phone"  name="userPhone" value="" maxlength="11" style="height: 40px;"/>
	                </div>
           		 </div>
           		 <div class="weui-cell weui-cell_vcode">
	                <div class="weui-cell__bd">
	                    <input class="weui-input" type="tel" id="code"  placeholder="请输入短信验证码"/>
	                </div>
	                <div class="weui-cell__ft">
	                    <button class="weui-vcode-btn" id="validationCode" type="button" onclick="sendCode(this);" title="获取验证码">获取验证码</button>
	                </div>
           		 </div>
            </div> 
             <div class="weui-media-box weui-media-box_appmsg" >
             <!--需要传回后台的参数  -->
            	<input id="illegalId" name="illegalId"  /></br>
            	<input id="windowId" name="windowId" value="129901330" /></br>
            	<input id="illegalType" name="illegalType" type="hidden"  /></br>
            	<input id="userCode" name="userCode" value="${appointmentRecords.userCode }" />
            	<input id="zfield" type="hidden"/></br>
            	<input id="efield" type="hidden"/></br>
            	
            	<input id="timeItersal" name="timeItersal"  /></br>
            	<input id="period" name="period"  /></br>
            	<input id="remarks1" name="remarks1"  /></br> 
            	
            	<input id="addStatus" name="addStatus"  /></br>
            	<!-- 短信认证 -->
            	<input id="phoneC" name="phoneC"   type="hidden" /></br>
            	<input id="codeC" name="codeC"  type="hidden" /></br>
            </div>
             
        </div>
        <div class="weui-panel__ft" style="margin-top: 100px;" id="subNext">
        </div>
    </div>
    </form>
  
  
</div>

	<!-- loading toast -->
    <div id="loadingToast" style="display:none;">
        <div class="weui-mask_transparent"></div>
        <div class="weui-toast">
            <i class="weui-loading weui-icon_toast"></i>
            <p class="weui-toast__content">数据加载中</p>
        </div>
    </div>

  <script type="text/javascript">  
       //手机发送验证码
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
      //更新验证码显示信息
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
      
   
</script>      
</body>
</html>