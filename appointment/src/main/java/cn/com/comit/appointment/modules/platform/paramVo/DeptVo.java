package cn.com.comit.appointment.modules.platform.paramVo;

/**
 * 部门vo层
 * @author ChenXiHua
 * @version 2018-10-25
 *
 */
public class DeptVo {
	
	private Integer id;
	
	private String text;

	@Override
	public String toString() {
		return "DeptVo [id=" + id + ", text=" + text + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	

}
