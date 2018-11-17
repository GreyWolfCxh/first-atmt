package cn.com.comit.appointment.modules.releases.entity;

import cn.com.comit.appointment.modules.sys.entity.BaseEntity;

/**
 * 放号模板实体类
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public class Modules extends BaseEntity {
    private Integer id;

    private Integer deptId;

    private Integer period;

    private String startTime;

    private String endTime;

    private String timeIterval;

    private Integer appointmentNumber;

    private Integer version;

    private String remarks1;

    private String remarks2;

    private String remarks3;

    private String remarks4;

    @Override
	public String toString() {
		return "Modules [id=" + id + ", deptId=" + deptId + ", period=" + period + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", timeIterval=" + timeIterval + ", appointmentNumber=" + appointmentNumber
				+ ", version=" + version + ", remarks1=" + remarks1 + ", remarks2=" + remarks2 + ", remarks3="
				+ remarks3 + ", remarks4=" + remarks4 + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getPeriod() {
        return period;
    }

    public void setPeriod(Integer period) {
        this.period = period;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime == null ? null : startTime.trim();
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime == null ? null : endTime.trim();
    }

    public String getTimeIterval() {
        return timeIterval;
    }

    public void setTimeIterval(String timeIterval) {
        this.timeIterval = timeIterval == null ? null : timeIterval.trim();
    }

    public Integer getAppointmentNumber() {
        return appointmentNumber;
    }

    public void setAppointmentNumber(Integer appointmentNumber) {
        this.appointmentNumber = appointmentNumber;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
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