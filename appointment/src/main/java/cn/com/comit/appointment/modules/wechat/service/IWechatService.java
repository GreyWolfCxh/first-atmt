package cn.com.comit.appointment.modules.wechat.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;

import cn.com.comit.appointment.modules.platform.entity.AddFields;
import cn.com.comit.appointment.modules.platform.entity.Illegals;
import cn.com.comit.appointment.modules.wechat.paramBo.AppointmentRecordsBo;
import cn.com.comit.appointment.modules.wechat.paramBo.SearchFieldBo;
import cn.com.comit.appointment.modules.workbench.entity.AppointmentRecords;

public interface IWechatService {
	
	/**
	 * 根据违章类型id获取查询字段
	 * @param id
	 * @return
	 */
	Map<String,Object>getSerachField(Integer id);
	
	/**
	 * 根据查询字段查询违章记录
	 * @param searchFieldBo
	 * @return
	 */
	Map<String,Object>getSerachResult(SearchFieldBo searchFieldBo);
	
	/**
	 * 根据窗口id和日期获取放号情况
	 * @param date
	 * @param windowId
	 * @return
	 */
	 Map<String,Object> getRelease( String date,Integer windowId);
	 
	 /**
	  * 获取所有违章类型
	  * @return
	  */
	List<Illegals> findAllIllegals();
	
	/**
	 * 根据违章类型id获取补充字段
	 * @param id
	 * @return
	 */
	List<AddFields> findAddFieldsByIllegalId(Integer id);
	
	/**
	 * 增加预约记录
	 * @param appointmentRecords
	 * @return
	 */
	Map<String, Object> insertAppointmentRecord(AppointmentRecordsBo appointmentRecordsBo);
	
	/**
	 * 根据微信账号查找预约记录
	 * @param appointmentRecords
	 * @return
	 */
	List<AppointmentRecords> findAppointRecordByUserCode(AppointmentRecords appointmentRecords);
	
	/**
	 * 删除id的记录
	 * @param id
	 * @return
	 */
	Map<String,String> delMyAppoint(AppointmentRecords appointmentRecords);
	
	/**
	 * 发送短信验证码
	 * @param phone
	 * @param ip
	 * @return
	 */
	Map<String, String> sendMsgCode(HttpSession session,String phone, String ip);

}
