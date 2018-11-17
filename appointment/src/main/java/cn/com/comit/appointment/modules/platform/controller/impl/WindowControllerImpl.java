package cn.com.comit.appointment.modules.platform.controller.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.comit.appointment.common.result.BaseResult;
import cn.com.comit.appointment.modules.platform.controller.IWindowController;
import cn.com.comit.appointment.modules.platform.entity.Dept;
import cn.com.comit.appointment.modules.platform.entity.Windows;
import cn.com.comit.appointment.modules.platform.paramVo.DeptVo;
import cn.com.comit.appointment.modules.platform.paramVo.WinToDeptVo;
import cn.com.comit.appointment.modules.platform.service.IDeptService;
import cn.com.comit.appointment.modules.platform.service.IWindowService;
import cn.com.comit.appointment.modules.sys.controller.impl.BaseController;
import cn.com.comit.appointment.modules.sys.utils.UserUtils;

/**
 * 处理窗口控制器
 * @author ChenXiHua
 * @version 2018-10-23
 *
 */
 

@Controller
@RequestMapping("/window")
public class WindowControllerImpl extends BaseController implements IWindowController {
	
	public Logger log=LoggerFactory.getLogger(WindowControllerImpl.class);
	
	@Autowired
	private IWindowService windowService;
	@Autowired
	private IDeptService deptService;

	@Override
	@RequestMapping("/toWindow")
	public String toWindow(ModelMap map) {
		System.out.println("处理窗口页面-------------");
		//获取所有部门
		Dept dept=new Dept();
		dept.setAreaId(30231341);
		map.put("depts", deptService.getDeptByAreaId(dept));
		System.out.println("ds-->"+deptService.getDeptByAreaId(dept));
		//获取处理窗口
		Dept window=new Dept();
		window.setAreaId(30231344);
		map.put("windows", deptService.getDeptByAreaId(window));
		System.out.println("ws-->"+deptService.getDeptByAreaId(window));
		return "/modules/platform/windows";
	}
	
	
	@RequestMapping("/findDeptAndWindow")
	@ResponseBody
	public  Map<String,Object> findDeptAndWindow(WinToDeptVo winToDeptVo){
		log.info("处理窗口---》显示执法部门对应处理窗口");
		Map map=new HashMap<String,Object>(8);
		map.put("rows", windowService.findDeptAndWindow(winToDeptVo));
		map.put("total", windowService.findDeptAndWindowCount(winToDeptVo));
		System.out.println("-----"+windowService.findDeptAndWindow(winToDeptVo));
		return map;
	}
	
	@RequestMapping("/findDeptByAreaId")
	@ResponseBody
	public List<DeptVo>findDeptByAreaId(){
		System.out.println("测试------------");
		return deptService.findDeptByAreaId(UserUtils.getUser().getAreaId());
	}
	
	@RequestMapping("/findAllWindow")
	@ResponseBody
	public List<DeptVo>findWindows(){
		System.out.println("测试------------");
		return windowService.findAllWindow();
	}
	
	@RequestMapping("/findAllWindow2")
	@ResponseBody
	public Map<String,Object> findWindows2(Integer id){
		System.out.println("测试------------");
		Map<String,Object>map=new HashMap<String,Object>(8);
		map.put("deptVo", windowService.findAllWindow());
		map.put("windowList", windowService.findWindowsByIllegalId(id));//获取固定窗口
		System.out.println("sys-->"+map.toString());
		return map;
	}
	
	
	@RequestMapping("/findDeptById")
	@ResponseBody
	public DeptVo findDeptByDeptId(Integer id){
		log.info("修改处理窗口---》根据id获取处理窗口信息");
		System.out.println("-----"+deptService.findDeptByDeptId(id));
		return deptService.findDeptByDeptId(id);
	}

	
	
	@RequestMapping("/insertWindowAndDept")
	@ResponseBody
	public Object insertWindowAndDept(Integer deptId,Integer  windowId) {
		log.info("新增处理窗口-----》增加窗口关联部门记录");
		try {
			boolean flag=windowService.insertWindowAndDept(deptId,windowId);
			if(!flag){
				return BaseResult.buildFailResult(500,  "已存在该记录，请重新配置。");
			}
		}catch(Exception e) {
			e.printStackTrace();
			return BaseResult.buildFailResult(500,  "添加过程出错，请重试。");
		}
		return BaseResult.buildSuccessResult();
	}
	
	@RequestMapping("/updateWindowDays")
	@ResponseBody
	public Object updateWindowDays(Windows window) {
		log.info("新增处理窗口-----》修改窗口预约天数");
		System.out.println("win--->"+window.toString());
		try {
			boolean flag=windowService.updateWindowDays(window);
			if(!flag){
				return BaseResult.buildFailResult(500,  "服务繁忙，请重新配置。");
			}
		}catch(Exception e) {
			e.printStackTrace();
			return BaseResult.buildFailResult(500,  "添加过程出错，请重试。");
		}
		return BaseResult.buildSuccessResult();
	}
	

	@Override
	@RequestMapping("/updateWindow")
	public Integer updateWindow() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@RequestMapping("/findWindowById")
	public Windows findWindowById(Integer id){
		Windows ws=windowService.findWindowById(id);
		return ws;
	}


	@Override
	public Integer insertWindow() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
