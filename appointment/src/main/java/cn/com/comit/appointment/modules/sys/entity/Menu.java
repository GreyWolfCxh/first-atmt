package cn.com.comit.appointment.modules.sys.entity;


/**
 * 菜单记录实体类
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public class Menu extends BaseEntity{
	
	 private Integer id;

    private Integer parentId;

    private String parentIds;

    private String name;

    private String href;

    private String icon;

    private Integer sort;

    private Integer isShow; //1是可见、2是不可见

    private String permission;

    private String backup1;

    private String backup2;

    private String backup3;

    private String backup4;
    
    private User user;
    
    
    
    
    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Menu [parentId=" + parentId + ", parentIds=" + parentIds + ", name=" + name + ", href=" + href
				+ ", icon=" + icon + ", sort=" + sort + ", isShow=" + isShow + ", permission=" + permission
				+ ", backup1=" + backup1 + ", backup2=" + backup2 + ", backup3=" + backup3 + ", backup4=" + backup4
				+ ", user=" + user + "]";
	}

	public Menu() {
    	super();
    }
    
    public Menu(User user) {
    	super();
    	this.user = user;
    }
    
    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user; 
	}

	public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds == null ? null : parentIds.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href == null ? null : href.trim();
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission == null ? null : permission.trim();
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
