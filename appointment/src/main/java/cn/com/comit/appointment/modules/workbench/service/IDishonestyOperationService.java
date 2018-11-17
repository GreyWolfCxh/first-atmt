package cn.com.comit.appointment.modules.workbench.service;

import cn.com.comit.appointment.modules.workbench.entity.DishonestyOperation;

/**
 * 失约操作服务接口
 * @author ChenXiHua
 * @version 2018-10-26
 *
 */
public interface IDishonestyOperationService {
	
	/**
	 * 增加失约操作记录
	 * @param record
	 * @return
	 */
	Integer insertDishonestyOperation(DishonestyOperation record);
	
	/**
	 * 删除失约操作记录
	 * @param record
	 * @return
	 */
	Integer delDishonestyOperation(DishonestyOperation record);

}
