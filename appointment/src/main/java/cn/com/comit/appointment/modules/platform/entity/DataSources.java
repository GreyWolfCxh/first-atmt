package cn.com.comit.appointment.modules.platform.entity;

import cn.com.comit.appointment.modules.sys.entity.BaseEntity;

public class DataSources extends BaseEntity{
    private Integer id;

    private Integer illegalId;

    private String datasourceZname;

    private String datasourceEname;

    private String remarks1;

    private String remarks2;

    private String remarks3;

    private String remarks4;

    @Override
	public String toString() {
		return "DataSources [id=" + id + ", illegalId=" + illegalId + ", datasourceZname=" + datasourceZname
				+ ", datasourceEname=" + datasourceEname + ", remarks1=" + remarks1 + ", remarks2=" + remarks2
				+ ", remarks3=" + remarks3 + ", remarks4=" + remarks4 + "]";
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

    public String getDatasourceZname() {
        return datasourceZname;
    }

    public void setDatasourceZname(String datasourceZname) {
        this.datasourceZname = datasourceZname == null ? null : datasourceZname.trim();
    }

    public String getDatasourceEname() {
        return datasourceEname;
    }

    public void setDatasourceEname(String datasourceEname) {
        this.datasourceEname = datasourceEname == null ? null : datasourceEname.trim();
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