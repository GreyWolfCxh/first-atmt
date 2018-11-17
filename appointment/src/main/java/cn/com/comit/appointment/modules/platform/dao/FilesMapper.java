package cn.com.comit.appointment.modules.platform.dao;

import java.util.List;

import cn.com.comit.appointment.modules.platform.entity.Files;

/**
 * 文件模板映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface FilesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Files record);

    int insertSelective(Files record);

    Files selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Files record);

    int updateByPrimaryKey(Files record);
    //根据违章类型查找文件记录
	List<Files> findFilesByIllegalId(Integer id);

}