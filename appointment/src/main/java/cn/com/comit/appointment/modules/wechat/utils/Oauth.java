package cn.com.comit.appointment.modules.wechat.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;


public class Oauth {
    public static String id=null;
    /**
     * 
     * @param code如果用户授权网页访问，则会有一个授权码code
     * @return
     * @throws IOException
     */
    public ArrayList<String> getUserinfo(String code) throws IOException {
        ArrayList<String> strings=new ArrayList<String>();
        StringBuilder json = new StringBuilder();
        String url = null;
        BufferedReader in = null;
        String inputLine = null;
        String jsonstring = null;
        JSONObject jobject = null;
        // 这里的appid与secret换成你自己的appid与secret，code为用户同意访问后的一个标志
        url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx44eb1076428bc798&secret=b08848aaefe1e17715656b867fe0da48&code="
                + code + "&grant_type=authorization_code";
        //logger.info("url1:"+url);
        in = new BufferedReader(new InputStreamReader(new URL(url)
                .openConnection().getInputStream(), "utf-8"));
        while ((inputLine = in.readLine()) != null) {
            json.append(inputLine);
        }
        //logger.info("String:");
        in.close();
        String openid = JSON.parseObject(json.toString()).getString("openid");
        String token = JSON.parseObject(json.toString()).getString("access_token");
        strings.add(openid);
        strings.add(token);
       // return  strings;
        //下面为用户详细信息，用id和token一起获得

        jsonstring = json.toString();
        jobject = JSON.parseObject(jsonstring);
        json = new StringBuilder();

        url = "https://api.weixin.qq.com/sns/userinfo?access_token="
                + jobject.getString("access_token") + "&openid="
                + jobject.getString("openid");
        //logger.info("url2:"+url);
        in = new BufferedReader(new InputStreamReader(new URL(url)
                .openConnection().getInputStream(), "utf-8"));
        inputLine = null;
        while ((inputLine = in.readLine()) != null) {
            json.append(inputLine);
        }
        in.close();
        jsonstring = json.toString();
        //logger.info("DetailString"+jsonstring);
        strings.add(jsonstring);
        return strings;

    }
}
