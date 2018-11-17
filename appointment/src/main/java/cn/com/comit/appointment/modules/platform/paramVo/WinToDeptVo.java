package cn.com.comit.appointment.modules.platform.paramVo;

import cn.com.comit.appointment.modules.sys.entity.BaseEntity;

/**
 * 部门关联窗口vo层
 * @author ChenXiHua
 * @version 2018-10-25
 *
 */
public class WinToDeptVo extends BaseEntity{
	
	private Integer id;
	
	private Integer deptId;
	private Integer windowId;
	
	private String deptName;
	
	private String windowName;
	
	
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "WinToDeptVo [deptId=" + deptId + ", windowId=" + windowId + ", deptName=" + deptName + ", windowName="
				+ windowName + "]";
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public Integer getWindowId() {
		return windowId;
	}

	public void setWindowId(Integer windowId) {
		this.windowId = windowId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getWindowName() {
		return windowName;
	}

	public void setWindowName(String windowName) {
		this.windowName = windowName;
	}
	
	

}
