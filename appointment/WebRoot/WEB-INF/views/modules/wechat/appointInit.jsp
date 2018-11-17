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
    </style>

</head>

<body ontouchstart class="page-bg">
	
	<div class="weui-panel__ft" style="margin-bottom: 50px;">
		<h1 style="text-align: center;">预约须知</h1>
		<p>一、违章预约处理的唯一渠道为“深圳交通运输执法”微信公众号。</p>
		<p>二、请凭有效身份证件预约处理违章。</p>
		<p>三、填写的预约信息必须真实准确，办理业务请带齐所需资料（复印件需加盖公章），否则将影响业务办理。</p>
		<p>四、预约成功后，请按照预约时间到对应违章处理服务窗口，可享预约时段内优先办理便利。</p>
		<p>五、如无法按时前往违章处理服务窗口办理业务，请提前通过“我的预约”功能取消该次预约。超过预约时间未办理将被视为失约，3次失约后该身份证件号码将被暂停预约服务。</p>
		<p>六、如需进一步了解业务办理流程及所需资料，请通过网站、微信等渠道查询相关指南。</p>
		<p>七、违章预约处理服务的最终解释权归深圳交通运输行政执法支队所有。</p>
		
	</div>
 <div class="weui-panel__ft">
           <a href="${path }/wechat/toAppointment?userCode=${snsUserInfo.openId}" class="weui-btn weui-btn_primary">开始预约</a>
            <a href="${path }/wechat/toMyAppoint?userCode=${snsUserInfo.openId}&status=1" class="weui-btn weui-btn_primary">我的预约</a>
  </div>




</body>
</html>