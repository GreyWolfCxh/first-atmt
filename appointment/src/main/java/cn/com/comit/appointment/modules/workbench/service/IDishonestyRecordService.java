package cn.com.comit.appointment.modules.workbench.service;

import cn.com.comit.appointment.modules.workbench.entity.DishonestyRecords;

/**
 * 失约记录服务接口
 * @author ChenXiHua
 * @version 2018-10-26
 *
 */
public interface IDishonestyRecordService {
	
	/**
	 * 增加失约记录
	 * @param record
	 * @return
	 */
	Integer insertDishonestyRecord(DishonestyRecords record);
}
