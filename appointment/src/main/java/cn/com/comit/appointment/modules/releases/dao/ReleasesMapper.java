package cn.com.comit.appointment.modules.releases.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.com.comit.appointment.modules.releases.entity.Releases;
import cn.com.comit.appointment.modules.releases.paramVo.ReleasesVo;

/**
 * 放号管理映射接口
 * @author ChenXiHua
 * @version 2018-10-22
 *
 */
public interface ReleasesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Releases record);

    int insertSelective(Releases record);

    Releases selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Releases record);

    int updateByPrimaryKey(Releases record);
    //获取放号情况
	List<Releases> getReleasesByDate(@Param("date")String date,@Param("windowId")Integer windowId);
	//统计当天的放号总数
	ReleasesVo getReleasesCountByDate(@Param("date")String date,@Param("windowId")Integer windowId);
	//获取当天放号情况
	List<Releases> getReleasesByDateAndPeriod(@Param("date") String date, @Param("period")Integer period,@Param("windowId")Integer windowId);
	//获取预约时间段的剩余放号数量
	Releases findAppointNumberByDate(@Param("windowId")Integer windowId,@Param("appointmentDay")String appointmentDay, @Param("timeItersal")String timeItersal);
	//获取预约时间段
	List<String> findAppointTimeByDate(@Param("windowId")Integer windowId,@Param("appointmentDay")String appointmentDay);
	//根据窗口id和日期删除放号记录
	Integer deleteRecordByWinIdAndDate(@Param("windowId")Integer windowId,@Param("date") String date);
}