package cn.com.comit.appointment.modules.releases.entity;

import java.util.Date;

import cn.com.comit.appointment.modules.sys.entity.BaseEntity;

/**
 * 放号记录实体类
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public class Releases extends BaseEntity{
    private Integer id;

    private Integer moduleId;

    private Integer windowId;

    private Integer appointmentNumber;

    private Integer operationNumber;

    private Date day;

    private Integer period;

    private String timeIterval;

    private Integer status;

    private String remarks1;

    private String remarks2;

    private String remarks3;

    private String remarks4;

    @Override
	public String toString() {
		return "Releases [id=" + id + ", moduleId=" + moduleId + ", windowId=" + windowId + ", appointmentNumber="
				+ appointmentNumber + ", operationNumber=" + operationNumber + ", day=" + day + ", period=" + period
				+ ", timeIterval=" + timeIterval + ", status=" + status + ", remarks1=" + remarks1 + ", remarks2="
				+ remarks2 + ", remarks3=" + remarks3 + ", remarks4=" + remarks4 + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getModuleId() {
        return moduleId;
    }

    public void setModuleId(Integer moduleId) {
        this.moduleId = moduleId;
    }

    public Integer getWindowId() {
        return windowId;
    }

    public void setWindowId(Integer windowId) {
        this.windowId = windowId;
    }

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

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public Integer getPeriod() {
        return period;
    }

    public void setPeriod(Integer period) {
        this.period = period;
    }

    public String getTimeIterval() {
        return timeIterval;
    }

    public void setTimeIterval(String timeIterval) {
        this.timeIterval = timeIterval == null ? null : timeIterval.trim();
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