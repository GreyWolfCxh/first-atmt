<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
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
    <!--<script src="js/example.js"></script>-->
</head>
<body>
 
	<div class="weui-cells__title" style="font-size: 16px;">为节省 你现场办理违章 的时间，请补充下列 当事人资料</div>
	<form name="form" id="form" method="post" action="${path}/wechat/insertAppoinRecord">
	<c:choose>
	<c:when test="${addFields.size()>0 }">
	<c:forEach items="${addFields }" var="as">
	<div class="weui-cell">
	    <div class="weui-cell__hd"><label class="weui-label">${as.addZname}</label></div>
	    <div class="weui-cell__bd">
	        <input class="weui-input" type="text" name="${as.addEname }" placeholder="请输入${as.addZname}"/>
	    </div>
	</div>
	
	
	</c:forEach>
	
	</c:when>
	</c:choose>
	
	
 	<div class="weui-cell">
 	<!-- 微信openid -->
 	<input name="userCode" value="${appointmentRecords.userCode }"   /></br>
 	<!--联系电话  -->
 	<input name="userPhone" value="${appointmentRecords.userPhone }"  type="hidden" /></br>
 	<!-- 违章类型 -->
 	 <input name="illegalType" value="${appointmentRecords.illegalType }" type="hidden"  /></br>
 	 <!-- 违章理由 -->
 	<input name="illegalReason" value="${appointmentRecords.illegalReason }"  type="hidden" /></br>
 	<%-- <input name="illegalTime" value="${appointmentRecords.illegalTime }"></br> --%>
 	<!-- 预约地址 -->
 	<input name="appointmentAddress" value="${appointmentRecords.appointmentAddress }" type="hidden"  /></br>
 	<!-- 预约窗口 -->
 	<input name="appointmentWindow" value="${appointmentRecords.appointmentWindow }" type="hidden"  /></br>
 	<!-- 预约时间 -->
	<input name="remarks1" value="${appointmentRecords.remarks1 }" type="hidden"   /></br> 
 	<!-- 上下午 -->
 	<input name="period" value="${appointmentRecords.period }" type="hidden"  /></br>
 	<!--时间段  -->
 	<input name="timeItersal" value="${appointmentRecords.timeItersal }" type="hidden" /> </br>
 	<!--  提交状态-->
 	<input name="addStatus" value="0" type="hidden" /></br>
 	<!--违法类型编号  -->
 	<input name="illegalId" value="${appointmentRecords.illegalId}" /></br>
 	<!--违法类型编号  -->
 	<input name="windowId" value="${appointmentRecords.windowId}" /></br>
	</div>
	<div class="weui-btn-area">
        <a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips" onclick="submitForm()">提交预约</a>
    </div>
    </form>
    <script type="text/javascript">
    function submitForm(){
    	$("#form").submit();
    }
    </script>
</body>
</html>
