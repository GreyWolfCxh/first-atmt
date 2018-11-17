<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="${staticPath}/css/wechat/weui.css"/>
    <link rel="stylesheet" href="${staticPath}/css/wechat/weuix.css"/>
    
<%-- <script type="text/javascript" src="${staticPath}/jquery-easyui/jquery-1.8.0.min.js"></script> --%>
<script type="text/javascript" src="${staticPath}/jquery/jquery.form.js"></script>


     <script src="${staticPath}/js/wechat/zepto.js"></script>
    <script type="text/javascript" src="${staticPath}/js/wechat/jweixin-1.0.0.js"></script>
    <script src="${staticPath}/js/wechat/weui.min.js"></script>
    <!--<script src="js/example.js"></script>-->
    <script>
        $(function(){


        });

    </script>
    <style>
   
   #icon{
        font-size: 24px;
        line-height: 40px;
        margin: 5px 0;
        color:#10AEFF;
        -webkit-transition: font-size 0.5s ease-out 0s;
        -moz-transition: font-size 0.5s ease-out 0s;
        transition: font-size 0.5s ease-out 0s;

    }
</style>
 <style>
     #cs #w{height:50px;width:100px;margin:5px 15px;
        float: left;
        }
        
       p{
       	padding-left: 20px;
       } 
       
        #icon{
        font-size: 64px;
        line-height: 60px;
        margin: 5px 0;
        color:red;
        -webkit-transition: font-size 0.5s ease-out 0s;
        -moz-transition: font-size 0.5s ease-out 0s;
        transition: font-size 0.5s ease-out 0s;

    }
    </style>

</head>

<body ontouchstart class="page-bg">
	
  <div class="icon-box" align="center">
            <i class="weui-icon-cancel" id="icon" ></i>
           </br>
           <h3>预约失败</h3></br>
           <c:if test="${map !=null }">
           <p>${map.releasesNum }</p>
           </c:if>
           <c:if test="${map ==null }">
            <p>服务繁忙，请稍后再试</p>
           </c:if>
          <a href="${path }/wechat/toAppointment?userCode=${map.userCode }" class="weui-btn weui-btn_mini weui-btn_primary">重新预约</a>
            
  </div>




<br>
<br>

</body>
</html>