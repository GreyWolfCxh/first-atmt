package cn.com.comit.appointment.modules.wechat.paramBo;

import java.util.Date;

/**
 * 查询违章结果
 * @author admin
 *
 */
public class SerachResultBo {
	
	   private String illegalType;

	    private String windowName;

	    private Date illegalTime;
	    //0没有结果， 1有结果
	    private Integer status;
	    
	    

		public Integer getStatus() {
			return status;
		}

		public void setStatus(Integer status) {
			this.status = status;
		}

		public String getIllegalType() {
			return illegalType;
		}

		public void setIllegalType(String illegalType) {
			this.illegalType = illegalType;
		}

		public String getWindowName() {
			return windowName;
		}

		public void setWindowName(String windowName) {
			this.windowName = windowName;
		}

		public Date getIllegalTime() {
			return illegalTime;
		}

		public void setIllegalTime(Date illegalTime) {
			this.illegalTime = illegalTime;
		}
	    
	    
	

}
