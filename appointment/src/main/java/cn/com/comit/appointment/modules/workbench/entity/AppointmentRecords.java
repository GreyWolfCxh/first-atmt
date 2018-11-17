package cn.com.comit.appointment.modules.workbench.entity;

import java.util.Date;

import cn.com.comit.appointment.modules.sys.entity.BaseEntity;

/**
 * 预约记录实体类
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public class AppointmentRecords extends BaseEntity{
    private Integer id;

    private String userCode;

    private String userPhone;

    private String userName;

    private String userCardid;

    private String userAddress;

    private String carNumber;

    private String illegalType;

    private String illegalReason;

    private Date illegalTime;

    private String appointmentAddress;

    private String appointmentWindow;

    private Date appointmentDay;

    private Integer period;

    private String timeItersal;

    private Date operatorDay;

    private String appointmentCode;
    //1 代办理 2已处理 3已过期
    private Integer status;
    //接收微信的预约日期，2018-11-01
    private String remarks1;

    private String remarks2;

    private String remarks3;

    private String remarks4;
    
    

    @Override
	public String toString() {
		return "AppointmentRecords [id=" + id + ", userCode=" + userCode + ", userPhone=" + userPhone + ", userName="
				+ userName + ", userCardid=" + userCardid + ", userAddress=" + userAddress + ", carNumber=" + carNumber
				+ ", illegalType=" + illegalType + ", illegalReason=" + illegalReason + ", illegalTime=" + illegalTime
				+ ", appointmentAddress=" + appointmentAddress + ", appointmentWindow=" + appointmentWindow
				+ ", appointmentDay=" + appointmentDay + ", period=" + period + ", timeItersal=" + timeItersal
				+ ", operatorDay=" + operatorDay + ", appointmentCode=" + appointmentCode + ", status=" + status
				+ ", remarks1=" + remarks1 + ", remarks2=" + remarks2 + ", remarks3=" + remarks3 + ", remarks4="
				+ remarks4 + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode == null ? null : userCode.trim();
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone == null ? null : userPhone.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserCardid() {
        return userCardid;
    }

    public void setUserCardid(String userCardid) {
        this.userCardid = userCardid == null ? null : userCardid.trim();
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress == null ? null : userAddress.trim();
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber == null ? null : carNumber.trim();
    }

    public String getIllegalType() {
        return illegalType;
    }

    public void setIllegalType(String illegalType) {
        this.illegalType = illegalType == null ? null : illegalType.trim();
    }

    public String getIllegalReason() {
        return illegalReason;
    }

    public void setIllegalReason(String illegalReason) {
        this.illegalReason = illegalReason == null ? null : illegalReason.trim();
    }

    public Date getIllegalTime() {
        return illegalTime;
    }

    public void setIllegalTime(Date illegalTime) {
        this.illegalTime = illegalTime;
    }

    public String getAppointmentAddress() {
        return appointmentAddress;
    }

    public void setAppointmentAddress(String appointmentAddress) {
        this.appointmentAddress = appointmentAddress == null ? null : appointmentAddress.trim();
    }

    public String getAppointmentWindow() {
        return appointmentWindow;
    }

    public void setAppointmentWindow(String appointmentWindow) {
        this.appointmentWindow = appointmentWindow == null ? null : appointmentWindow.trim();
    }

    public Date getAppointmentDay() {
        return appointmentDay;
    }

    public void setAppointmentDay(Date appointmentDay) {
        this.appointmentDay = appointmentDay;
    }

    public Integer getPeriod() {
        return period;
    }

    public void setPeriod(Integer period) {
        this.period = period;
    }

    public String getTimeItersal() {
        return timeItersal;
    }

    public void setTimeItersal(String timeItersal) {
        this.timeItersal = timeItersal == null ? null : timeItersal.trim();
    }

    public Date getOperatorDay() {
        return operatorDay;
    }

    public void setOperatorDay(Date operatorDay) {
        this.operatorDay = operatorDay;
    }

    public String getAppointmentCode() {
        return appointmentCode;
    }

    public void setAppointmentCode(String appointmentCode) {
        this.appointmentCode = appointmentCode == null ? null : appointmentCode.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getRemarks1() {
        return remarks1;
    }

    public void setRemarks1(String remarks1) {
        this.remarks1 = remarks1 == null ? null : remarks1.trim();
    }

    public String getRemarks2() {
        return remarks2;
    }

    public void setRemarks2(String remarks2) {
        this.remarks2 = remarks2 == null ? null : remarks2.trim();
    }

    public String getRemarks3() {
        return remarks3;
    }

    public void setRemarks3(String remarks3) {
        this.remarks3 = remarks3 == null ? null : remarks3.trim();
    }

    public String getRemarks4() {
        return remarks4;
    }

    public void setRemarks4(String remarks4) {
        this.remarks4 = remarks4 == null ? null : remarks4.trim();
    }
}