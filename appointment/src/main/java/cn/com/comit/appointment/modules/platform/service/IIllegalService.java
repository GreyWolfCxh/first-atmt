package cn.com.comit.appointment.modules.platform.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import cn.com.comit.appointment.modules.platform.entity.Illegals;

/**
 * 违章类型服务接口
 * @author ChenXiHua
 * @version 2018-10-25
 *
 */
public interface IIllegalService {
	

	
	/**
	 * 增加违章类型记录
	 * @param record
	 * @return
	 */
	public Integer insertIllegals(Illegals record);
	
	/**
	 * 修改违章类型记录
	 * @param record
	 * @return
	 */
	public Integer updateIllegals(Illegals record);
	
	/**
	 * 根据id查找违章类型信息
	 * @param id
	 * @return
	 */
	public Map<String,Object>  findIllegalsById(Integer id);
	
	/**
	 * 根据id删除违章类型
	 * @param id
	 * @return
	 */
	public Integer delIllegalTypeById(Integer id);
	
	/**
	 * 增加违章类型
	 * @param illegals 违章类型基本信息
	 * @param files  文件模板
	 * @param filed  查询字段
	 * @param dataSources 数据源
	 * @param addField 补充字段
	 * @param basePath  绝对路径
	 */
	
	public boolean addIllegalTypes(Illegals illegals, MultipartFile[] files, String[] filed, String dataSources,
			String[] addField, String basePath, Integer[] windowIds);
	
	/**
	 * 获取违章类型信息
	 * @param illegals
	 * @return
	 */
	public List<Illegals> findIllegals(Illegals illegals);
	
	/**
	 * 获取违章类型信息总数
	 * @param illegals
	 * @return
	 */
	public int findIllegalsCount(Illegals illegals);
	
	/**
	 * 判断是否已经存在该类型名字
	 * @param illegalName
	 * @return
	 */
	public boolean findIllegalsTypeByName(String illegalName);

	/**
	 * 获取所有违章类型记录
	 * @return
	 */
	public List<Illegals> findAllIllegals();


}
