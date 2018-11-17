package cn.com.comit.appointment.modules.platform.entity;

import java.util.Date;
import java.util.List;

import cn.com.comit.appointment.modules.sys.entity.BaseEntity;

/**
 * 违章类型实体类
 * @author admin
 *
 */
public class Illegals extends BaseEntity{
    private Integer id;

    private String illegalName;

    private String illegalType;

    private Integer illegalStatus;

    private String sort;

    private Integer searchStatus;
    
    private Integer windowStatus;
    
    private Integer adDataStatus;

    private String tips;

    private Date time;

    private Date updateTime;

    private String remarks1;

    private String remarks2;

    private String remarks3;

    private String remarks4;
    
    //关联表
    private List<Files>filesList;
    private List<Fields>fieldsList;
    private List<AddFields>addFieldsList;
    private List<DataSources>dataSourcesList;
    private List<Windows>windowsList;
    //end
    
    
    
    

    public Integer getId() {
        return id;
    }

    @Override
	public String toString() {
		return "Illegals [id=" + id + ", illegalName=" + illegalName + ", illegalType=" + illegalType
				+ ", illegalStatus=" + illegalStatus + ", sort=" + sort + ", searchStatus=" + searchStatus
				+ ", windowStatus=" + windowStatus + ", adDataStatus=" + adDataStatus + ", tips=" + tips + ", time="
				+ time + ", updateTime=" + updateTime + ", remarks1=" + remarks1 + ", remarks2=" + remarks2
				+ ", remarks3=" + remarks3 + ", remarks4=" + remarks4 + ", filesList=" + filesList + ", fieldsList="
				+ fieldsList + ", addFieldsList=" + addFieldsList + ", dataSourcesList=" + dataSourcesList
				+ ", windowsList=" + windowsList + "]";
	}

	public List<Files> getFilesList() {
		return filesList;
	}

	public void setFilesList(List<Files> filesList) {
		this.filesList = filesList;
	}

	public List<Fields> getFieldsList() {
		return fieldsList;
	}

	public void setFieldsList(List<Fields> fieldsList) {
		this.fieldsList = fieldsList;
	}

	public List<AddFields> getAddFieldsList() {
		return addFieldsList;
	}

	public void setAddFieldsList(List<AddFields> addFieldsList) {
		this.addFieldsList = addFieldsList;
	}

	public List<DataSources> getDataSourcesList() {
		return dataSourcesList;
	}

	public void setDataSourcesList(List<DataSources> dataSourcesList) {
		this.dataSourcesList = dataSourcesList;
	}

	public List<Windows> getWindowsList() {
		return windowsList;
	}

	public void setWindowsList(List<Windows> windowsList) {
		this.windowsList = windowsList;
	}

	public void setId(Integer id) {
        this.id = id;
    }

    public String getIllegalName() {
        return illegalName;
    }

    public void setIllegalName(String illegalName) {
        this.illegalName = illegalName == null ? null : illegalName.trim();
    }

    public String getIllegalType() {
        return illegalType;
    }

    public void setIllegalType(String illegalType) {
        this.illegalType = illegalType == null ? null : illegalType.trim();
    }

    public Integer getIllegalStatus() {
        return illegalStatus;
    }

    public void setIllegalStatus(Integer illegalStatus) {
        this.illegalStatus = illegalStatus;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort == null ? null : sort.trim();
    }

    

    public Integer getSearchStatus() {
		return searchStatus;
	}

	public void setSearchStatus(Integer searchStatus) {
		this.searchStatus = searchStatus;
	}

	public Integer getWindowStatus() {
		return windowStatus;
	}

	public void setWindowStatus(Integer windowStatus) {
		this.windowStatus = windowStatus;
	}

	public Integer getAdDataStatus() {
		return adDataStatus;
	}

	public void setAdDataStatus(Integer adDataStatus) {
		this.adDataStatus = adDataStatus;
	}

	public String getTips() {
        return tips;
    }

    public void setTips(String tips) {
        this.tips = tips == null ? null : tips.trim();
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