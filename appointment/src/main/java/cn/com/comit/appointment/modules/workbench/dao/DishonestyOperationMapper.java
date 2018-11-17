package cn.com.comit.appointment.modules.workbench.dao;

import cn.com.comit.appointment.modules.workbench.entity.DishonestyOperation;

/**
 * 失约操作映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface DishonestyOperationMapper {
    int insert(DishonestyOperation record);

    int insertSelective(DishonestyOperation record);
}