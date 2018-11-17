package cn.com.comit.appointment.modules.releases.paramVo;


/**
 * 放号管理vo层
 * @author ChenXiHua
 * @version 2018-10-26
 *
 */

public class ReleasesVo {
	
	private Integer appointmentNumber;
	
	private Integer operationNumber;
	
	public Integer getAppointmentNumber() {
		return appointmentNumber;
	}
	public void setAppointmentNumber(Integer appointmentNumber) {
		this.appointmentNumber = appointmentNumber;
	}
	public Integer getOperationNumber() {
		return operationNumber;
	}
	public void setOperationNumber(Integer operationNumber) {
		this.operationNumber = operationNumber;
	}
	@Override
	public String toString() {
		return "ReleasesVo [appointmentNumber=" + appointmentNumber + ", operationNumber=" + operationNumber + "]";
	}
	
	
	

}
