package cn.com.comit.appointment.modules.wechat.test;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.comit.appointment.modules.wechat.entity.AccessToken;
import cn.com.comit.appointment.modules.wechat.message.menu.Button;
import cn.com.comit.appointment.modules.wechat.message.menu.CommonButton;
import cn.com.comit.appointment.modules.wechat.message.menu.ComplexButton;
import cn.com.comit.appointment.modules.wechat.message.menu.Menu;
import cn.com.comit.appointment.modules.wechat.message.menu.ViewButton;
import cn.com.comit.appointment.modules.wechat.utils.WeixinUtil;


/**
* 类名: MenuManager </br>
* 描述:菜单管理器类 </br>
 */
public class MenuManager {
    private static Logger log = LoggerFactory.getLogger(MenuManager.class);

    public static void main(String[] args) {
        // 第三方用户唯一凭证
        String appId = "wx44eb1076428bc798";
        // 第三方用户唯一凭证密钥
        String appSecret = "b08848aaefe1e17715656b867fe0da48";

        // 调用接口获取access_token
        AccessToken at = WeixinUtil.getAccessToken(appId, appSecret);

        if (null != at) {
            // 调用接口创建菜单
            int result = WeixinUtil.createMenu(getMenu(), at.getToken());

            // 判断菜单创建结果
            if (0 == result)
                log.info("菜单创建成功！");
            else
                log.info("菜单创建失败，错误码：" + result);
        }
    }

    /**
     * 组装菜单数据
     * 
     * @return
     */
    private static Menu getMenu() {
       


        ViewButton btn21 = new ViewButton();
        btn21.setName("百度");
        btn21.setType("view");
        btn21.setUrl("http://www.baidu.com");

        ViewButton btn22 = new ViewButton();
        btn22.setName("官方链接");
        btn22.setType("view");
        btn22.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx520c15f417810387&redirect_uri=https%3A%2F%2Fchong.qq.com%2Fphp%2Findex.php%3Fd%3D%26c%3DwxAdapter%26m%3DmobileDeal%26showwxpaytitle%3D1%26vb2ctag%3D4_2030_5_1194_60&response_type=code&scope=snsapi_base&state=123#wechat_redirect");
        
        ViewButton btn23 = new ViewButton();
        btn23.setName("违章预约处理");
        btn23.setType("view");
        btn23.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx44eb1076428bc798&redirect_uri=http://bxaakk.natappfree.cc/appointment/wechat/toAppoin/oauth&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect");
        
        ViewButton btn24 = new ViewButton();
        btn24.setName("违章预约处理2");
        btn24.setType("view");
        btn24.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx44eb1076428bc798&redirect_uri=http://bxaakk.natappfree.cc/appointment/wechat/toAppoin/oauth&response_type=code&scope=snsapi_base&state=123#wechat_redirect");
        
     ViewButton btn25 = new ViewButton();
        btn25.setName("违章查询");
        btn25.setType("view");
        btn25.setUrl("http://bxaakk.natappfree.cc/appointment/wechat/findIllegal");
        
      /*  ViewButton btn26 = new ViewButton();
        btn26.setName("违章查询4");
        btn26.setType("view");
        btn26.setUrl("http://ytuwpp.natappfree.cc/appointment/wechat/toAppoin/toAppointInit");
        */
        

        CommonButton btn33 = new CommonButton();
        btn33.setName("幽默笑话");
        btn33.setType("click");
        btn33.setKey("33");

        
        /**
         * 微信：  mainBtn1,mainBtn2,mainBtn3底部的三个一级菜单。
         */
        
        ComplexButton mainBtn1 = new ComplexButton();
        mainBtn1.setName("违章查询");
        //一级下有4个子菜单
        mainBtn1.setSub_button(new ViewButton[] { btn21 });
        
        ComplexButton mainBtn2 = new ComplexButton();
        mainBtn2.setName("菜单");
        mainBtn2.setSub_button(new ViewButton[] {btn22,btn23,btn24,btn25 });

        
        ComplexButton mainBtn3 = new ComplexButton();
        mainBtn3.setName("更多体验");
        mainBtn3.setSub_button(new CommonButton[] {  btn33 });

        
        
        /**
         * 封装整个菜单
         */
        Menu menu = new Menu();
        menu.setButton(new Button[] { mainBtn1, mainBtn2, mainBtn3 });

        return menu;
    }
}
