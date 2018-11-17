package cn.com.comit.appointment.modules.platform.service;

import java.util.List;

import cn.com.comit.appointment.modules.platform.entity.Fields;

public interface IFieldService {
	
	/**
	 * 根据违章类型id获取查询字段
	 * @param id
	 * @return
	 */
	List<Fields>findFieldsByIllegalId(Integer id);

}
