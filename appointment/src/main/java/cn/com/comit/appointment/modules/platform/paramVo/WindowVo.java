package cn.com.comit.appointment.modules.platform.paramVo;

import cn.com.comit.appointment.modules.sys.entity.BaseEntity;

/**
 * 处理窗口vo层
 * @author ChenXiHua
 * @version 2018-10-26
 *
 */
public class WindowVo extends BaseEntity{
	
	    private Integer id;
	    private String windowName;
	    private Integer deptId;
	    private String deptName;
		@Override
		public String toString() {
			return "WindowVo [id=" + id + ", windowName=" + windowName + ", deptId=" + deptId + ", deptName=" + deptName
					+ "]";
		}
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getWindowName() {
			return windowName;
		}
		public void setWindowName(String windowName) {
			this.windowName = windowName;
		}
		public Integer getDeptId() {
			return deptId;
		}
		public void setDeptId(Integer deptId) {
			this.deptId = deptId;
		}
		public String getDeptName() {
			return deptName;
		}
		public void setDeptName(String deptName) {
			this.deptName = deptName;
		}
	    
	    
	    

}
