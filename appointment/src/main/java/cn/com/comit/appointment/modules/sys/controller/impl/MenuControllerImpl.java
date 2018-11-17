package cn.com.comit.appointment.modules.sys.controller.impl;

import cn.com.comit.appointment.common.result.BaseResult;
import cn.com.comit.appointment.modules.sys.controller.IMenuController;
import cn.com.comit.appointment.modules.sys.service.IMenuService;
import cn.com.comit.appointment.modules.sys.utils.UserUtils;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 菜单-前端控制器类
 *  @author ChenXiHua
 * @version 2018-10-21
 */
@Controller
@RequestMapping("menu")
public class MenuControllerImpl implements IMenuController{
	
	@Autowired
	private IMenuService menuService;
	
	@ResponseBody
	@RequestMapping("getMenuByUser")
	public Object getMenuByUser() {
		return BaseResult.buildSuccessResult("menuList",UserUtils.getMenuList());
	}
	
}

