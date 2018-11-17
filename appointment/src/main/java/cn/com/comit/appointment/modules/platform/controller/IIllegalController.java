package cn.com.comit.appointment.modules.platform.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.com.comit.appointment.modules.platform.entity.Illegals;

/**
 * 违章类型接口
 * @author ChenXiHua
 * @version 2018-10-25
 *
 */
public interface IIllegalController {
	
	/**
	 * 跳转到违章管理页面
	 * @return
	 */
	public String toIllegals();
	
	public String toIllegal(ModelMap map,String status);
	
	/**
	 * 获取违章类型信息
	 * @param illegals
	 * @return
	 */
	public Map<String,Object>illegalList(Illegals illegals);
	
	/**
	 * 跳转到增加违章类型页面
	 * @return
	 */
	public String toAddIllegalType();
	
	/**
	 * 新增违章类型
	 * @param illegals 违章类型基本信息
	 * @param files 文件
	 * @param filed 查询字段
	 * @param dataSources 数据源
	 * @param addField 补充字段
	 * @param request 
	 * @return
	 */
	public Object addIllegalTypes(Illegals illegals, MultipartFile[]files,String []filed,String dataSources,String[]addField,
			Integer[] windowIds,HttpServletRequest request);
	
	/**
	 * 跳转到修改违章类型页面
	 * @param id
	 * @return
	 */
	public String toEditIllegalType(ModelMap map,Integer id);
	
	/**
	 * 跳转到违章类型详情页面
	 * @param id
	 * @return
	 */
	public String toFindIllegalType(ModelMap map,Integer id);
	
	/**
	 * 删除违章类型
	 * @param id
	 * @return
	 */
	public Object delIllegalType(Integer id);
}
