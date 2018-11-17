package cn.com.comit.appointment.modules.platform.dao;

import java.util.List;

import cn.com.comit.appointment.modules.platform.entity.Fields;

/**
 * 查询字段映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface FieldsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Fields record);

    int insertSelective(Fields record);

    Fields selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Fields record);

    int updateByPrimaryKey(Fields record);
    
    //根据违章类型id查询数据
	List<Fields> findFieldsByIllegalId(Integer id);

}