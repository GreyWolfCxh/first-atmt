package cn.com.comit.appointment.modules.workbench.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.comit.appointment.modules.workbench.entity.AppointmentRecords;

/**
 * 预约记录映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface AppointmentRecordsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AppointmentRecords record);

    int insertSelective(AppointmentRecords record);

    AppointmentRecords selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AppointmentRecords record);

    int updateByPrimaryKey(AppointmentRecords record);

	List<AppointmentRecords> findAppointmentRecord(AppointmentRecords appointmentRecords);

	Integer findAppointmentRecordCount(AppointmentRecords appointmentRecords);
	//根据微信账号查找记录
	List<AppointmentRecords> findAppointRecordByUserCode(AppointmentRecords appointmentRecords);
	//查找今天的预约记录
	List<AppointmentRecords> findAppointmentRecord1(AppointmentRecords appointmentRecords);
	//查找历史的预约记录
	Integer findAppointmentRecordCount1(AppointmentRecords appointmentRecords);
	//查找违约的记录
	List<AppointmentRecords> findAppointmentFailRecord(@Param("day")String day);
}