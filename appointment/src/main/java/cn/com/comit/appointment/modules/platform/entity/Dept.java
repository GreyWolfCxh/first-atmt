package cn.com.comit.appointment.modules.platform.entity;

import cn.com.comit.appointment.modules.sys.entity.BaseEntity;

/**
 * 部门Entity
 * @author ZhengZongying
 * @version 2018-08-09
 */
public class Dept extends BaseEntity{
	
	private Integer id;
	
    private String name;

    private String code;

    private String linkman;

    private String leader;

    private String address;

    private String linkphone;

    private Integer areaId;
    
    private String areaName;
   
    private Integer sort;

    private String backup1;

    private String backup2;

    private String backup3;

    private String backup4;
    
    
    
    
    @Override
	public String toString() {
		return "Dept [id=" + id + ", name=" + name + ", code=" + code + ", linkman=" + linkman + ", leader=" + leader
				+ ", address=" + address + ", linkphone=" + linkphone + ", areaId=" + areaId + ", areaName=" + areaName
				+ ", sort=" + sort + ", backup1=" + backup1 + ", backup2=" + backup2 + ", backup3=" + backup3
				+ ", backup4=" + backup4 + "]";
	}


	public Dept() {
    	super();
    }
    

    public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman == null ? null : linkman.trim();
    }

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader == null ? null : leader.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getLinkphone() {
        return linkphone;
    }

    public void setLinkphone(String linkphone) {
        this.linkphone = linkphone == null ? null : linkphone.trim();
    }

    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
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