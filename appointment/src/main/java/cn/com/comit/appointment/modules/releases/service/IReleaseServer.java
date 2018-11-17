package cn.com.comit.appointment.modules.releases.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import cn.com.comit.appointment.modules.releases.entity.Modules;
import cn.com.comit.appointment.modules.releases.entity.Releases;
import cn.com.comit.appointment.modules.releases.paramVo.ReleasesVo;

/**
 * 放号管理服务接口
 * @author admin
 *
 */
public interface IReleaseServer {
	
	
	/**
	 * 单选放号，批量放号
	 * @param module 时间段模板
	 * @param listDate 日期
	 * @return
	 */
	Map<String,String> batchReleaseNumber(Modules module, String[] dates);
	
	/**
	 * 回收放号剩余数量
	 * @param date 回收日期
	 * @param list
	 * @return
	 */
	Map<String,String> CallBackReleaseNumber(List<Releases> list);
	
	/**
	 * 根据某个月份或者某一天日期获取放号汇总情况
	 * @param date【某个月份，某一天日期】【格式：2018-10】
	 * @return
	 */
	String getReleasesByDate(String date);
	
	/**
	 * 获取当天放号数量
	 * @param date【格式：2018-10-26】
	 * @return
	 */
	ReleasesVo getReleasesCountByDate(String date);
	
	/**
	 * 获取放号时间信息
	 * @param date
	 * @param period
	 * @return
	 */
	List<Releases> getReleasesByDateAndPeriod(String date, Integer period);
	
	/**
	 * 获取放号时间信息
	 * @param date
	 * @param period
	 * @return
	 */
	List<Releases> getReleasesByWindowIdAndDateAndPeriod(Integer windowId,String date, Integer period);
	
	/**
	 * 根据窗口id配置的可预约天数返回可预约时间段
	 * @param windowId
	 * @return
	 */
	ArrayList<String> getReleasesDate(Integer windowId);
	
	/**
	 * 获取预约时间段
	 * @return
	 */
	List<String> findAppointTimeByDate(String appointmentDay);

}
