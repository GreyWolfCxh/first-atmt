package cn.com.comit.appointment.modules.wechat.test;

import cn.com.comit.appointment.modules.wechat.utils.CommonUtil;

public class TestURL {

    /**     
     * 方法名：main</br>
     * 详述：生成URL编码 </br>
     * 开发人员：souvc </br>
     * 创建时间：2016-1-4  </br>
     * @param args 说明返回值含义
     * @throws 说明发生此异常的条件
     */
    public static void main(String[] args) {
        String source="http://ytuwpp.natappfree.cc/appointment/wechat/toAppoin/oauth";
        System.out.println(CommonUtil.urlEncodeUTF8(source));
        //http%3A%2F%2Fgrefwolf.free.idcfengye.com%2Fappointment%2Fwechat%2Foauth
        
        //https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx44eb1076428bc798&redirect_uri=http%3A%2F%2Fgrefwolf.free.idcfengye.com%2Fappointment%2Fwechat%2Foauth&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect
    }

}