package cn.com.comit.appointment.modules.sys.entity;



import java.io.Serializable;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonIgnore;

import cn.com.comit.appointment.modules.sys.utils.UserUtils;


/**
 * 基础实体类
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public class BaseEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	
	
	protected Integer status;
	
	protected Integer page;
	
	protected Integer rows;
	
	protected Integer start;
	
	protected Integer end;
	
	protected String order;
	
		
	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public Integer getStart() {
		if(page != null && rows != null) {
			return this.start = ( page - 1 ) * rows + 1;
		}else {
			return null;
		}
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getEnd() {
		if(page != null && rows != null) {
			return this.end = page * rows;
		}else {
			return null; 
		}
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	@JsonIgnore
	@JSONField(serialize=false)
	protected User currentUser;
	
	public static final int STATUS_FLAG_NORMAL = 1;
	public static final int STATUS_FLAG_DELETE = 0;
	public static final int STATUS_FLAG_STOP = 2;
	
	public BaseEntity() { 
		this.status = STATUS_FLAG_NORMAL;
	}
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	@JsonIgnore
	@JSONField(serialize=false)
	public User getCurrentUser() {
		if(currentUser == null){
			currentUser = UserUtils.getUser();
		}
		return currentUser;
	}
	
	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}
}

