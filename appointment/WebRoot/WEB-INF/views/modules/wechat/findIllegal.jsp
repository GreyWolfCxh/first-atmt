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
    <script>
        $(function(){


        });

    </script>
</head>
<body>
 
	<div class="weui-cells__title" style="font-size: 16px;">请输入任意2个查询条件进行查询</div>
	<form name="form" id="form" method="post" action="${path}/wechat/insertAppoinRecord">
	<div class="weui-cell">
	    <div class="weui-cell__bd">
	        <input class="weui-input" type="text" name="CAR_NUM" placeholder="请输入车牌号码"/>
	    </div>
	</div>
	<div class="weui-cell">
	    <div class="weui-cell__bd">
	        <input class="weui-input" type="text" name="NOTICE_NUMBER" placeholder="请输入通知书号码"/>
	    </div>
	</div>
	<div class="weui-cell">
	    <div class="weui-cell__bd">
	        <input class="weui-input" type="text" name="ILLEGAL_TIME" placeholder="请输入违章时间"/>
	    </div>
	</div>
	<div class="weui-cell">
	    <div class="weui-cell__bd">
	        <input class="weui-input" type="text" name="userName" placeholder="请输入当事人姓名/业户名称"/>
	    </div>
	</div>
	
	
	<div class="weui-btn-area">
        <a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips" onclick="submitForm()">查询</a>
    </div>
    </form>
    
    
    <div class="weui-cell">
	    <div class="weui-cell__bd">
	    </div>
	</div>
    
    
    
    
    
    
    
    <div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">案件编号：</label></div>
	    <div class="weui-cell__bd">
	        <input class="weui-input" type="text" name="CAR_NUM" />
	    </div>
	</div>
	<div class="weui-cell">
	<div class="weui-cell__hd"><label class="weui-label">当事人：</label></div>
	    <div class="weui-cell__bd">
	        <input class="weui-input" type="text" name="NOTICE_NUMBER" />
	    </div>
	</div>
	<div class="weui-cell">
	<div class="weui-cell__hd"><label class="weui-label">车牌号码：</label></div>
	    <div class="weui-cell__bd">
	        <input class="weui-input" type="text" name="ILLEGAL_TIME" />
	    </div>
	</div>
	<div class="weui-cell">
	    <div class="weui-cell__hd"><label class="weui-label">违章时间：</label></div>
	    <div class="weui-cell__bd">
	        <input class="weui-input" type="text" name="userName" />
	    </div>
	</div>
	
	 <div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">违章地点：</label></div>
	    <div class="weui-cell__bd">
	        <input class="weui-input" type="text" name="CAR_NUM" />
	    </div>
	</div>
	<div class="weui-cell">
	<div class="weui-cell__hd"><label class="weui-label">案由：</label></div>
	    <div class="weui-cell__bd">
	        <input class="weui-input" type="text" name="NOTICE_NUMBER" />
	    </div>
	</div>
	<div class="weui-cell">
	<div class="weui-cell__hd"><label class="weui-label">当前状态：</label></div>
	    <div class="weui-cell__bd">
	        <input class="weui-input" type="text" name="ILLEGAL_TIME" />
	    </div>
	</div>
	<div class="weui-cell">
	    <div class="weui-cell__hd"><label class="weui-label">执法机关：</label></div>
	    <div class="weui-cell__bd">
	        <input class="weui-input" type="text" name="userName"/>
	    </div>
	</div>
	
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
	
	
	<div class="weui-btn-area">
        <a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips" onclick="submitForm()">提交预约办理</a>
    </div>
    </form>
    
    
    
    <script type="text/javascript">
    function submitForm(){
    	$("#form").submit();
    }
    </script>
</body>
</html>
