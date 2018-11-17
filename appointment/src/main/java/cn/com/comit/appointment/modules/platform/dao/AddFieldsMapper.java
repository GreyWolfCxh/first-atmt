package cn.com.comit.appointment.modules.platform.dao;

import java.util.List;

import cn.com.comit.appointment.modules.platform.entity.AddFields;

/**
 * 补充字段映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface AddFieldsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AddFields record);

    int insertSelective(AddFields record);

    AddFields selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AddFields record);

    int updateByPrimaryKey(AddFields record);
    //根据违章类型id获取补充字段
	List<AddFields> findAddFieldsByIllegalId(Integer id);

}