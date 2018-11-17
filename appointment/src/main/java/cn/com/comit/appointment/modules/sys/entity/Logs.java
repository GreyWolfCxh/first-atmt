package cn.com.comit.appointment.modules.sys.entity;

import java.util.Date;

/**
 * 日志记录实体类
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public class Logs extends BaseEntity{
    private Integer id;

    private String operateType;

    private String content;

    private Integer operater;

    private Date operateTime;

    private String backup1;

    private String backup2;

    private String backup3;

    private String backup4;
    
    

    @Override
	public String toString() {
		return "Logs [id=" + id + ", operateType=" + operateType + ", content=" + content + ", operater=" + operater
				+ ", operateTime=" + operateTime + ", backup1=" + backup1 + ", backup2=" + backup2 + ", backup3="
				+ backup3 + ", backup4=" + backup4 + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOperateType() {
        return operateType;
    }

    public void setOperateType(String operateType) {
        this.operateType = operateType == null ? null : operateType.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getOperater() {
        return operater;
    }

    public void setOperater(Integer operater) {
        this.operater = operater;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public String getBackup1() {
        return backup1;
    }

    public void setBackup1(String backup1) {
        this.backup1 = backup1 == null ? null : backup1.trim();
    }

    public String getBackup2() {
        return backup2;
    }

    public void setBackup2(String backup2) {
        this.backup2 = backup2 == null ? null : backup2.trim();
    }

    public String getBackup3() {
        return backup3;
    }

    public void setBackup3(String backup3) {
        this.backup3 = backup3 == null ? null : backup3.trim();
    }

    public String getBackup4() {
        return backup4;
    }

    public void setBackup4(String backup4) {
        this.backup4 = backup4 == null ? null : backup4.trim();
    }
}