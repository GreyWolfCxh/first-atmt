package cn.com.comit.appointment.modules.sys.dao;

import cn.com.comit.appointment.modules.sys.entity.Logs;

/**
 * 记录日志映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface LogsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Logs record);

    int insertSelective(Logs record);

    Logs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Logs record);

    int updateByPrimaryKey(Logs record);
}