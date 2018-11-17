package cn.com.comit.appointment.modules.wechat.paramBo;

import cn.com.comit.appointment.modules.sys.entity.BaseEntity;

/**
 * 微信公众号动态查询字段表
 * @author ChenXiHua
 * @version 2018-11-2
 *
 */
public class SearchFieldBo extends BaseEntity {
	
	private String carNum;//车牌号码
	
	private String inform;//通知书号码
	
	private String userName;//用户姓名
	
	private String illegalTime;//违法时间 （2018-11-01）
	
	private String identityCode;//协查验证码
	
	private Integer illegalId;
	
	private Integer windowId;
	
	

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public String getInform() {
		return inform;
	}

	public void setInform(String inform) {
		this.inform = inform;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getIllegalTime() {
		return illegalTime;
	}

	public void setIllegalTime(String illegalTime) {
		this.illegalTime = illegalTime;
	}

	public String getIdentityCode() {
		return identityCode;
	}

	public void setIdentityCode(String identityCode) {
		this.identityCode = identityCode;
	}

	public Integer getIllegalId() {
		return illegalId;
	}

	public void setIllegalId(Integer illegalId) {
		this.illegalId = illegalId;
	}

	public Integer getWindowId() {
		return windowId;
	}

	public void setWindowId(Integer windowId) {
		this.windowId = windowId;
	}
	
	
	
	
	
	
	


	
	

}
