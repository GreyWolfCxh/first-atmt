package cn.com.comit.appointment.modules.workbench.dao;

import cn.com.comit.appointment.modules.workbench.entity.DishonestyRecords;

/**
 * 失约记录映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface DishonestyRecordsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DishonestyRecords record);

    int insertSelective(DishonestyRecords record);

    DishonestyRecords selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DishonestyRecords record);

    int updateByPrimaryKey(DishonestyRecords record);
}