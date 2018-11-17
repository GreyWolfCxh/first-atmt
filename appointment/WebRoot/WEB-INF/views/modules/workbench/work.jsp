<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%  
    String root = request.getContextPath(); 
    String webPath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort();
    String webRootPath = webPath + request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
	<meta name="decorator" content="default"/>
	<title>工作台</title>
	<%-- <script src="${staticPath}/js/calendar/jquery-1.8.3.min.js" type="text/javascript"></script> --%>
    <script src="${staticPath}/js/calendar/calendar2.js" type="text/javascript"></script>
    <%-- <script src="${staticPath}/js/calendar/index.js" type="text/javascript"></script> --%>
 
    <script type="text/javascript">

$(document).ready(function(){
		//var date="2018-10";
		var date=new Date();
		var mon=date.getFullYear()+"-"+(date.getMonth()+1);
		var day=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
		var d=date.getDate();
		if(d<10){
			d="0"+d;
			}
		var day2=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+d;
		var dateS=date.getFullYear() +"年-"+(date.getMonth()+1)+"月-"+date.getDate()+"日";
		$("#dateS").html(dateS);
		
		
		var json={};
		var appointmentNumber=0;
		var operationNumber=0;
		var sums={};
		//按月份获取放号日期
		//按天查预约数据
		$.ajax({
			dataType:'json',
			async:false,
			data:{"mon":mon,"day":day,"date":day2},
			//url:"${path}/release/getReleasesByDate?mon="+mon+"&day="+day,
			url:"${path}/release/getReleasesByDate2",
			beforeSend: function(){
				     /*  $.messager.progress({
			        	title: "提示",
			        	msg: "正在加载数据"
			   		 }); */
			   		 load();
			   		 console.log("ajax测试--------》");
				    },
		   complete: function(){
		   disLoad();
		    		console.log("ajax执行完毕--------》");
				   /*  $.messager.progress('close'); */
				    },
			success:function(result){
			console.log("ajax执行成功-ssss-");
				console.log("count-----》"+result);
				console.log("cs--"+result.monDays);
				if(result.monDays!=null){
				json=result.monDays;
				}
				if(result.dayNum!=null){
	    					sums=result.dayNum ;
	    					appointmentNumber=sums.appointmentNumber;
	    					operationNumber=sums.operationNumber;
	    					console.log("sums-->"+sums.appointmentNumber);
    				}
    				
    				
    				
    			/* 放号汇总 */	
    				console.log(result);
						var dateTime=new Date();
		    			var hh=dateTime.getHours();	
		    			var am="background-color:#F0F0F0;";
		    			var pm="background-color:#F0F0F0;";
		    			if(hh>8){
		    				am="background-color:white;";
		    			}
		    			if(hh>12){
		    				pm="background-color:white;";
		    			}
						//上午		
						var tableStr = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
				    	tableStr = tableStr  
				            + "<tr class='cs'>"  
				            +"<td id='am' style='"+am+"'>上午</td>"  
				            +"</tr>";  
					    	var len = result.resultSet.length;  
					   		 for ( var i = 0; i < len; i++) {  
					   		 var time=result.resultSet[i].timeIterval.substring(0,2);
					   		 if(time.indexOf(":") != -1 ){
						      	time=time.substring(0, 1);
						      }
					   		 var ch="可预约总数:";
					   		 var num=result.resultSet[i].appointmentNumber;
					   		  if(result.resultSet[i].operationNumber<result.resultSet[i].appointmentNumber){
					   		  	ch="办理：";
					   		  	num=(result.resultSet[i].appointmentNumber-result.resultSet[i].operationNumber)+"/"+result.resultSet[i].appointmentNumber;
					   		  }
					   		  var color="background-color:#F0F0F0;";
				   		  if(hh>=time){
				   			color="background-color:white;";
				   		  }
					        tableStr = tableStr + "<tr>"  
					                +"<td id='"+time+"'  style='"+color+"'  >"+"<a href='${path}/workbench/toAppointmentRecord?day="+result.resultSet[i].day+"&timeItersal="+result.resultSet[i].timeIterval+"'>"
					                +"<span style='font-size:26px;'>"
					                +result.resultSet[i].timeIterval+"</span></br></br>"
					                +"<span>"+ch+"</span>"
					                +"<span id='"+result.resultSet[i].id+"'>"+num+"</span>"
					                +"</a></td>"  
					                +"</tr>";  
					                
					    }  
					    if(len==0){  
					        tableStr = tableStr + "<tr style='text-align: center'>"  
					        +"<td colspan='6'><font color='#F0F0F0;'>暂无记录" + "</font></td>"  
					        +"</tr>";  
					    }  
					    tableStr = tableStr + "</table>";  
				    
				    
				    //下午
						var tableStr2 = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
				    	tableStr2 = tableStr2  
				            + "<tr class='cs'>"  
				            +"<td id='pm' style='"+pm+"' >下午</td>"  
				            +"</tr>";  
					    var len2 = result.resultSet2.length;  
					    for ( var i = 0; i < len2; i++) {  
					     var time=result.resultSet2[i].timeIterval.substring(0,2);
					      if(time.indexOf(":") != -1 ){
					      	time=time.substring(0, 1);
					      }
					      var ch="可预约总数:";
					   		 var num=result.resultSet2[i].appointmentNumber;
					   		  if(result.resultSet2[i].operationNumber<result.resultSet2[i].appointmentNumber){
					   		  	ch="办理：";
					   		  	num=(result.resultSet2[i].appointmentNumber-result.resultSet2[i].operationNumber)+"/"+result.resultSet2[i].appointmentNumber;
					   		  }
					   		  var color2="background-color:#F0F0F0;";
				   		  if(hh>=time){
				   			color2="background-color:white;";
				   		  }
					        tableStr2 = tableStr2 + "<tr>"  
					                +"<td id='"+time+"' style='"+color2+"'   >"+"<a href='${path}/workbench/toAppointmentRecord?day="+result.resultSet[i].day+"&timeItersal="+result.resultSet[i].timeIterval+"'>"
					                +"<span style='font-size:26px;'>"
					                +result.resultSet2[i].timeIterval+"</span></br></br>"
					                +"<span>"+ch+"</span>"
					                +"<span id='"+result.resultSet2[i].id+"'>"+num+"</span>"
					                +"</a></td>"  
					                +"</tr>";  
					    }  
					    if(len2==0){  
					        tableStr2 = tableStr2 + "<tr style='text-align: center'>"  
					        +"<td colspan='6'><font color='#F0F0F0;'>暂无记录 "+ "</font></td>"  
					        +"</tr>";  
					    }  
					    tableStr2 = tableStr2 + "</table>"; 
		    
					    //添加到div中  
					    $("#leftTable").html(tableStr);  
					    $("#rightTable").html(tableStr2);  	
    				
    				
    				
    				
    				
    				
    				
    				
    				
    				
    				
    				
    				
			},
			error:function(){
				console.log("ajax执行失败--");
				
				//上午		
						var tableStr = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
				    	tableStr = tableStr  
				            + "<tr class='cs'>"  
				            +"<td id='am' >上午</td>"  
				            +"</tr>";  
					    	var len = 0;  
					   		
					    if(len==0){  
					        tableStr = tableStr + "<tr style='text-align: center'>"  
					        +"<td colspan='6'><font color='#F0F0F0;'>暂无记录" + "</font></td>"  
					        +"</tr>";  
					    }  
					    tableStr = tableStr + "</table>";  
				    
				    
				    //下午
						var tableStr2 = "<table id='table' border='1' cellspacing='0' cellpadding='0' >";  
				    	tableStr2 = tableStr2  
				            + "<tr class='cs'>"  
				            +"<td id='pm'>下午</td>"  
				            +"</tr>";  
					    var len2 = 0;  
					   
					    if(len2==0){  
					        tableStr2 = tableStr2 + "<tr style='text-align: center'>"  
					        +"<td colspan='6'><font color='#F0F0F0;'>暂无记录 "+ "</font></td>"  
					        +"</tr>";  
					    }  
					    tableStr2 = tableStr2 + "</table>"; 
		    
					    //添加到div中  
					    $("#leftTable").html(tableStr);  
					    $("#rightTable").html(tableStr2);  
				
				
				
				
				
				
			}
		});
		//放号日期数据
		//var data = eval('(' + json + ')'); 
		if(JSON.stringify(json) == "{}"){
		var data={};
		}else{
		var data = eval('(' + json + ')');
		}
		console.log("data-->"+data);
		 $("#calendar").calendar({
	        /*
	         * 传入今天的时间
	         * 默认：客户端时间
	         * 可传入一个服务器的时间
	         */
	        date: new Date(),
	        width: 600,
	        height: 400,
	        /* 左右框显示的比例 */
	        rate: 0.69,
	        /*
	         * 休假和加班设置
	         * JSON格式：Y加年-M加月-D加日
	         * 0表示休假 1表示加吧
	         */
	        week: true, // 是否开启单双休
	        week_walue: "2016/9/17", // 双休对应的周六
	        isclick: true,
	        total:appointmentNumber,//总数
	        retotal:operationNumber,//剩余数
	        configDay: data // 系统配置放号日期
	    });
			
			
			
		});//$end
		
		//提交form 
		function submitForms(){
		console.log("测试----------");
			$("#form").submit();
		}
		
		//弹出加载层
function load() {
console.log("load----->");
    $("<div class=\"datagrid-mask\"></div>").css({
        display: "block",
        width: "100%",
        height: $(window).height()
    }).appendTo("body");
    $("<div class=\"datagrid-mask-msg\"></div>").html("加载中，请稍候。。。").appendTo("body").css({
        display: "block",
        left: ($(document.body).outerWidth(true) - 190) / 2,
        top: ($(window).height() - 45) / 2
    });
}
//取消加载层  
function disLoad() {
console.log("disload----->");
    $(".datagrid-mask").remove();
    $(".datagrid-mask-msg").remove();
}  
		
		
    </script>
    
    <script type="text/javascript">
    	$(function(){
    //定时器每秒调用一次
	setInterval(function(){
						var date=new Date();
						var year=date.getFullYear(); //年
						var mon=date.getMonth()+1;	//月
						var day=date.getDate();		//日
						var hh=date.getHours();		//时
						var mm=date.getMinutes();	//分
						var ss=date.getSeconds();	//秒
						var today=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
						var xq=today[date.getDay()];
						var daytime;
						daytime=year +"/"+mon+"/"+day+" "+xq;
						var time;
						if(mm<10 ){
								mm="0"+mm;
						}
						if(ss<10){
								ss="0"+ss;
							}
							//time="当前时间" + hh+":"+ mm + ":" +ss;
							time=hh+":"+ mm + ":" +ss;
						$("#daytime").html(time);
						//$("#time").val(time);
						
						});
     },1000);
		
		$(function(){
		setInterval(function(){
		var date=new Date();
		var hh=date.getHours();	
			if(hh>=8){
			$("#9").css({'background-color' : 'white', 'font-weight' : 'bolder'});
			$("#am").css({'background-color' : 'white', 'font-weight' : 'bolder'});
			}	
			if(hh>=9){
			$("#9").css({'background-color' : 'white', 'font-weight' : 'bolder'});
			}		
			if(hh>=10){
			$("#10").css({'background-color' : 'white', 'font-weight' : 'bolder'});
			}	
			if(hh>=11){
			$("#11").css({'background-color' : 'white', 'font-weight' : 'bolder'});
			}	
			if(hh>12){
			   $("#11").css({'background-color' : 'white', 'font-weight' : 'bolder'});
				$("#pm").css({'background-color' : 'white', 'font-weight' : 'bolder'});
			}
			if(hh>=14){
			$("#14").css({'background-color' : 'white', 'font-weight' : 'bolder'});
			}
			if(hh>=15){
			$("#15").css({'background-color' : 'white', 'font-weight' : 'bolder'});
			}	
			if(hh>=16){
			$("#16").css({'background-color' : 'white', 'font-weight' : 'bolder'});
			}	
			if(hh>=17){
			$("#17").css({'background-color' : 'white', 'font-weight' : 'bolder'});
			}
		});
		},1000);
		
    </script>
	
	
	
	<!-- 定时任务刷新预约数量 -->
	<script type="text/javascript">
	var date=new Date();
				var d=date.getDate();
				if(d<10){
					d="0"+d;
				}
var day=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+d;
	 //10秒钟刷新一次数据
  console.log("cs--->1");
   setInterval("getData()", 1000000);

  //动态更新数据
  function getData() {
   $.ajax({
			dataType:'json',
			async:false,
			url:"${path}/workbench/getRelease?date="+day,
			success:function(result){
						console.log(result);
						var len = result.resultSet.length;  
						console.log(len);
					   		 for ( var i = 0; i < len; i++) {  
					   		 var time=result.resultSet[i].timeIterval.substring(0,2);
					   		 var id=result.resultSet[i].id;
					   		 console.log("id--->"+id);
					   		 var num=result.resultSet[i].operationNumber;
					   		 console.log("num--->"+num);
					   		 $("#"+id).html(num);
						      }
						 var len2 = result.resultSet2.length;  
						console.log(len2);
					   		 for ( var i = 0; i < len2; i++) {  
					   		 var id=result.resultSet2[i].id;
					   		 console.log("id--->"+id);
					   		 var num=result.resultSet2[i].operationNumber;
					   		 console.log("num--->"+num);
					   		 $("#"+id).html(num);
						      }
					   		
			}
  });
  }

  </script>
	
	
	<!--日历-->
	<link href="${staticPath}/css/calendar/calendar2.css" rel="stylesheet" />
	<style type="text/css">
	  
	  #table{
	  	margin-top: 50px;
	  }
	  #table tr{
	  width:300px !important;
	  height:100px  !important;
	  }
	  
	  #table tr td{
	  width:300px  !important;
	  height:100px;
	  text-align:center;
	  color:#000000 !important;
	  	font-size: 16px;
	  	background-color:#F0F0F0;
	  }
	  
	   #am{
	  	 background-color:white ;
	  }
	  #pm{
	  background-color:#F0F0F0; 
	  }
	
		#YL,#ML{
		background:url('${staticPath}/img/left.png') !important;
		background-size：cover;
		}
		#YR,#MR{
		background:url('${staticPath}/img/right.png') !important;
		background-size：cover;
		}
		
		#totalBtn{
		width:66px !important;
		height:26px !important;
		background:url('${staticPath}/img/all2.png') !important;
		background-size：cover;
		border: none;
		}
		
		#submitS{
		width:132px !important;
		height:32px !important;
		background:url('${staticPath}/img/search.png') !important;
		background-size：cover;
		border: none;
		}
		
		#add{
		width:135px !important;
		height:88px !important;
		background:url('${staticPath}/img/addModule.png') !important;
		background-size：cover;
		border: none;
		}
		
		#findTable{
		background:url('${staticPath}/img/table.png') !important;
		background-size：cover;
		}
		
		.placeholder{
		color: grey;
        font-size: 1.4em;
        vertical-align:middle;
        text-align:center;
        line-height:36px;
        width: 180px;
        height: 36px;
		}
		
	</style>
	
	
	
</head>
<body>
		<div style="margin-top: 30px;"></div>
			 <div id="content">
			 	<!--左边-->
			 	<div id="left" style="width: 50%;height: 500px;float: left;">
			 	<div align="center" style="width:50%;height:25px;margin: auto;color:blue;">
			 	  <h1 id="daytime"></h1>
			 	</div>
	        	<div id="calendar" style="width: 670px !important;">
	       		 </div>
	       		 <div align="center" style="width:50%;height:25px;margin: auto;color:blue;">
			 	  <h1 id="dateS"></h1>
			 	</div>
       		 </div>
       		 <!--右边-->
		      <!--右边-->
	<div id="right" style="float: right;width:50%;height:400px;">	
	<div id="leftTable" style="float: left;width:300px;">
	</div>
	<div id="rightTable" style="float: left;width:300px;">
	</div>
		 
	</div>
	
	<!--right end-->
	</div>
	<!--content end-->
	
	
	
		<div style="padding:280px;width:100%;height: 10px;margin-top: 0px;"></div>
	<div style="height:50px;margin: auto;padding-left: 100px;" >
	 <form  method="post" name="form" id="form" style="margin: auto;" action="${path }/workbench/toAppointmentRecord1">
		<table id="findTable"  cellspacing="0" cellpadding="0" style="width: 800px;height: 50px;text-align:center;">
		<tr>
				<td style="padding-left: 200px;">
					<input placeholder="预约码" name="appointmentCode" size="10" style="height:32px;font-size:26px;"/>
				</td>
				<td style="padding-left: 10px;">
					<input placeholder="车牌号" name="carNumber" size="10" style="height:32px;font-size:26px;"/>
				</td>
				<td style="padding-left: 10px;">
					<input placeholder="预约人" name="userName" size="10" style="height:32px;font-size:26px;"/>
				</td>
				<td style="padding-left: 10px;">
					<input placeholder="电话号码" name="userPhone"  size="11" style="height:32px;font-size:26px;"/>
				</td>
				<td style="padding-left: 20px;padding-right: 20px;">
					<input type="button" id="submitS" onclick="submitForms()" />
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	
    
    
	<script type="text/javascript">  
	  <!--兼容ie8 input输入框提示输入  --> 
  if( !('placeholder' in document.createElement('input')) ){   

    $('input[placeholder],textarea[placeholder]').each(function(){    
      var that = $(this),    
      text= that.attr('placeholder');    
      if(that.val()===""){    
        that.val(text).addClass('placeholder');    
      }    
      that.focus(function(){    
        if(that.val()===text){    
          that.val("").removeClass('placeholder');    
        }    
      })    
      .blur(function(){    
        if(that.val()===""){    
          that.val(text).addClass('placeholder');    
        }    
      })    
      .closest('form').submit(function(){    
        if(that.val() === text){    
          that.val('');    
        }    
      });    
    });    
  }   
</script>

</body>
</html>