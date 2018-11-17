package cn.com.comit.appointment.modules.sys.service;


/**
 * 定时任务服务接口
 * @author ChenXiHua
 * @version 2018-10-23
 *
 */
public interface TimedTaskService {
	
	/**
	 * 在预约时间的前一天发送预约提醒信息和短信提醒信息
	 */
	public void sendMessageToInform();
	
	/**
	 * 修改过了预约时间的预约状态 还是未处理的预约记录
	 * 状态转变：未处理--》已过期
	 */
	public void updateAppointmentStatus();

}
