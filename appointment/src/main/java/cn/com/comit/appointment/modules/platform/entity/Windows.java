package cn.com.comit.appointment.modules.platform.entity;

import java.util.Date;

import cn.com.comit.appointment.modules.sys.entity.BaseEntity;

public class Windows extends BaseEntity{
    private Integer id;

    private String windowName;

    private String windowArea;

    private String windowAddress;

    private Integer operatorId;

    private String operatorName;

    private Integer deptId;

    private Date time;

    private Date updateTime;

    private Integer status;

    private Integer appointmentDays;

    private String remarks1;

    private String remarks2;

    private String remarks3;

    private String remarks4;

    @Override
	public String toString() {
		return "Windows [id=" + id + ", windowName=" + windowName + ", windowArea=" + windowArea + ", windowAddress="
				+ windowAddress + ", operatorId=" + operatorId + ", operatorName=" + operatorName + ", deptId=" + deptId
				+ ", time=" + time + ", updateTime=" + updateTime + ", status=" + status + ", appointmentDays="
				+ appointmentDays + ", remarks1=" + remarks1 + ", remarks2=" + remarks2 + ", remarks3=" + remarks3
				+ ", remarks4=" + remarks4 + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWindowName() {
        return windowName;
    }

    public void setWindowName(String windowName) {
        this.windowName = windowName == null ? null : windowName.trim();
    }

    public String getWindowArea() {
        return windowArea;
    }

    public void setWindowArea(String windowArea) {
        this.windowArea = windowArea == null ? null : windowArea.trim();
    }

    public String getWindowAddress() {
        return windowAddress;
    }

    public void setWindowAddress(String windowAddress) {
        this.windowAddress = windowAddress == null ? null : windowAddress.trim();
    }

    public Integer getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(Integer operatorId) {
        this.operatorId = operatorId;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName == null ? null : operatorName.trim();
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getAppointmentDays() {
        return appointmentDays;
    }

    public void setAppointmentDays(Integer appointmentDays) {
        this.appointmentDays = appointmentDays;
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