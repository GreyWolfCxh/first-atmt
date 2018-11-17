package cn.com.comit.appointment.common.result;
import java.util.List;

import com.alibaba.fastjson.JSONObject;



/**
 * 分页结果类
 */
public class BasePageResult<T> extends ResultSupport{
	
	private static final long serialVersionUID = 1L;
	protected int total;
	protected List<T> rows;
	
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<T> getRows() {
		return rows;
	}

	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
	/**
	 * 程序处理成功，返回分页结果
	 * @param rows 数据列表
	 * @param total 数据总数
	 * @return JSON字符串
	 */
	public static <U> Object buildSuccessResult(List<U> rows,Integer total) {
        BasePageResult<U> basePageResult = new BasePageResult<U>();
        basePageResult.setSuccess(true);
        basePageResult.setStatusCode(200);
        basePageResult.setRows(rows);
        basePageResult.setTotal(total); ;
        return JSONObject.toJSONString(basePageResult);
    }
   
	/**
	 * 程序处理失败，返回状态码和结果信息
	 * @param statusCode 状态码
	 * @param resultMsg 结果信息
	 * @return JSON字符串
	 */
	public static <U> Object buildFailResult(int statusCode, String resultMsg) {
		BasePageResult<U> basePageResult = new BasePageResult<U>();
		basePageResult.setSuccess(false);
		basePageResult.setStatusCode(statusCode);
		basePageResult.setResultMsg(resultMsg);
        return JSONObject.toJSONString(basePageResult);
    }

}
