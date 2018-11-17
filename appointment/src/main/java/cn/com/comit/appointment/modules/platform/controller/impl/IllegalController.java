package cn.com.comit.appointment.modules.platform.controller.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.ILoggerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.com.comit.appointment.common.result.BaseResult;
import cn.com.comit.appointment.modules.platform.controller.IIllegalController;
import cn.com.comit.appointment.modules.platform.entity.Illegals;
import cn.com.comit.appointment.modules.platform.service.IIllegalService;
import cn.com.comit.appointment.modules.platform.service.IWindowService;
import cn.com.comit.appointment.modules.sys.controller.impl.BaseController;
import cn.com.comit.appointment.modules.sys.service.impl.TimedTaskServiceImpl;

/**
 * 违章类型控制器
 * @author ChenXiHua
 * @version 2018-10-25
 *
 */

@Controller
@RequestMapping("/illegals")
public class IllegalController extends BaseController implements IIllegalController {
	
	public Logger log=LoggerFactory.getLogger(IllegalController.class);
		
	@Autowired
	private IIllegalService illegalService;
	@Autowired
	private IWindowService windowService;
	
	@RequestMapping("/illegalList")
	@ResponseBody
	public Map<String,Object>illegalList(Illegals illegals){
		Map<String,Object>map=new HashMap<String,Object>();
		//信息列表
		List<Illegals>list=illegalService.findIllegals(illegals);
		//信息总数
		int total=illegalService.findIllegalsCount(illegals);
		map.put("total", total);
		map.put("rows", list);
		return map;
	}

	@Override
	@RequestMapping("/addIllegalTypes")
	@ResponseBody
	public Object addIllegalTypes(Illegals illegals, MultipartFile[]files,String []filed,String dataSources, String[]addField,
			Integer[] windowIds,HttpServletRequest request) {
		log.info("新增违章类型----------------");
        try {
        	String basePath = request.getSession().getServletContext().getRealPath("/");
        	boolean flag=illegalService.addIllegalTypes(illegals,files,filed,dataSources,addField,basePath,windowIds);
			if(!flag){
				return BaseResult.buildFailResult(500,  "添加过程出错，请重试。");
			}
		}catch(Exception e) {
			e.printStackTrace();
			return BaseResult.buildFailResult(500,  "添加过程出错，请重试。");
		}
		return BaseResult.buildSuccessResult();
        
	}


	@Override
	@RequestMapping("/toIllegals")
	public String toIllegals() {
		System.out.println("违章类型页面-------------");
		return "modules/platform/illegals";
	}

	@Override
	@RequestMapping("/toIllegal")
	public String toIllegal(ModelMap map, String status) {
		System.out.println("cs---ffffffffffffff------>"+status);
		map.put("status",status);
		return "modules/platform/illegals";
	}


	@Override
	@RequestMapping("/toAddIllegalType")
	public String toAddIllegalType() {
		log.info("跳转到增加违章类型页面");
		return "modules/platform/addIllegalType";
	}
	
	@RequestMapping("/findIllegalsTypeByName")
	@ResponseBody
	public boolean findIllegalsTypeByName(String illegalName) {
		log.info("在增加违章类型页面----》验证是否已经存在该违章类型名字");
		boolean flag=illegalService.findIllegalsTypeByName(illegalName);
		return flag;
	}
	
	
	@RequestMapping("/toFindIllegalType")
	public String toFindIllegalType(ModelMap modelMap,Integer id) {
		log.info("跳转到违章类型详情页面,id:"+id);
		modelMap.put("resultSet", illegalService.findIllegalsById(id));
		return "modules/platform/showIllegalType";
	}
	

	@Override
	@RequestMapping("/toEditIllegalType")
	public String toEditIllegalType(ModelMap map,Integer id) {
		log.info("跳转到修改违章类型页面,id:"+id);
		map.put("resultSet", illegalService.findIllegalsById(id));
		map.put("id", id);
		return "modules/platform/editIllegalType";
	}






	@Override
	@RequestMapping("/delIllegalType")
	@ResponseBody
	public Object delIllegalType(Integer id) {
		log.info("删除违章类型,id:"+id);
		System.out.println("del--id--->"+id);
		try {
			illegalService.delIllegalTypeById(id);
		}catch (Exception e) {
			e.printStackTrace();
			return BaseResult.buildFailResult(500, "删除过程出错，请重试。");
		}
		return BaseResult.buildSuccessResult();
	}
	

}
