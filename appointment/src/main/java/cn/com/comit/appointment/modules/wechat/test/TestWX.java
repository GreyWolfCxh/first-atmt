package cn.com.comit.appointment.modules.wechat.test;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import cn.com.comit.appointment.common.utils.DateUtils;
import cn.com.comit.appointment.modules.wechat.entity.TemplateData;
import cn.com.comit.appointment.modules.wechat.utils.WX_HttpsUtil;
import cn.com.comit.appointment.modules.wechat.utils.WX_TemplateMsgUtil;
import cn.com.comit.appointment.modules.wechat.utils.WX_UserUtil;
import cn.com.comit.appointment.modules.wechat.utils.WeixinUtil;


public class TestWX {
    public static void main(String[] args) {
        //新增用户成功 - 推送微信消息
        senMsg("ozCNi1tFuR6PGG-SFAbCGgRADvZI");
    }
   static void senMsg(String openId){
        //用户是否订阅该公众号标识 (0代表此用户没有关注该公众号 1表示关注了该公众号)
       // Integer  state= WX_UserUtil.subscribeState(openId);
	   Integer  state= 1;
        System.out.println("state:"+state);
        // 绑定了微信并且关注了服务号的用户 , 注册成功-推送注册短信
        if(state==1){
            Map<String,TemplateData> param = new HashMap<>();
            param.put("first",new TemplateData("恭喜预约成功！","#696969"));
            param.put("keyword1",new TemplateData(DateUtils.getDate(),"#696969"));
            param.put("keyword2",new TemplateData("宝安处理窗口","#696969"));
            param.put("keyword3",new TemplateData("深圳市","#696969"));
            param.put("remark",new TemplateData("很高兴为你服务，预约当天请记得来哦！","#696969"));
            //注册的微信-模板Id
           // String regTempId =  WX_TemplateMsgUtil.getWXTemplateMsgId("ywBb70467vr18");

            JSON.toJSONString(param);
            JSONObject jsonObject = JSONObject.parseObject(JSON.toJSONString(param));
            System.out.println("jsonObject-->"+jsonObject);
            //调用发送微信消息给用户的接口
          WX_TemplateMsgUtil.sendWechatMsgToUser(openId,"I-pGWBLif2upnmsanxCHq15n1XlwFl6O7HVTZbYGnJc", "", 
                  "#000000", jsonObject);

          	String s=WeixinUtil.getAccessToken("wx44eb1076428bc798","b08848aaefe1e17715656b867fe0da48").getToken();
          	System.out.println("s-->"+s);
          //获取公众号的自动回复规则
          String urlinfo="https://api.weixin.qq.com/cgi-bin/get_current_autoreply_info?access_token="+WeixinUtil.getAccessToken("wx44eb1076428bc798","b08848aaefe1e17715656b867fe0da48").getToken();
          JSONObject joinfo = WX_HttpsUtil.httpsRequest(urlinfo, "GET", null);
          Object o=joinfo.get("is_add_friend_reply_open");
         // System.out.println("o:"+joinfo);
          String getTokenUrl = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={0}&secret={1}";
            JSONObject Token = WX_HttpsUtil.httpsRequest(getTokenUrl, "GET", null);
            System.out.println("Token:"+Token);


        }
    }

}
