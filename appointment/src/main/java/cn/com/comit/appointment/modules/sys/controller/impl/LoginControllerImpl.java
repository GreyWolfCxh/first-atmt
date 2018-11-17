package cn.com.comit.appointment.modules.sys.controller.impl;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;

import cn.com.comit.appointment.common.config.Global;
import cn.com.comit.appointment.modules.sys.controller.ILoginController;
import cn.com.comit.appointment.modules.sys.entity.Menu;
import cn.com.comit.appointment.modules.sys.entity.User;
import cn.com.comit.appointment.modules.sys.service.IMenuService;
import cn.com.comit.appointment.modules.sys.utils.DESDecryption;
import cn.com.comit.appointment.modules.sys.utils.UserUtils;

/**
 * 登陆相关-前端控制器类
 *  @author ChenXiHua
 * @version 2018-10-21
 */
@Controller 
public class LoginControllerImpl implements ILoginController{
	

	@RequestMapping("sys/login")
	public String login(@RequestParam("username") String username,@RequestParam("password") String password/*,@RequestParam("rememberMe") boolean rememberMe*/,Model model){
		if(Global.isFreeLogin() && StringUtils.isEmpty(username)) {
			username = new String("admin");
			password = new String("admin"); 
		}
		
		System.out.println("username-->"+username);
		System.out.println("password-->"+password);
		password = new String("123456"); 
		try {
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
           	//执行认证操作
	    	   subject.login(token);
           }catch (AuthenticationException ae) {
        	   ae.printStackTrace();
        	   model.addAttribute("errorMessage", "登录失败,请重试！");
              return "modules/sys/login";
           }
		return "redirect:/sys/index";
	}
	
	@RequestMapping("sys/index")
	public String index(Model model) {
		Object menuList = JSONObject.toJSON(UserUtils.getMenuList()); 
		System.out.println("menu-->"+menuList);
		System.out.println("user------------>"+UserUtils.getUser().toString());
//		model.addAttribute("menuList", UserUtils.getMenuList());
		model.addAttribute("menuList", menuList.toString());
		model.addAttribute("user", UserUtils.getUser());
		return "modules/sys/index";
	}

	@RequestMapping("sys/login.view")
	public String login(Model model) {
		System.out.println("登录====");
		return "modules/sys/login";
	}
	
	
	@RequestMapping("")
	public String defaultPage() {
		return "redirect:/sys/index";
	}
	
	@RequestMapping("doLogin")
	public String doLogin(@RequestParam(value="token",required=true)String token) throws Exception {
		String paramUrl = DESDecryption.DESDecrypt(token);
		if(StringUtils.isNotBlank(paramUrl)) {
			String[] params = paramUrl.split("&|=");
			System.out.println(Arrays.toString(params)); 
			if(params.length == 4 && "id".equalsIgnoreCase(params[0]) && "time".equals(params[2])) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				Integer id = Integer.parseInt(params[1]);        
		        Date limitDate = sdf.parse(params[3]);
		        Date now = new Date();
		        if((now.getTime() - limitDate.getTime()) < Global.getEffectiveTime()) {
		        	User user = UserUtils.getUserById(id);
		        	if(user == null) {
			        	return "redirect:/unauthorized";
		        	}
		        	Subject subject = SecurityUtils.getSubject();
		    		UsernamePasswordToken tokens = new UsernamePasswordToken(user.getNum(),"123456");
		    	    try {
		            //执行认证操作
		    	    	subject.login(tokens);
			        	List<Menu> menuList = UserUtils.getMenuList();
			        	if(menuList == null || menuList.size() == 0) {
			        		return "redirect:/unauthorized";
			        	}
		            }catch (AuthenticationException ae) {
		            	ae.printStackTrace();
		            }
		    		return "redirect:/sys/index";
		        }else {
		        	return "redirect:/overtime";
		        }
			}
		}
		return "redirect:/overtime";
	}
	
	@RequestMapping("/sys/logout")
	public String logout() {
	    SecurityUtils.getSubject().logout(); 
	    return "modules/sys/logout";
	}
}
