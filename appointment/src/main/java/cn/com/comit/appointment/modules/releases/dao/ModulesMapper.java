package cn.com.comit.appointment.modules.releases.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.comit.appointment.modules.releases.entity.Modules;

/**
 * 放号模板映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface ModulesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Modules record);

    int insertSelective(Modules record);

    Modules selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Modules record);

    int updateByPrimaryKey(Modules record);
    //根据部门id获取放号模板
	List<Modules> findModulesByDeptId(Integer deptId);
	//获取部门的放号模板最大版本号
	Integer findMaxVersionByDeptId(Integer deptId);
	//获取部门的放号模板版本列表
	List<Integer> findVersionsByDeptId(Integer deptId);
	//获取上下午的部门放号模板
	List<Modules> findModules(@Param("deptId")Integer deptId, @Param("version")Integer version,@Param("period") Integer period);
	//根据部门id和版本号删除放号模板
	Integer delModuleByDeptIdAndVersion(@Param("deptId")Integer deptId, @Param("version") Integer version);
	//根据版本获取放号模板
	List<Modules> findModulesByVersion(@Param("deptId")Integer deptId,@Param("version") Integer version);
}