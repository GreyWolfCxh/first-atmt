package cn.com.comit.appointment.modules.platform.dao;

import cn.com.comit.appointment.modules.platform.entity.DataSources;

/**
 * 数据源映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface DataSourcesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DataSources record);

    int insertSelective(DataSources record);

    DataSources selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DataSources record);

    int updateByPrimaryKey(DataSources record);

    //根据违章类型查找数据源
    DataSources findDataSourceByIllegalId(Integer id);
}