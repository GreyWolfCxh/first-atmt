package cn.com.comit.appointment.modules.workbench.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.comit.appointment.modules.workbench.dao.AppointmentRecordsMapper;
import cn.com.comit.appointment.modules.workbench.entity.AppointmentRecords;
import cn.com.comit.appointment.modules.workbench.service.IAppointmentRecordService;

/**
 * 预约记录服务接口实现类
 * @author ChenXiHua
 * @version 2018-10-29
 *
 */
@Service("IAppointmentRecordServiceImpl")
public class IAppointmentRecordServiceImpl implements IAppointmentRecordService {
	
	@Autowired
	private AppointmentRecordsMapper appointmentRecordsMapper;

	@Override
	public Integer insertAppointmentRecord(AppointmentRecords record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer updateAppointmentRecord(AppointmentRecords record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer delAppointmentRecordById(AppointmentRecords record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AppointmentRecords> getAppointmentRecords(AppointmentRecords record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AppointmentRecords> findAppointmentRecord(AppointmentRecords appointmentRecords) {
		return appointmentRecordsMapper.findAppointmentRecord(appointmentRecords);
	}

	@Override
	public Integer findAppointmentRecordCount(AppointmentRecords appointmentRecords) {
		return appointmentRecordsMapper.findAppointmentRecordCount(appointmentRecords);
	}

	@Override
	public List<AppointmentRecords> findAppointmentRecord1(AppointmentRecords appointmentRecords) {
		System.out.println("ssss--->"+appointmentRecordsMapper.findAppointmentRecord1(appointmentRecords));
		return appointmentRecordsMapper.findAppointmentRecord1(appointmentRecords);
	}

	@Override
	public Integer findAppointmentRecordCount1(AppointmentRecords appointmentRecords) {
		return appointmentRecordsMapper.findAppointmentRecordCount1(appointmentRecords);
	}

}
