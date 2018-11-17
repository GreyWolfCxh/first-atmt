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
		//初始化搜索条件
		console.log("cnow--->"+nowDay);
		if(appointRecords!=null){
			if(appointRecords.userPhone!=null){
			$("#userPhone").val(appointRecords.userPhone);
			}
			if(appointRecords.userName!=null){
			$("#userName").val(appointRecords.userName);
			}
			if(appointRecords.appointmentCode!=null){
				$("#appointmentCode").val(appointRecords.appointmentCode);
			}
			if(appointRecords.carNumber!=null){
			$("#carNumber").val(appointRecords.carNumber);
			}
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
		
		
		
		//今天
		$('#dg').datagrid({
			url:"${path}/appointmentRecord/findAppointmentRecord1",
			//url:url,
			pagination:true,
			//toolbar:"#toolbar",
			border:false, 
			singleSelect:true,
			fit:true,
			queryParams: {
				remarks1:nowDay,
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
		
		
		//历史
		$('#dg2').datagrid({
			url:"${path}/appointmentRecord/findAppointmentRecord1",
			//url:url,
			pagination:true,
			//toolbar:"#toolbar",
			border:false, 
			singleSelect:true,
			fit:true,
			queryParams: {
				remarks2:nowDay,
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
		if(status==1){
		console.log("cs--1-->");
			doSearch();
		}
		if(status==2){
		console.log("cs--2-->");
			doSearch2();
		} 
	}
	
	//今天查询
	function doSearch(){
	var  date=new Date();
		var year=date.getFullYear();
		var mon=date.getMonth()+1;
		var day=date.getDate();
		if(day<10){
			day="0"+day;
		}
		var nowDay=year+"-"+mon+"-"+day;
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
		
	 $('#dg').datagrid('load',{
		 	remarks1:nowDay,                        
               userPhone:userPhone,
                 userName:userName,
                 appointmentCode:appointmentCode,
                 carNumber:carNumber 
            }); 
	}
	//历史查询
	function doSearch2(){
	var  date=new Date();
		var year=date.getFullYear();
		var mon=date.getMonth()+1;
		var day=date.getDate();
		if(day<10){
			day="0"+day;
		}
		var nowDay=year+"-"+mon+"-"+day;
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
		
	 $('#dg2').datagrid('load',{
		 	remarks2:nowDay,                        
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
	<input id="status" name="status" type="hidden" value="1"/>
	<div id="tt" class="easyui-tabs" style="width:1200px;height:auto;padding-left:30px;">
		<div title="今天" style="padding:10px" >
			<div style="width:100%;height:420px;">
				<table id="dg">
				</table>
			</div>
		</div>
		<div title="历史" style="padding:10px" >
				<div style="width:100%;height:420px;">
					<table id="dg2">
					</table>
				</div>
			</div>
	
	</div>
	
	<script type="text/javascript">
	 $('#tt').tabs({
                border: true,
                onSelect: function (title) {
               		if(title=='今天'){
               		$("#status").val(1);
               		}
               		if(title=='历史'){
               		$("#status").val(2);
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
</script>
	
	<script type="text/javascript">
	closeLoading();
	</script>
</body>
</html>