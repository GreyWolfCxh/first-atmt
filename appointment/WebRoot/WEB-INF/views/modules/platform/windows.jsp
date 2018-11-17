<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="decorator" content="default"/>
	<title>处理窗口管理</title>
	<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			dataType:'json',
			async:true,
			url:"${path}/window/findDeptByAreaId",//测试市运输执法局id
			success:function(result){
				var ds=$("#deptIds");
				var ws=$("#windowIds");
				for(var i=0;i<result.length;i++){
				var option="<option value='"+result[i].id+"'>"+result[i].text+"</option>";
				ds.append(option);
				ws.append(option);
				}
			}
		});
		
		
		
		doDisable();
		$('#dg').datagrid({
			url:"${path}/window/findDeptAndWindow",
			pagination:true,
			toolbar:"#toolbar",
			border:false, 
			singleSelect:true,
			fit:true,
			columns : [[
		        /* {
		            field : 'id',
		            title : 'ID',
		            width : 50
		        }, */
		        {
		            field : 'deptName',
		            title : '部门名称',
		            width : 350
		        },
		        {
		            field : 'windowName',
		            title : '处理窗口名称',
		            width : 350
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
			
		});
		doDisable();
	}
	//提交配置处理窗口
	function add_ok(){
	//console.log("新增");
		$("#addW_fm").form({
			url:'${path}/window/insertWindowAndDept',
			onSubmit:function(){
				/* var isAble = $(this).form('validate');
				if(isAble){
					$('.easyui-linkbutton').linkbutton('disable');
				} */
				return true;
			},
			success:function(result){
				var result = eval('('+result+')');
				console.log("result-->"+result);
				if(result.success){
					$.messager.show({
						title:"成功！",
						msg:'已成功配置执法部门对应处理窗口。',
						timeout:2000,
						style:{
						top:document.body.clientHeight-400 // 与顶部的距离
				
			    		}
					});
					closeDialog();
					setTimeout('reflesh();',2000); 
				}else{
					$.messager.show({
						title:"错误！",
						msg:result.resultMsg,
						timeout:2000,
						style:{
						top:document.body.clientHeight-400 // 与顶部的距离
				
			    		}
					});
				}
				$('.easyui-linkbutton').linkbutton('enable');
			},
			error:function(result){
			console.log("result-error->"+result);
				$.messager.show({
					title:'提示',
					msg:'新增失败',
					timeout:2000,
					showType:'slide',
					  style:{
						top:document.body.clientHeight-500 // 与顶部的距离
				
			    		}
				  });
					closeDialog();
					reflesh();
					$('#dg').datagrid('reload');
			}
		});
		$('#addW_fm').submit(); 
	}
	
	
	//提交配置预约天数窗口
	function set_ok(){
	//console.log("新增");
		$("#setW_fm").form({
			url:'${path}/window/updateWindowDays',
			onSubmit:function(){
				/* var isAble = $(this).form('validate');
				if(isAble){
					$('.easyui-linkbutton').linkbutton('disable');
				} */
				return true;
			},
			success:function(result){
				var result = eval('('+result+')');
				console.log("result-->"+result);
				if(result.success){
					$.messager.show({
						title:"成功！",
						msg:'已成功配置执法部门对应处理窗口。',
						timeout:2000,
						style:{
						top:document.body.clientHeight-400 // 与顶部的距离
				
			    		}
					});
					closeSWDialog();
					setTimeout('reflesh();',2000); 
				}else{
					$.messager.show({
						title:"错误！",
						msg:result.resultMsg,
						timeout:2000,
						style:{
						top:document.body.clientHeight-400 // 与顶部的距离
				
			    		}
					});
				}
				$('.easyui-linkbutton').linkbutton('enable');
			},
			error:function(result){
			console.log("result-error->"+result);
				$.messager.show({
					title:'提示',
					msg:'新增失败',
					timeout:2000,
					showType:'slide',
					  style:{
						top:document.body.clientHeight-500 // 与顶部的距离
				
			    		}
				  });
					closeSWDialog();
					reflesh();
					$('#dg').datagrid('reload');
			}
		});
		$('#setW_fm').submit(); 
	}
	
	
	
	/*弹出设置表单*/
function newW(){
	$('#addDialog').dialog('open').dialog('setTitle','配置处理窗口');
}
//关闭处理窗口
function closeDialog() {
    $('#addDialog').dialog('close');
}

	/*弹出配置表单*/
function newSW(){
$("#allWindowIds").html("");
$.ajax({
			dataType:'json',
			async:true,
			url:"${path}/window/findAllWindow",//测试市运输执法局id
			success:function(result){
				var ws=$("#allWindowIds");
				var len=result.length;
				if(len==0){
				var option="<option>请先配置处理窗口</option>";
				ws.append(option);
				return;
				}
				for(var i=0;i<len;i++){
				var option="<option value='"+result[i].id+"'>"+result[i].text+"</option>";
				ws.append(option);
				}
			},
			error:function(result){
				var ws=$("#allWindowIds");
				var option="<option>请先配置处理窗口</option>";
				ws.append(option);
			}
		});
		
	$('#setDialog').dialog('open').dialog('setTitle','配置预约天数');
}
//关闭配置窗口
function closeSWDialog() {
    $('#setDialog').dialog('close');
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
</head>
<body>
	<div style="width:100%;height:420px;">
		<table id="dg">
		</table>
	</div>
	<!-- 表格工具栏 -->
	<div id="toolbar">
		<div>
			<a href="#" id="add_btn" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newW()">添加</a>
			<a href="#" id="edit_btn" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editWindow()">编辑</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="newSW()">配置</a>
		</div>
	</div>
	
	<!-- 添加弹出框 -->
	<div id="addDialog" class="easyui-dialog" closed="true" buttons="#dlg-buttons" title="标题" style="width:700px;height:250px;">
		<form id="addW_fm" class="fm" method="post" >
			<table>
				<tr>
					<td>
						<label><span class="red">*</span>部门名称：</label>
					</td>
					
					 <td class="right_td">
					 <select name="deptId" id="deptIds">
					 </select>
					</td>
					<td>
						<label><span class="red">*</span>处理窗口名称：</label>
					</td>
					<td class="right_td">
						 <select name="windowId" id="windowIds">
						 </select>
					</td> 
				</tr>
			</table>
			</form>
	</div> 
    <div id="dlg-buttons">
        <a href="#" class="easyui-linkbutton" onclick="add_ok();">Save</a> <a href="#"
            class="easyui-linkbutton" onclick="closeDialog();">Close</a>
    </div>
	
	
	<!-- 设置预约天数弹出框 -->
	<div id="setDialog" class="easyui-dialog" closed="true" buttons="#dlg-buttons" title="标题" style="width:700px;height:250px;">
		<form id="setW_fm" class="fm" method="post" >
			<table>
				<tr>
					
					<td>
						<label><span class="red">*</span>处理窗口名称：</label>
					</td>
					<td class="right_td">
						 <select name="id" id="allWindowIds">
						 </select>
					</td> 
				</tr>
				<tr>
					<td>
						<label><span class="red">*</span>可提前预约天数默认为6天</label>
					</td>
				</tr>
				 <tr>
					<td>
						<label><span class="red">*</span>可提前预约天数(天)：</label>
					</td>
					<td class="right_td">
						 <input id="appointmentDays" name="appointmentDays"/>
					</td> 
				</tr> 
			</table>
			</form>
	</div> 
    <div id="dlg-buttons">
        <a href="#" class="easyui-linkbutton" onclick="set_ok();">Save</a> <a href="#"
            class="easyui-linkbutton" onclick="closeSWDialog();">Close</a>
    </div>
	
	
	
	<script type="text/javascript">
	closeLoading();
	</script>
</body>
</html>