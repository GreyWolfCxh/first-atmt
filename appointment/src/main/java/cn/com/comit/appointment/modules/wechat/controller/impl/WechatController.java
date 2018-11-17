package cn.com.comit.appointment.modules.wechat.controller.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.HttpException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.comit.appointment.common.result.BaseResult;
import cn.com.comit.appointment.modules.platform.entity.AddFields;
import cn.com.comit.appointment.modules.platform.entity.Fields;
import cn.com.comit.appointment.modules.platform.entity.Illegals;
import cn.com.comit.appointment.modules.platform.service.IFieldService;
import cn.com.comit.appointment.modules.platform.service.IIllegalService;
import cn.com.comit.appointment.modules.releases.controller.impl.ReleaseController;
import cn.com.comit.appointment.modules.releases.entity.Releases;
import cn.com.comit.appointment.modules.releases.service.IReleaseServer;
import cn.com.comit.appointment.modules.wechat.controller.IWechatController;
import cn.com.comit.appointment.modules.wechat.entity.SNSUserInfo;
import cn.com.comit.appointment.modules.wechat.entity.WeixinOauth2Token;
import cn.com.comit.appointment.modules.wechat.paramBo.AppointmentRecordsBo;
import cn.com.comit.appointment.modules.wechat.paramBo.SearchFieldBo;
import cn.com.comit.appointment.modules.wechat.paramBo.SerachResultBo;
import cn.com.comit.appointment.modules.wechat.service.IWechatService;
import cn.com.comit.appointment.modules.wechat.service.impl.CoreServiceImpl;
import cn.com.comit.appointment.modules.wechat.utils.AdvancedUtil;
import cn.com.comit.appointment.modules.wechat.utils.CheckoutUtil;
import cn.com.comit.appointment.modules.workbench.entity.AppointmentRecords;
import cn.com.comit.appointment.modules.workbench.service.IAppointmentRecordService;

/**
 * 微信公众号控制器
 * @author ChenXiHua
 * @version 2018-11-2
 *
 */
@Controller
@RequestMapping("/wechat")
public class WechatController implements IWechatController {
	Logger log=LoggerFactory.getLogger(WechatController.class);
	
	@Autowired
	private IAppointmentRecordService appointmentRecordService;
	@Autowired
	private IWechatService wechatService;
	
	/**
	 * 验证微信
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/toAppoin", method = RequestMethod.GET)
	public void wechat(HttpServletRequest request, HttpServletResponse response) 
			 throws IOException { 
			 System.out.println("接口测试开始！！！"); 
			 //微信加密签名 
			 String signature = request.getParameter("signature"); 
			 //时间戳 
			 String timestamp = request.getParameter("timestamp"); 
			 //随机数 
			 String nonce = request.getParameter("nonce"); 
			 //随机字符串 
			 String echostr = request.getParameter("echostr"); 
			  
			 PrintWriter out = response.getWriter(); 
			 //通过校验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败 
			 if(CheckoutUtil.checkSignature(signature,timestamp,nonce)){ 
				 System.out.println("cs----------"+echostr);
			        out.print(echostr); 
			 } 
			 out.close(); 
			 out = null; 
			  
			  
			 } 
	
	 /**
     * 处理微信服务器发来的消息
     */
	@RequestMapping(value = "/toAppoin", method = RequestMethod.POST)
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws  IOException {
        // 消息的接收、处理、响应
        // 将请求、响应的编码均设置为UTF-8（防止中文乱码）
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        System.out.println("请求进入-----");
        // 调用核心业务类接收消息、处理消息
        System.out.println("req--->"+request);
        String respXml = CoreServiceImpl.processRequest(request);
        System.out.println("RESP---toAppointPost-->"+respXml);
        // 响应消息
        PrintWriter out = response.getWriter();
        out.print(respXml);
        out.close();
    }
	
	
	
	  /**
	   * 跳转网页授权
	   * @param request
	   * @param response
	   * @param model
	   * @return
	   * @throws ServletException
	   * @throws IOException
	   */
	  @RequestMapping(value = "/toAppoin/oauth", method = RequestMethod.GET)
	    public String weixinOAuth(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws ServletException, IOException {
		  request.setCharacterEncoding("utf-8");
	        response.setCharacterEncoding("utf-8");
	        System.out.println("授权测试------------>");
	        // 用户同意授权后，能获取到code
	        String code = request.getParameter("code");
	        String state = request.getParameter("state");
	        System.out.println("code-->"+code);
	        System.out.println("state-->"+state);
	        // 用户同意授权
	        if (!"authdeny".equals(code)&&code!=null) {
	        	System.out.println("access_token-->"+code);
	            // 获取网页授权access_token
	            WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken("wx44eb1076428bc798", "b08848aaefe1e17715656b867fe0da48", code);
	            // 网页授权接口访问凭证
	            String accessToken = weixinOauth2Token.getAccessToken();
	            // 用户标识
	            String openId = weixinOauth2Token.getOpenId();
	            System.out.println("openId------>"+openId);
	            // 获取用户信息
	            SNSUserInfo snsUserInfo = AdvancedUtil.getSNSUserInfo(accessToken, openId);
	            System.out.println("snsUserInfo------->"+snsUserInfo);

	            // 设置要传递的参数
	            modelMap.put("snsUserInfo", snsUserInfo);
	            modelMap.put("state", state);
	            
	        }
	        System.out.println("init------->");
	        // 跳转到appointInit.jsp
	        return "modules/wechat/appointInit";
	    }
	  
	  
	@RequestMapping("/toAppoin/toAppointInit")
	public String toAppointInit(){
		log.info("跳转到预约初始化页面");
		return "modules/wechat/appointInit";
	}
	
	@RequestMapping("/toMyAppoint")
	public String toMyAppoint(ModelMap modelMap,AppointmentRecords appointmentRecords){
		log.info("跳转到我的预约记录页面");
		System.out.println("cs--->"+appointmentRecords.toString());
		List<AppointmentRecords>appointList=wechatService.findAppointRecordByUserCode(appointmentRecords);
		System.out.println("预约记录---》"+appointList.toString());
		modelMap.put("appointList", appointList);
		modelMap.put("userCode", appointmentRecords.getUserCode());
		System.out.println("userCode-->"+appointmentRecords.getUserCode());
		return "modules/wechat/myAppoint";
	}
	
	@RequestMapping("/findMyAppoint")
	@ResponseBody
	public Map<String,Object> findMyAppoint(@RequestParam("status")Integer status,@RequestParam("userCode")String userCode){
		log.info("查询我的预约记录---》返回数据到我的预约记录页面");
		AppointmentRecords appointmentRecords=new AppointmentRecords();
		appointmentRecords.setStatus(status);
		appointmentRecords.setUserCode(userCode);
		System.out.println("预约记录-dddddd--》"+appointmentRecords.toString());
		Map<String,Object>map=new HashMap<String,Object>(8);
		List<AppointmentRecords>appointList=wechatService.findAppointRecordByUserCode(appointmentRecords);
		System.out.println("预约记录---》"+appointList.toString());
		map.put("appointList", appointList);
		return map;
	}
	
	@RequestMapping("/delMyAppoint")
	@ResponseBody
	public Map<String,String> delMyAppoint(AppointmentRecords appointmentRecords){
		log.info("取消预约记录");
		System.out.println("del-->"+appointmentRecords.toString());
		Map<String,String>map=new HashMap<String,String>(8);
		map=wechatService.delMyAppoint(appointmentRecords);
		return map;
	}
	
	
	@RequestMapping("/toAppointAdd")
	public String toAppointAdd(){
		log.info("跳转到我的预约补充当事人页面");
		return "modules/wechat/appointAdd";
	}
	
	
	@RequestMapping("/toAppointment")
	public String toAppointment(ModelMap modelMap,AppointmentRecords appointmentRecords){
		log.info("跳转到预约页面");
		List<Illegals>illegals=wechatService.findAllIllegals();
		modelMap.put("illegals", illegals);
		modelMap.put("appointmentRecords", appointmentRecords);
		return "modules/wechat/appointment";
	}
	
	@RequestMapping("/getSerachField")
	@ResponseBody
	public Map<String,Object> getSerachField(Integer id){
		log.info("获取查询字段数据---》返回预约页面");
		System.out.println("cs--->"+id);
		Map<String,Object>map=new HashMap<String,Object>(8);
		map=wechatService.getSerachField(id);
		System.out.println("获取查询字段----》"+map.toString());
		return map;
	}
	
	@RequestMapping("/getSerachResult")
	@ResponseBody
	public Map<String,Object> getSerachResult(SearchFieldBo searchFieldBo){
		log.info("获取查询结果数据---》返回预约页面");
		System.out.println("预约页面测试--》");
		Map<String,Object>map=new HashMap<String,Object>(8);
		map=wechatService.getSerachResult(searchFieldBo);
		System.out.println("fields---------->"+map.toString());
		return map;
	}
	
	@RequestMapping("/getRelease")
	@ResponseBody
	public Map<String,Object> getRelease( @RequestParam("date")String date,@RequestParam("windowId")Integer windowId) {
		log.info("获取可预约时间---》返回预约页面");
		System.out.println("获取时间---date----------"+date);
		Map map=new HashMap<String,Object>(8);
		map=wechatService.getRelease(date, windowId);
		return map;
	}
	
	 @RequestMapping("/sendMsgCode")  
	 @ResponseBody  
	 public Map<String,String> sendMsgCode(String phone, HttpServletRequest request) throws HttpException, IOException { 
		  log.info("发送短信验证---》返回预约页面"); 
		   Map<String,String>map=new HashMap<String,String>(8);
		   //网络ip
	        String ip=request.getServerName();
	        HttpSession session=request.getSession();
	        //消除之前的验证码
	        session.removeAttribute("code");
	        session.removeAttribute("phone");
	        //发送短信验证码
	       map= wechatService.sendMsgCode(session,phone,"localhost");
		   return map;
		 
		 
	 }
	 
	 @RequestMapping("/phone")  
	 public String sendMsgCode() { 
		 System.out.println("跳转到手机页面");
		 return "modules/wechat/phone";
		 
	 }
	
	
	
	
	
	@RequestMapping("/insertAppoinRecord")
	public String insertAppoinRecord(ModelMap modelMap,AppointmentRecordsBo appointmentRecords){
		log.info("新增预约记录--->状态为1表明要补充当事人资料");
		System.out.println("appointmentRecords-->"+appointmentRecords.toString());
		System.out.println("addStatus-->"+appointmentRecords.getAddStatus());
		if(appointmentRecords.getAddStatus()==1){
			List<AddFields>addFields=wechatService.findAddFieldsByIllegalId(appointmentRecords.getIllegalId());
			modelMap.put("appointmentRecords", appointmentRecords);
			modelMap.put("addFields", addFields);
			return "modules/wechat/appointAdd";
		}
		Map <String,Object>map=new HashMap<String,Object>();
		map=wechatService.insertAppointmentRecord(appointmentRecords);
		System.out.println("map---------->"+map.toString());
		if(!map.containsKey("releasesNum")){
			log.info("新增预约记录--->跳到预约成功页面");
			modelMap.put("map", map);
			return "modules/wechat/appointSuccess";
		}
		//预约数量为0时
		if(map.containsKey("releasesNum")){
			map.put("userCode", appointmentRecords.getUserCode());
			modelMap.put("map", map);
			return "modules/wechat/appointFail";
		}
		log.info("新增预约记录--->跳到预约失败页面");
		return "modules/wechat/appointFail";
	}
	
	
	@RequestMapping("/tofindIllegal")
	public String findIllegal(){
		System.out.println("cs--------->");
		log.info("跳转到违章查询页面--->");
		 return "modules/wechat/findIllegal";  
	}
	
	@RequestMapping("/findIllegalRecord")
	public String findIllegalRecord(ModelMap modelMap,SearchFieldBo searchFieldBo){
		log.info("查询违章记录--->跳转回违章查询页面");
		SerachResultBo sb=null;
		modelMap.put("SerachResultBo",sb);
		return "modules/wechat/findIllegal";
	}
}
