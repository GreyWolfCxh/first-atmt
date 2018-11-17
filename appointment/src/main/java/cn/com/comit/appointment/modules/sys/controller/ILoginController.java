package cn.com.comit.appointment.modules.sys.controller;


import org.springframework.ui.Model;

/**
 * 登陆-前端控制器接口
 * @author ZhengZongying
 * @version 2018-6-6
 */
public interface ILoginController {
	/**
	 * 登陆接口
	 * @param username
	 * @param password
	 * @param model
	 * @return
	 */
	public String login(String username, String password ,Model model);
	
	/**
	 * 跳转首页
	 * @param model
	 * @return
	 */
	public String index(Model model);
	
	/**
	 * 跳转登陆页面
	 * @param model
	 * @return
	 */
	public String login(Model model);
	
}

