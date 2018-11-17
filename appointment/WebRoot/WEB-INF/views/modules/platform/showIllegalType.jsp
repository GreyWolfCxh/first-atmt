<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="decorator" content="default" />
		<title>违章类型详情</title>
		<script src="${staticPath}/jquery/upload2.js"></script>
		
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
		<script type="text/javascript">
			//隐藏页面上验证不通过的红框，验证在提交时触发
			function setValid(){
				var invalidInputs = $(".validatebox-invalid");
				for(var i = 0; i < invalidInputs.length; i++){
					$(invalidInputs[i]).removeClass("validatebox-invalid");
					$(invalidInputs[i]).addClass("validatebox-valid"); 
				}
			}
		
		</script>
	</head>
	<body>
		<div class="content_div"  border="false"  >
			
						<table class="form_table">
							<tr>
								<td colspan="4" class="title_td">
									<div class="title_div">
										<div class="title_content_div">违章类型详情信息：</div>
										<div class="title_bottom_border_div"></div>
									</div>
								</td>
							</tr>
						</table>
			
						<table class="form_table">
							<tr>
								<td colspan="4" class="title_td">
									<div class="title_div">
										<div class="title_content_div">基础信息</div>
										<div class="title_bottom_border_div"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="right_td"><span class="red">*</span>违章类型名称：</td>
								<td>${resultSet.illegals.illegalName}</td>
							</tr>
							<tr>
								<td class="right_td"><span class="red">*</span>描述 ：</td>
								<td>${resultSet.illegals.illegalType}</td>
							</tr>
							<tr>
								<td class="right_td"><span class="red">*</span>状态：</td>
								<td>
								<c:if test="${resultSet.illegals.illegalStatus==1}">启用</c:if>
								<c:if test="${resultSet.illegals.illegalStatus==0}">不启用</c:if>
								</td>
							</tr>
							<tr>
								<td class="right_td"><span class="red">*</span>公众号配置：</td>
								<td>
					            	<c:if test="${resultSet.illegals.searchStatus==1}">查询违章</c:if>
									<c:if test="${resultSet.illegals.windowStatus==1}">固定窗口</c:if>
									<c:if test="${resultSet.illegals.adDataStatus==1}">补充资料</c:if>
								</td>
							</tr>
							
						</table>
			
			
						<table class="form_table">
							<tr>
								<td colspan="4" class="title_td">
									<div class="title_div">
										<div class="title_content_div">办理提示</div>
										<div class="title_bottom_border_div"></div>
									</div>
								</td>
							</tr>
							
							<tr>
								<td class="right_td"><span class="red">*</span>办理提示：</td>
								<td colspan="3">
									<textarea class="easyui-textbox easyui-validatebox" name="tips" id="tips"  style="width:500px!important;height:70px;overflow-y:hidden;">${resultSet.illegals.tips}</textarea>
								</td>
							</tr>
						</table>
			
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
								<td class="right_td"><span class="red">*</span>上传文件：</td>
								<td colspan="3">
								<c:choose>
								<c:when test="${resultSet.fileList.size()>0 }">
									<c:forEach items="${resultSet.fileList }" var="files">
										${files.newName }|<a href="${path}/file/upload?id=${files.id}">${files.originalName }</a>
									</c:forEach>
								</c:when>
								<c:otherwise>无</c:otherwise>
								</c:choose>
								</td>
							</tr>
						</table>
			
			
					<!-- 查询违章 -->
					<c:if test="${resultSet.illegals.searchStatus==1}">
						<table class="form_table" id="searchtable">
							<tr>
								<td colspan="4" class="title_td">
									<div class="title_div">
										<div class="title_content_div">查询配置</div>
										<div class="title_bottom_border_div"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="right_td"><span class="red">*</span>查询字段：</td>
								<td>
								<c:choose>
								<c:when test="${resultSet.fieldList.size()>0 }">
									<c:forEach items="${resultSet.fieldList }" var="fields">
										[${fields.fieldZname },${fields.fieldEname }]
									</c:forEach>
								</c:when>
								<c:otherwise>无</c:otherwise>
								</c:choose>
				    			</td>
				    			</tr>
				    			<tr>
								<td class="right_td"><span class="red">*</span>数据源：</td>
								<td>
								<c:if test="${resultSet.dataList !=null }">
								[${resultSet.dataList.datasourceZname },${resultSet.dataList.datasourceEname }]
								</c:if>
								<c:if test="${resultSet.dataList ==null }">
								无
								</c:if>		
				    			</td>
							</tr>
							
						</table>
						</c:if>
						
						<!--处理窗口  -->
						<c:if test="${resultSet.illegals.windowStatus==1}">
						<table class="form_table" id="windowtable" >
							<tr>
								<td colspan="4" class="title_td">
									<div class="title_div">
										<div class="title_content_div">固定窗口</div>
										<div class="title_bottom_border_div"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="right_td"><span class="red">*</span>选择窗口：</td>
								<td>
									<c:choose>
									<c:when test="${resultSet.windowList.size()>0 }">
										<c:forEach items="${resultSet.windowList }" var="windows">
											[${windows.windowName }]
										</c:forEach>
									</c:when>
									<c:otherwise>无</c:otherwise>
									</c:choose>
				    			</td>
				    			</tr>
						</table>
						</c:if>
						
						<!-- 补充资料 -->
						<c:if test="${resultSet.illegals.adDataStatus==1}">
						<table class="form_table" id="datatable">
							<tr>
								<td colspan="4" class="title_td">
									<div class="title_div">
										<div class="title_content_div">补充资料</div>
										<div class="title_bottom_border_div"></div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="right_td"><span class="red">*</span>补充字段：</td>
								<td>
									<c:choose>
									<c:when test="${resultSet.addFieldList.size()>0 }">
										<c:forEach items="${resultSet.addFieldList }" var="addFields">
											[${addFields.addZname },${addFields.addEname }]
										</c:forEach>
									</c:when>
									<c:otherwise>无</c:otherwise>
									</c:choose>
				    			</td>
							</tr>
						</table>
					</c:if>	
					
					
				<table class="form_table">
					<tr>
						<td colspan="6" class="form_buttom_td">
							<a href="${path}/illegals/toIllegals" class="easyui-linkbutton" iconCls="icon-back" target="content_iframe">返回</a>
						</td>
					</tr>
				</table>
			
			
			
		</div>
	
	
	
	
	
	
	
	 

	</body>

</html>