package cn.com.comit.appointment.common.result;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import com.alibaba.fastjson.JSONObject;

/**
 * 基础结果类
 */
public class BaseResult extends ResultSupport{

	private static final long serialVersionUID = 1L;
	protected Map<String,Object> datas;
	
	
	
	public Map<String, Object> getDatas() {
		return datas;
	}

	public void setDatas(Map<String, Object> datas) {
		this.datas = datas;
	}

	public BaseResult(boolean success, int statusCode, String resultMsg) {
        this.setSuccess(success);
		this.setStatusCode(statusCode);
		this.setResultMsg(resultMsg);
	}
	
	public void setData(String key, Object value) {
		if(this.isSuccess()) {
			this.datas.put(key, value);
		}
	}
	/**
	 * 程序处理失败，返回状态码和结果信息
	 * @param statusCode 状态码
	 * @param resultMsg 结果信息
	 * @return JSON字符串
	 */
	public static Object buildFailResult(int statusCode, String resultMsg) {
        BaseResult baseResult = new BaseResult(false,statusCode,resultMsg);
        return JSONObject.toJSONString(baseResult);
    }
	
	/**
	 * 程序处理成功，返回200状态码，无其他信息
	 * @return JSON字符串
	 */
	public static Object buildSuccessResult() {
        BaseResult baseResult = new BaseResult(true,200,null);
        baseResult.datas = new HashMap<>(16);
        return JSONObject.toJSONString(baseResult);
    }
	
	/**
	 * 程序处理成功，返回200状态码，附带多个key-value对
	 * @param datas Map对象
	 * @return JSON字符串
	 */
	public static Object buildSuccessResult(Map datas) {
        BaseResult baseResult = new BaseResult(true,200,null);
        baseResult.datas = datas;
        return JSONObject.toJSONString(baseResult);
    }
   
	/**
	 * 程序处理成功，返回200状态码，附带一个key-value对
	 * @param key key字符串
	 * @param value object对象
	 * @return JSON字符串
	 */
	public static Object buildSuccessResult(String key, Object value) {
        BaseResult baseResult = new BaseResult(true,200,null);
        baseResult.datas = new HashMap<>(16);
        baseResult.datas.put(key, value);
        return JSONObject.toJSONString(baseResult);
    }
}

