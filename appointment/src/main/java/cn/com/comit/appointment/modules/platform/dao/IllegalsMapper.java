package cn.com.comit.appointment.modules.platform.dao;

import java.util.List;
import java.util.Map;

import cn.com.comit.appointment.modules.platform.entity.Illegals;

/**
 * 违章类型映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface IllegalsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Illegals record);

    int insertSelective(Illegals record);

    Illegals selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Illegals record);

    int updateByPrimaryKey(Illegals record);

	//根据id查询违章类型
	Illegals findIllegalsById(Integer id);
	//获取违章类型信息
	List<Illegals> findIllegals(Illegals illegals);
	//获取违章类型信息总数
	int findIllegalsCount(Illegals illegals);
	//根据名字获取违章类型
	Illegals findIllegalsTypeByName(String illegalName);
	//新增窗口关联违章类型
	Integer addIllegalAndWindow(Map map);
	//获取所有违章类型记录
	List<Illegals> findAllIllegals();
}