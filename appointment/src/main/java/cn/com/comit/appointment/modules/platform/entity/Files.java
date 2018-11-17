package cn.com.comit.appointment.modules.platform.entity;

import java.util.Date;

import cn.com.comit.appointment.modules.sys.entity.BaseEntity;

public class Files extends BaseEntity{
    private Integer id;

    private Integer illegalId;

    private String newName;

    private String originalName;

    private String type;

    private String uploadBy;

    private Date uploadDate;

    private String href;

    private String remarks1;

    private String remarks2;

    private String remarks3;

    private String remarks4;

    @Override
	public String toString() {
		return "Files [id=" + id + ", illegalId=" + illegalId + ", newName=" + newName + ", originalName="
				+ originalName + ", type=" + type + ", uploadBy=" + uploadBy + ", uploadDate=" + uploadDate + ", href="
				+ href + ", remarks1=" + remarks1 + ", remarks2=" + remarks2 + ", remarks3=" + remarks3 + ", remarks4="
				+ remarks4 + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIllegalId() {
        return illegalId;
    }

    public void setIllegalId(Integer illegalId) {
        this.illegalId = illegalId;
    }

    public String getNewName() {
        return newName;
    }

    public void setNewName(String newName) {
        this.newName = newName == null ? null : newName.trim();
    }

    public String getOriginalName() {
        return originalName;
    }

    public void setOriginalName(String originalName) {
        this.originalName = originalName == null ? null : originalName.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getUploadBy() {
        return uploadBy;
    }

    public void setUploadBy(String uploadBy) {
        this.uploadBy = uploadBy == null ? null : uploadBy.trim();
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href == null ? null : href.trim();
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