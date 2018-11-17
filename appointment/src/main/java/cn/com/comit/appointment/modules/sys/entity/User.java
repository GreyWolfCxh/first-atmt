package cn.com.comit.appointment.modules.sys.entity;


import java.util.Arrays;
import java.util.Date;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;


/**
 * 用户实体类
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public class User extends BaseEntity{
	
	 private Integer id;
	
    private String num;

    private String pwd;

    private Integer sort;

    private String alias;
    
    private String name;

    private String identity;
    
    private String sex;
    
    private String phone;
    
    private Integer areaId;

    private Integer deptId;

    private String chargeType;
    
    private String post;

    private String certificateNo;

    private String certificateClass;

    private Date certificateDate;

    private Date validDate;

    private String backup1;

    private String backup2;

    private String backup3;

    private String backup4;
    
    private Role role;
    
    private String[] chargeTypes;
    
    
    
    
    
@Override
	public String toString() {
		return "User [id=" + id + ", num=" + num + ", pwd=" + pwd + ", sort=" + sort + ", alias=" + alias + ", name="
				+ name + ", identity=" + identity + ", sex=" + sex + ", phone=" + phone + ", areaId=" + areaId
				+ ", deptId=" + deptId + ", chargeType=" + chargeType + ", post=" + post + ", certificateNo="
				+ certificateNo + ", certificateClass=" + certificateClass + ", certificateDate=" + certificateDate
				+ ", validDate=" + validDate + ", backup1=" + backup1 + ", backup2=" + backup2 + ", backup3=" + backup3
				+ ", backup4=" + backup4 + ", role=" + role + ", chargeTypes=" + Arrays.toString(chargeTypes)
				+ ", areaName=" + areaName + ", deptName=" + deptName + "]";
	}

    private String areaName;
    
    private String deptName;
    
    public String[] getChargeTypes() {
		return chargeTypes;
	}

	public void setChargeTypes(String[] chargeTypes) {
		this.chargeTypes = chargeTypes;
	}
    
    
    public Integer getId() {
    	return id;
    }
    
    public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	
	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public User() {
    	super();
    }
    
    public User(Integer id) {
    	super();
    	this.id = id;
    }
    
    public User(String num) {
    	super();
    	this.num = num;
    }
    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num == null ? null : num.trim();
    }
    
    public String getPwd() {
        return pwd;
    }
    
    public void setPwd(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
    }
    
    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias == null ? null : alias.trim();
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
    
    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity == null ? null : identity.trim();
    }
    
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }
    
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }
    
    public Integer getAreaId() {
        return areaId;
    }

    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }
    
    public String getChargeType() {
        return chargeType;
    }

    public void setChargeType(String chargeType) {
        this.chargeType = chargeType == null ? null : chargeType.trim();
    }
    
    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }
    
    public String getCertificateNo() {
        return certificateNo;
    }

    public void setCertificateNo(String certificateNo) {
        this.certificateNo = certificateNo == null ? null : certificateNo.trim();
    }
    
    public String getCertificateClass() {
        return certificateClass;
    }
    
    public void setCertificateClass(String certificateClass) {
        this.certificateClass = certificateClass == null ? null : certificateClass.trim();
    }
    
    @JSONField(format="yyyy-MM-dd")
    public Date getCertificateDate() {
        return certificateDate;
    }

    public void setCertificateDate(Date certificateDate) {
        this.certificateDate = certificateDate;
    }
    
    @JSONField(format="yyyy-MM-dd")
    public Date getValidDate() {
        return validDate;
    }

    public void setValidDate(Date validDate) {
        this.validDate = validDate;
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
	public boolean isAdmin() {
		return this.id == 1;
	}
}
