package cn.com.comit.appointment.common.result;
import java.io.Serializable;

/**
 * 结果基类
 */
public class ResultSupport implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private boolean success = true;
	private String resultMsg;
	private int statusCode;
	
	public ResultSupport() {
		
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getResultMsg() {
		return resultMsg;
	}

	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}
	
}
