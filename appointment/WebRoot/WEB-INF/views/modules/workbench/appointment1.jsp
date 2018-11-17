<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="decorator" content="default"/>
	<title>预约记录</title>
	<script type="text/javascript">
	$(document).ready(function(){
		var appointRecords = jQuery.parseJSON('${appointRecords}');
		var  date=new Date();
		var year=date.getFullYear();
		var mon=date.getMonth()+1;
		var day=date.getDate();
		if(day<10){
			day="0"+day;
		}
		var nowDay=year+"-"+mon+"-"+day;
		var title=null;
		console.log("cnow--->"+nowDay);
		if(appointRecords!=null){
		$("#userPhone").val(appointRecords.userPhone);
		$("#userName").val(appointRecords.userName);
		$("#appointmentCode").val(appointRecords.appointmentCode);
		$("#carNumber").val(appointRecords.carNumber);
		title=appointRecords.timeItersal;
		}
		
		  <!--兼容ie8 input输入框提示输入  --> 
		 if( !('placeholder' in document.createElement('input')) ){          
		    $('input[placeholder],textarea[placeholder]').each(function(){              
		        var that = $(this),               
		        text= that.attr('placeholder');               
		        // console.log(text);            
		        if(that.val()===""){                   
		            that.val(text).addClass('placeholder');               
		        }               
		        that.focus(function(){                   
		            if(that.val()===text){                     
		                that.val("").removeClass('placeholder');                   
		            }               
		        }).blur(function(){                
		            if(that.val()===""){                    
		                that.val(text).addClass('placeholder');                   
		            }               
		        }).closest('form').submit(function(){                   
		            if(that.val() === text){                     
		            that.val('');                   
		            }               
		        });               
		    });       
		}
		
		
		//初始化查询条件
		var userPhone=$('#userPhone').val();
		if(userPhone=='电话号码'){
		userPhone=null;
		}
         var userName=$('#userName').val();
         if(userName=='预约人'){
		userName=null;
		}
          var appointmentCode=$('#appointmentCode').val();
          if(appointmentCode=='预约码'){
			appointmentCode=null;
		}
           var carNumber=$('#carNumber').val();
           if(carNumber=='车牌号'){
			carNumber=null;
		}
		
		
		
		
		
		
		//初始化时间段
		var timeItersals=jQuery.parseJSON('${timeItersals}');
		var time="${time}";
		console.log("ttt-->"+time);
		if(timeItersals!=null){
		var len=timeItersals.length;
		$("#timeItersal").val(time);
		$("#status").val(1);
		for(var i=0;i<len;i++){
		var timeItersal=timeItersals[i];
		//预约日期
		var appointmentDay=$("#appointmentDay").val();
		var dg=i+1;
		console.log("dg--->"+dg);
		$('#'+dg).datagrid({
			url:"${path}/appointmentRecord/findAppointmentRecord",
			//url:url,
			pagination:true,
			//toolbar:"#toolbar",
			border:false, 
			singleSelect:true,
			fit:true,
			queryParams: {
				timeItersal:timeItersal,
				remarks1:appointmentDay,
		         userPhone:userPhone,
                 userName:userName,
                 appointmentCode:appointmentCode,
                 carNumber:carNumber 
		    },
			columns : [[
		        {
		            field : 'carNumber',
		            title : '车牌号',
		            width : 200
		        },
		        {
		            field : 'illegalReason',
		            title : '违章信息',
		            width : 250
		        },
		        {
		            field : 'appointmentDay',
		            title : '预约时间',
		            width : 150,
		            formatter:formatTime
		        },
		        {
		            field : 'userName',
		            title : '预约人',
		            width : 150
		        },
		        {
		            field : 'appointmentCode',
		            title : '预约码',
		            width : 150
		        },
		        {
		            field : 'status',
		            title : '处理阶段',
		            width : 150,
		            formatter:formatStage
		        }
		        
		    ]],
		    rowStyler:function(index,row){
				if(index%2==1){
				    //这就是1,3,5行一个颜色了
				    return 'background-color:#F0F0F0;';
				}else{
					return 'background-color:white;';
				}
			},
		    
			onClickRow: function(index,row){
				var rows = $('#dg').datagrid('getSelections');
				if(rows.length > 1){
					
				}else if(rows.length == 1){
					$("#edit_btn").linkbutton('enable');
					$("#detail_btn").linkbutton('enable');
					$("#del_btn").linkbutton('enable');
				}else{
					doDisable();
				}
			}
		});
		
			}
		}
		
		
		
	});
	function doDisable(){
		$("#edit_btn").linkbutton('disable');
	}
	
	var formatStage = function(value,row,index){
	if(row.status == 1){
		return "待处理";
	}
	if(row.status==2){
	return "已处理";
	}
	return "已过期";
}
var formatTime=function(value,row,index){
	  var da = value;
	    da = new Date(da);
	    var year = da.getFullYear()+'年';
	    var month = da.getMonth()+1+'月';
	    var date = da.getDate()+'日';
	    return ([year,month,date].join('-')); 
}
	function reflesh(){
		$('#dg').datagrid('load',{
			industryType:$('#fm_industryType').combobox('getValue').toString(),
			supervisionLevel:$('#fm_supervisionLevel').combobox('getValue').toString(),
			name:$('#fm_name').val(),
			areaId:$('#fm_areaId').combotree('getValue')
		});
		doDisable();
	}
	
	
	
	//查找
	function submitForms(){
	var status=$("#status").val();
	console.log("st--->"+status);
	var timeItersal=$("#timeItersal").val();
	var appointmentDay=$("#appointmentDay").val();
	var userPhone=$('#userPhone').val();
		if(userPhone=='电话号码'){
		userPhone=null;
		}
    var userName=$('#userName').val();
         if(userName=='预约人'){
		userName=null;
		}
    var appointmentCode=$('#appointmentCode').val();
          if(appointmentCode=='预约码'){
		appointmentCode=null;
		}
    var carNumber=$('#carNumber').val();
           if(carNumber=='车牌号'){
			carNumber=null;
		}
	console.log("stm--->"+status);
	 $('#'+status).datagrid('load',{
		 	timeItersal:timeItersal,
		 	remarks1:appointmentDay,                        
               userPhone:userPhone,
                 userName:userName,
                 appointmentCode:appointmentCode,
                 carNumber:carNumber 
            }); 
	
	
	}
	

	function setValid(){
		var invalidInputs = $(".validatebox-invalid");
		for(var i = 0; i < invalidInputs.length; i++){
			$(invalidInputs[i]).removeClass("validatebox-invalid");
			$(invalidInputs[i]).addClass("validatebox-valid"); 
		}
	}
	</script>
	<style type="text/css">
	#message_div span{
		display:block;
		padding:3px;
	}
	.fm td{
		text-align:right;
	}
	.fm .right_td{
		padding-right:40px;
	}	
	#level_history table{
		border-collapse:collapse;
	}
	#level_history td,th{
		border:1px solid #D4D4D4;
		padding:5px;
		margin:0px;
	}
	
		#submitS{
		width:88px !important;
		height:34px !important;
		background:url('${staticPath}/img/find2.png') !important;
		background-size：cover;
		border: none;
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
							time=year+"-"+mon+"-"+day+"  "+hh+":"+ mm + ":" +ss;
						$("#daytime").html(time);
						//$("#time").val(time);
						
						});
     },1000);
		
		
    </script>
</head>
<body>
<div style="margin:20px 0;"></div>
<!-- 表格工具栏 -->
<table id="findTable"  cellspacing="0" cellpadding="0" style="width: 1000px;height: 50px;text-align:center;">
		<tr>
		<td colspan="3" style="width:300px !important;padding-left: 20px;">
		<button id="daytime" type="button" style="width:300px !important;font-size:30px; color:blue;border:0;background-color: white;">
		</button></td>
				<td style="padding-left: 20px;" >
					<input placeholder="预约码" id="appointmentCode" name="appointmentCode" size="10" style="height:32px;font-size:26px;"/>
				</td>
				<td style="padding-left: 10px;">
					<input placeholder="车牌号" id="carNumber"  name="carNumber" size="10" style="height:32px;font-size:26px;"/>
				</td>
				<td style="padding-left: 10px;">
					<input placeholder="预约人" id="userName"  name="userName" size="10" style="height:32px;font-size:26px;"/>
				</td>
				<td style="padding-left: 10px;">
					<input placeholder="电话号码" id="userPhone"  name="userPhone"  size="11" style="height:32px;font-size:26px;"/>
				</td>
				<td style="padding-left: 20px;padding-right: 20px;">
					<input type="button" id="submitS" onclick="submitForms()" />
				</td>
			</tr>
		</table>

	
	
	<!-- 选项卡 -->
	<div style="margin:20px 0;"></div>
	<input id="status" name="status" type="hidden" />
	<input id="timeItersal" name="timeItersal" type="hidden"/>
	<input  name="csTime" value="${time}" type="hidden"/>
	<input id="appointmentDay" name="appointmentDay"  value="${day}" type="hidden"/>
	<div id="tt" class="easyui-tabs" style="width:1200px;height:auto;padding-left:30px;">
	<c:forEach items="${timeItersals }" var="ts" varStatus="vs">
		<c:if test="${ts==time }">
		<div title="${ts }" style="padding:10px" data-options="selected:true" >
		
			<div style="width:100%;height:420px;">
				<table id="${vs.count }">
				</table>
			</div>
		</div>
		</c:if>
		<c:if test="${ts!=time }">
		<div title="${ts }" style="padding:10px"  >
		
			<div style="width:100%;height:420px;">
				<table id="${vs.count }">
				</table>
			</div>
		</div>
		</c:if>
	
	</c:forEach>
	</div>
	
	<script type="text/javascript">
	 $('#tt').tabs({
                border: true,
                onSelect: function (title) {
                console.log("scc-->");
                var timeItersals=jQuery.parseJSON('${timeItersals}');
				if(timeItersals!=null){
				var len=timeItersals.length;
				for(var i=0;i<len;i++){
					var timeItersal=timeItersals[i];
					var dg=i+1;
					 console.log("scc-->"+dg);
					if(title==timeItersal){
					 $("#status").val(dg);
					 $("#timeItersal").val(timeItersal);
					}
                
                	}
               	 }
                }
            }); 
	
	</script>
	
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
	
	<script type="text/javascript">
	closeLoading();
	</script>
</body>
</html>