<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="decorator" content="default"/>
	<title>双随机一公开</title>
	<script src="${staticPath}/jquery/upload2.js"></script>
	<script type="text/javascript">
	var ff_data = [];
	function loadFFData(){
/* 		var html_text = '<tr><td>文件标注</td><td>原文件</td><td>上传时间</td><td>操作</td></tr>';
		for(var i = 0; i < ff_data.length; i++){
			html_text += ('<tr><td>'+ff_data[i].newName+'</td><td>'+ff_data[i].originalName+'</td><td>'+ff_data[i].uploadDate+'</td><td><a href="javascript:void(0);" onclick="delFile(' + i + ')">删除</a>&nbsp;&nbsp;<a href="${path}/' + ff_data[i].originalName + '" target="_blank">下载</a></td></tr>');
		}
		$('#ff_table').html(html_text); */
	//	IFrameResize();
		$("#files_table").datagrid("loadData", ff_data);
	}
	function delFile(index){
						ff_data.splice(index,1); 
						loadFFData(); 
	}
	function ajaxSubmit() {
 		if(!$("#ffm").form('validate')){
			return false;
		} 
	    $("input[name=file]").upload({
		      url: '${path}/file/upload',
		      params: { fileLabel: $('#fileLabel').val() },
		      dataType: 'json',
		      onSend: function (obj, str) { return true; },
		      onComplate: function (data) {
					if(data.success){
						ff_data.push(data.datas.file);
						//console.log(data.datas.file);
						loadFFData(); 
					}else{
						$.messager.alert('提示',data.resultMsg);
					}
		      }
		});
		$("input[name=file]").upload("ajaxSubmit");
	}
	function IFrameResize(){ 
		//alert(this.document.body.scrollHeight); //弹出当前页面的高度 
		var obj = window.parent.document.getElementById("childFrame"); //取得父页面IFrame对象 
		//alert(obj.height); //弹出父页面中IFrame中设置的高度 
		obj.height = this.document.body.scrollHeight; //调整父页面中IFrame的高度为此页面的高度 
	} 
	function initTable(datas){
		ff_data = datas;
		loadFFData();
	}
	function getTable(){
		return ff_data;
	}
	function formatDo(value, row, index){
		return "<a href='javascript:void(0);' onclick='delFile(" + index + ")'>删除</a>&nbsp;&nbsp;<a href='${path}/" + row.originalName + "' target='_blank'>下载</a>";
	}
	</script>
	<style type="text/css">
	 			html {
				overflow-y: auto !important;
			}
			
			.content_div {
				width: 1000px !important;
				margin-right: auto;
				margin-left: auto;
				margin-bottom: 40px;
			}
			
			.title_div {
				width: 100%;
				height: 30px;
				font-size: 16px;
			}
			
			.title_content_div {
				width: 100%;
				height: 27px;
				line-height: 27px;
				font-size: 14px;
			}
			
			.title_bottom_border_div {
				width: 100%;
				height: 3px;
				background: -webkit-linear-gradient(#B0D9F3, #379EE1);
				/* Safari 5.1 - 6.0 */
				background: -o-linear-gradient(#B0D9F3, #379EE1);
				/* Opera 11.1 - 12.0 */
				background: -moz-linear-gradient(#B0D9F3, #379EE1);
				/* Firefox 3.6 - 15 */
				background: linear-gradient(#B0D9F3, #379EE1);
				/* 标准的语法 */
				filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#B0D9F3', endColorstr='#379EE1', GradientType=0);
			}
			
 			.form_div {
				margin-top: 5px;
				width: 100%;
			}
			
			.form_table {
				border-collapse: collapse;
				width: 100%;
			}
			
			.part_title_td {
				background-color: #9FE0FF;
				height: 20px;
				line-height: 20px;
				padding-left: 20px;
			}
			
			td {
				height: 24px;
				width: 214px;
				padding-left: 10px;
				border: 1px solid #B3D6ED;
				vertical-align: middle;
			}
			
			.right_td {
				width: 115px !important;
				background-color: #D8F4FF;
				text-align: right;
				padding-right: 5px;
			}
			
			.center_td {
				text-align: center !important;
				background-color: white !important;
			}
			
			.form_buttom_td {
				height: 40px;
				text-align: center;
				border: 0px;
			}
			
			.title_td {
				height: 40px;
				width: 95%;
				border-top: 1px solid white;
				border-left: 1px solid white;
				border-right: 1px solid white;
				padding-bottom: 5px;
				padding-left: 0px;
			}
			
			.center_span {
				display: inline-block;
				width: 100%;
				text-align: center;
			} 	
	</style>
</head>
<body>
	<form id="ffm" method="post" enctype="multipart/form-data" >
	<table class="form_table">
							<tr>
								<td colspan="4" class="title_td">
										<div class="title_div">
											<div class="title_content_div">上传文件</div>
											<div class="title_bottom_border_div"></div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="right_td"><span class="red">*</span>文件标注:</td>
									<td>
										<input class="easyui-textbox easyui-validatebox" name="fileLabel" id="fileLabel"  data-options="panelHeight:'auto',required:true">
									</td>
									<td class="right_td">选择文件:</td>
									<td>
										<input type="file" name="file" />
										<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-ok" onclick="ajaxSubmit()">上传</a>
									</td>
								</tr>
	</table>
	</form>
<!-- 	<div class="form_div easyui-datagrid" style="overflow-y:scroll;height:200px;">
			<table class="form_table" id="ff_table">
				<tr>
					<td>文件标注</td>
					<td>原文件</td>
					<td>上传时间</td>
					<td>操作</td>
				</tr>
			</table>		

	</div> -->
	<table class="easyui-datagrid" id="files_table" selectOnCheck="false"  singleSelect="true" style="height:200px;">
				<thead>
					<tr>
						<th width="200" field="iD">文件编号</th>
						<th width="200" field="nEW_NAME">文件标注</th>
						<th width="200" field="oRIGINAL_NAME">原文件</th>
						<!-- <th width="50" field="createBy.id">上传者</th> -->
						<th width="150" field="uPLOAD_DATE">上传时间</th>
						<th width="150" field="status" formatter="formatDo">操作</th>
					</tr>
				</thead>
	</table>
</body>
</html>