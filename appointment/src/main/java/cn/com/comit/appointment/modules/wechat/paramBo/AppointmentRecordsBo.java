package cn.com.comit.appointment.modules.wechat.paramBo;

import cn.com.comit.appointment.modules.workbench.entity.AppointmentRecords;

public class AppointmentRecordsBo extends AppointmentRecords {
	
	 //处理窗口id
    private Integer windowId;
    //违章类型id
    private Integer illegalId;
    //补充资料状态1有，0没有
    private Integer addStatus;
    
	public Integer getWindowId() {
		return windowId;
	}
	public void setWindowId(Integer windowId) {
		this.windowId = windowId;
	}
	public Integer getIllegalId() {
		return illegalId;
	}
	public void setIllegalId(Integer illegalId) {
		this.illegalId = illegalId;
	}
	public Integer getAddStatus() {
		return addStatus;
	}
	public void setAddStatus(Integer addStatus) {
		this.addStatus = addStatus;
	}
	@Override
	public String toString() {
		return "AppointmentRecordsBo [windowId=" + windowId + ", illegalId=" + illegalId + ", addStatus=" + addStatus
				+ "]";
	}
    
    

}
