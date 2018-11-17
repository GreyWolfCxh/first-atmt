<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="decorator" content="default"/>
	<title>平台管理</title>
	<script type="text/javascript">
		
	</script>
	<style type="text/css">
	
	</style>
</head>
<body>

	<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'west',split:true" style="width:150px;padding:10px">
				<a href="${path}/base/goPath/modules/platform/illegal" target="platFrame">违章类型管理</a></br>
				<a href="${path}/base/goPath/modules/platform/window" target="platFrame">处理窗口管理</a>
			</div>
			<div data-options="region:'center'" style="padding:10px;width: auto;">
					<iframe id="platFrame" name="platFrame"  scrolling="yes" src="${path}/base/goPath/modules/platform/illegal"style="width: 300%;height: 70%;"></iframe>
			</div>
		</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>