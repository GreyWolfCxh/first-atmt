package cn.com.comit.appointment.modules.workbench.service;

import java.util.List;

import cn.com.comit.appointment.modules.workbench.entity.AppointmentRecords;

/**
 * 预约记录服务接口
 * @author ChenXiHua
 * @version 2018-10-29
 *
 */
public interface IAppointmentRecordService {
	
	/**
	 * 新增预约记录
	 * @param record
	 * @return
	 */
	Integer insertAppointmentRecord(AppointmentRecords record);
	
	/**
	 * 修改预约记录状态【代办理，已办理，已过期】
	 * @param record
	 * @return
	 */
	Integer updateAppointmentRecord(AppointmentRecords record);
	
	/**
	 * 根据id删除预约记录
	 * @param record【id】
	 * @return
	 */
	Integer delAppointmentRecordById(AppointmentRecords record);
	
	/**
	 * 根据【预约码，车牌号码，当事人，联系电话，预约日期时间段】其中之一
	 * 查询预约记录
	 * @param record【appointmentCode，carNumber，userName，userPhone，appointmentDay】
	 * @return
	 */
	List<AppointmentRecords>getAppointmentRecords(AppointmentRecords record);

	List<AppointmentRecords> findAppointmentRecord(AppointmentRecords appointmentRecords);

	Integer findAppointmentRecordCount(AppointmentRecords appointmentRecords);
	
	/**
	 * 获取今天的预约记录
	 * @param appointmentRecords
	 * @return
	 */
	List<AppointmentRecords> findAppointmentRecord1(AppointmentRecords appointmentRecords);
	
	/**
	 * 统计今天的预约记录总数
	 * @param appointmentRecords
	 * @return
	 */
	Integer findAppointmentRecordCount1(AppointmentRecords appointmentRecords);

}
