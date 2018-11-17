package cn.com.comit.appointment.modules.releases.controller.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.comit.appointment.modules.releases.controller.IModuleController;
import cn.com.comit.appointment.modules.releases.entity.Modules;
import cn.com.comit.appointment.modules.releases.service.IModuleService;

/**
 * 放号模板控制器实现类
* @author ChenXiHua
 * @version 2018-10-26
 *
 */
@Controller
@RequestMapping("/modules")
public class ModuleController implements IModuleController {
	Logger log=LoggerFactory.getLogger(ReleaseController.class);
	

	@Autowired
	private IModuleService moduleService;


	@Override
	@RequestMapping("/insertModules")
	@ResponseBody
	public Map<String,String> insertModules(@RequestBody List<Modules> modules) {
		log.info(new Date()+"放号模板页面执行增加模板操作");
		Map<String,String>map=new HashMap<String,String>(8);
		System.out.println("module-->"+modules.toString());
		map=moduleService.insertModules(modules);
		return map;
	}

	@RequestMapping("/getModulesByVersion")
	@ResponseBody
	public Map<String,Object> getModulesByVersion(Integer version) {
		log.info(new Date()+"获取模板数据操作");
		Map<String,Object>map=new HashMap<String,Object>(8);
		System.out.println("get--->"+version);
		map=moduleService.getModulesByVersion(version);
		System.out.println("map--->"+map.toString());
		return map;
	}
		
	@Override
	@RequestMapping("/updateModules")
	@ResponseBody
	public Map<String,String> updateModules(@RequestBody List<Modules> modules) {
		log.info(new Date()+"放号模板页面执行修改模板操作");
		System.out.println("upd--->"+modules.toString());
		Map<String,String>map=new HashMap<String,String>(8);
		map=moduleService.updateModules(modules);
		return map;
	}
	
	
	

	@Override
	@RequestMapping("/delModuleByDeptIdAndVersion")
	@ResponseBody
	public Map<String,String>  delModuleByDeptIdAndVersion(@RequestParam("version")Integer version) {
		log.info(new Date()+"放号模板页面执行删除模板操作");
		System.out.println("del-cs-->"+version);
		Map<String,String>map=new HashMap<String,String>(8);
		map=moduleService.delModuleByDeptIdAndVersion(version);
		return map;
	}

}
