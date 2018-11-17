<!-- 两单一库模块，市场主体列表 -->
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
		var timeItersals=jQuery.parseJSON('${timeItersals}');
		var day="${day}";
		
		if(timeItersals!=null){
		var len=timeItersals.length;
			for(var i=0;i<len;i++){
			var option="<option value='"+timeItersals[i]+"'>"+timeItersals[i]+"</option>";
			console.log(option);
			$("#timeItersals").append(option);
			}
			$("#day").val(day);
		}
		console.log("timeItersal--ss->"+timeItersals[0]);
		console.log("cs--->"+appointRecords.timeItersal);
		console.log("cs-appointmentDay-->"+appointRecords.appointmentDay);
		doDisable();
		if(appointRecords!=null){
		$("#userPhone").val(appointRecords.userPhone);
		$("#userName").val(appointRecords.userName);
		$("#appointmentCode").val(appointRecords.appointmentCode);
		$("#carNumber").val(appointRecords.carNumber);
		$("#timeItersal").val(appointRecords.timeItersal);
		}
		var url="${path}/appointmentRecord/findAppointmentRecord?userPhone="+$('#userPhone').val()
		+"&userName="+$('#userName').val()
		+"&appointmentCode="+$('#appointmentCode').val()
		+"&carNumber="+$('#carNumber').val()
		+"&timeItersal="+$('#timeItersal').val();
		$('#dg').datagrid({
			url:"${path}/appointmentRecord/findAppointmentRecord",
			//url:url,
			pagination:true,
			toolbar:"#toolbar",
			border:false, 
			singleSelect:true,
			fit:true,
			queryParams: {
		        userName: $('#userName').val(),
		        appointmentCode: $('#appointmentCode').val(),
		         carNumber: $('#carNumber').val(),
		        userPhone: $('#userPhone').val(),
		         timeItersal: $('#timeItersal').val(),
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
		            width : 150
		        },
		        {
		            field : 'appointmentDay',
		            title : '预约时间',
		            width : 150
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
		            width : 150
		        }
		        
		    ]],
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
	function doSearch(){
		 $('#dg').datagrid('load',{                          
               userPhone:$('#userPhone').val(),
                userName:$('#userName').val(),
                appointmentCode:$('#appointmentCode').val(),
                carNumber:$('#carNumber').val(),
                timeItersal:$('#timeItersal').val()
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
	<div style="padding-left:30px;width:100%;height:420px;">
		<table id="dg">
		</table>
	</div>
	<!-- 表格工具栏 -->
	<div id="toolbar">
		<div style="margin-bottom:5px">
		<table style="border-collapse:separate; border-spacing:0px 5px;">
		<tr>
		<td>
				<span class="sitem"> 
					<label id="daytime"  style="height:25px;margin: auto;color:blue;font-size:24px;"></label>
				</span>
				</td>
			<td>
				<span class="sitem"> 
					<label>&nbsp;时间：</label>
					<input  id="timeItersal" name="timeItersal" class="easyui-textbox">
				</span>
				</td>
				<td>
				<span class="sitem"> 
					<label>&nbsp;时间：</label>
					<select  id="timeItersals" name="timeItersals" />
					<input  id="day" name="day" class="easyui-textbox">
				</span>
				</td>
				<td>
				<span class="sitem"> 
					<label>&nbsp;预约码：</label>
					<input  id="appointmentCode" name="appointmentCode" class="easyui-textbox">
				</span>
				</td>
		
		</tr>
			<tr>
				<td>
				<span class="sitem">
					<label>车牌号码：</label>
					<input  id="carNumber" name="carNumber" >
				</span>
				</td>
				<td>
				<span class="sitem">
					<label>预约人：</label>
					<input id="userName" name="userName">
				</span>
				</td>
				<td>
				<span class="sitem">
					<label>手机号码：</label>
					<input id="userPhone" type="text" id="userPhone" name="userPhone" >
				</span>
				</td>
				<td>
				<span class="sitem">
					<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch()">查询</a>
				</span>
				</td>
				</tr>
		</table>
		</div>
		<!-- <div>
			<a href="#" id="add_btn" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addWindow()">添加</a>
			<a href="#" id="edit_btn" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editWindow()">编辑</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="reflesh()">刷新</a>
		</div> -->
	</div>
	
	
	
	<!-- 添加弹出框 -->
	<div id="add_dlg1" class="easyui-dialog" closed="true" buttons="#add_dlg_buttons" >
		<div id="add_panel" class="easyui-panel"  border="false" >
			<form id="add_fm" class="fm" method="post">
			<table>
				<tr>
					<td>
						<label><span class="red">*</span>部门名称：</label>
					</td>
					<td class="right_td">
						<select class="easyui-combotree" id="add_fm_deptId1"   editable="false"  name="deptId1"   required="true" style="width:170px;" />
						<input class="useless" style="display:none;">
					</td>
					<td>
						<label><span class="red">*</span>处理窗口名称：</label>
					</td>
					<td class="right_td">
						<select id="add_fm_windowId1" class="easyui-combobox"  editable="false"  name="windowId1"  required="true" data-options="panelHeight:'auto'">
						</select>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	<div id="add_dlg_buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"  onclick="javascript:add_ok()">确定</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#add_dlg').dialog('close')">关闭</a>
	</div>
	
	
	<!--设置窗口表单-->
<div id="dlgW" class="easyui-dialog" style="width:400px;height:380px;padding:10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="addW_fm" class="fm" method="post" action="${path}/window/insertWindowAndDept">
		<table>
				<tr>
					<td>
						<label><span class="red">*</span>部门名称：</label>
					</td>
					<td class="right_td">
						<select class="easyui-combotree" id="add_fm_deptId"   editable="false"  name="deptId"   required="true" style="width:170px;" />
						<input class="useless" style="display:none;">
					</td>
					<td>
						<label><span class="red">*</span>处理窗口名称：</label>
					</td>
					<td class="right_td">
						<select id="add_fm_windowId" class="easyui-combobox"  editable="false"  name="windowId"  required="true" data-options="panelHeight:'auto'">
						</select>
					</td>
				</tr>
			</table>
			</form>
</div>
<div id="dlg-buttons">
	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveW()">Save</a>
	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlgW').dialog('close')">Cancel</a>
</div>
	
	<script type="text/javascript">
	closeLoading();
	</script>
</body>
</html>