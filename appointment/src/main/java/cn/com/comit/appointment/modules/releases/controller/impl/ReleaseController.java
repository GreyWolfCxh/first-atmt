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

import cn.com.comit.appointment.modules.releases.controller.IReleaseController;
import cn.com.comit.appointment.modules.releases.entity.Modules;
import cn.com.comit.appointment.modules.releases.entity.Releases;
import cn.com.comit.appointment.modules.releases.service.IModuleService;
import cn.com.comit.appointment.modules.releases.service.IReleaseServer;
import cn.com.comit.appointment.modules.sys.utils.UserUtils;

/**
 * 放号管理
 * @author ChenXiHua
 * @version 2018-10-26
 *
 */
@Controller
@RequestMapping("/release")
public class ReleaseController implements IReleaseController {
	Logger log=LoggerFactory.getLogger(ReleaseController.class);
	
	
	@Autowired
	private IReleaseServer releaseServer;
	@Autowired
	private IModuleService moduleService;
	
	

	@Override
	@RequestMapping("/batchReleaseNumber")
	public String batchReleaseNumber(ModelMap modelMap,Modules module,@RequestParam("workDays")String workDays) {
		log.info(new Date()+"执行放号操作");
		Map<String,String>map=new HashMap<String,String>(8);
		String []date=workDays.split(",");
		map= releaseServer.batchReleaseNumber(module,date);
		modelMap.put("status",map);
		 return "modules/release/calendar";
	}
	
	
	

	@RequestMapping("/getReleasesByDate")
	@ResponseBody
	public Map<String,Object> getReleasesByDate(@RequestParam("mon")String mon,@RequestParam("day")String day) {
		log.info(new Date()+"执行放号操作");
		Map map=new HashMap<String,Object>(8);
		System.out.println("mon------>"+mon);
		System.out.println("day------>"+day);
		map.put("monDays",releaseServer.getReleasesByDate(mon));
		map.put("dayNum",releaseServer.getReleasesCountByDate(day));
		System.out.println("获取时间----------》"+map.toString());
		 return map;
	}
	
	@RequestMapping("/batchReleaseNumber2")
	@ResponseBody
	public Map<String,String> batchReleaseNumber2(Modules module,@RequestParam("workDays")String workDays) {
		log.info(new Date()+"执行放号操作");
		System.out.println("ddddddd--->"+module.getVersion());
		Map<String,String>map=new HashMap<String,String>(8);
		String []date=workDays.split(",");
		map=releaseServer.batchReleaseNumber(module,date);
		return map;
	}
	
	
	
	@RequestMapping("/getReleasesByDate2")
	@ResponseBody
	public Map<String,Object> getReleasesByDate(@RequestParam("mon")String mon,@RequestParam("day")String day,@RequestParam("date")String date) {
		log.info(new Date()+"执行放号操作");
		Map map=new HashMap<String,Object>(8);
		System.out.println("mon------>"+mon);
		System.out.println("day------>"+day);
		System.out.println("date------>"+date);
		List<Releases> list=releaseServer.getReleasesByDateAndPeriod(date,1);
		List<Releases> list2=releaseServer.getReleasesByDateAndPeriod(date,2);
		System.out.println("list"+list.toString());
		map.put("resultSet",list);
		map.put("resultSet2",list2);
		map.put("monDays",releaseServer.getReleasesByDate(mon));
		map.put("dayNum",releaseServer.getReleasesCountByDate(day));
		System.out.println("获取时间----------》"+map.toString());
		 return map;
	}


	@Override
	@RequestMapping("/toReleases")
	public String toReleases(ModelMap modelMap) {
		log.info(new Date()+"跳转到放号管理页面");
		//return "modules/release/releaseNumber";
		List<Map<String,Object>>modulesList=moduleService.findModulesByDeptId();
		System.out.println("mol-->"+modulesList.toString());
		modelMap.put("modulesList", modulesList);
		return "modules/release/calendar";
	}
	
	@RequestMapping("/callBackReleaseNumber")
	@ResponseBody
	public Map<String,String>CallBackReleaseNumber(@RequestBody List<Releases>list){
		Map<String,String>map=new HashMap<String,String>(8);
		System.out.println("list-->"+list.toString());
		map=releaseServer.CallBackReleaseNumber(list);
		System.out.println("map-->"+map.toString());
		return map;
	}
	

}
