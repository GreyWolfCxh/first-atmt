package cn.com.comit.appointment.modules.releases.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.comit.appointment.common.utils.DateUtils;
import cn.com.comit.appointment.modules.platform.dao.DeptMapper;
import cn.com.comit.appointment.modules.releases.dao.ModulesMapper;
import cn.com.comit.appointment.modules.releases.dao.ReleasesMapper;
import cn.com.comit.appointment.modules.releases.entity.Modules;
import cn.com.comit.appointment.modules.releases.entity.Releases;
import cn.com.comit.appointment.modules.releases.paramVo.ReleasesVo;
import cn.com.comit.appointment.modules.releases.service.IReleaseServer;
import cn.com.comit.appointment.modules.sys.utils.UserUtils;

/**
 * 放号管理服务接口实现类
 * @author admin
 *
 */
@Service("ReleaseServerImpl")
public class ReleaseServerImpl implements IReleaseServer {
	
	@Autowired
	private ModulesMapper modulesMapper;
	@Autowired
	private ReleasesMapper releasesMapper;
	@Autowired
	private DeptMapper deptMapper;
	
	//固定的放号模板
	private static String [][]modules={
			{"09:00-10:00","50"},
			{"10:00-11:00","50"},
			{"11:00-12:00","50"},
			{"14:00-15:00","50"},
			{"15:00-16:00","50"},
			{"16:00-17:00","50"},
			{"09:00-12:00","150"},
			{"14:00-17:00","150"}
	};

	@Override
	@Transactional
	public Map<String,String> batchReleaseNumber(Modules module, String[] dates) {
		Map<String,String>map=new HashMap<String,String>(8);
		Integer deptId=deptMapper.findDeptIdByUserId(UserUtils.getUser().getId());
		System.out.println("deptId-->"+deptId);
		if(deptId!=null){
			//执行固定模板
			if(module.getVersion()==11111||module.getVersion()==11112){
				insertRecord(module.getVersion(), dates);
				return map;
			}else{
				//执行自定义模板
				List<Modules>moduleList=modulesMapper.findModulesByVersion(deptId,module.getVersion());
				System.out.println("msl--->"+moduleList.toString());
				try {
				for(String date:dates){
					for(Modules record:moduleList){
						Releases releases=new Releases();
						releases.setTimeIterval(record.getTimeIterval());
						releases.setAppointmentNumber(record.getAppointmentNumber());
						releases.setOperationNumber(record.getAppointmentNumber());
						releases.setDay(getDate(date));
						//1表示上午，2表示下午
						releases.setPeriod(record.getPeriod());
						releases.setModuleId(record.getId());
						//窗口id
						releases.setWindowId(deptId);
						System.out.println("w-->"+releases.toString());
						releasesMapper.insertSelective(releases);
					}
					
				}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				return map;
			}
		}
		map.put("err", "你没有权限放号！");
		return map;
	}



	@Override
	public String getReleasesByDate(String date) {
		System.out.println("时间----==========》"+date);
		Integer deptId=deptMapper.findDeptIdByUserId(UserUtils.getUser().getId());
		System.out.println("dept----->"+deptId);
		List<Releases>list=releasesMapper.getReleasesByDate(date,deptId);
		StringBuffer sb=new StringBuffer();
		//组装放号日期
       
		/*int Y=2018;
		int M=10;*/
		//分解时间 2018-x-x
		String []d=date.split("-");
		String mon=d[1];
		//分解月份，08--》8
		if(String.valueOf(mon.charAt(0)).equals("0")){
			mon=String.valueOf(mon.charAt(1));
		}
		//组装json {"Y2018":{"M10":{"D1":2,"D2":2,"D3":2,"D4":2,}}}
		sb.append("{"+"\"Y"+d[0]+"\""+":{"+"\"M"+mon+"\":{");
		for(Releases record:list){
			try {
				System.out.println("放号--========================》"+record.getDay());
				String day = getDate3(record.getDay());
				if(String.valueOf(day.charAt(0)).equals("0")){
					day=String.valueOf(day.charAt(1));
				}
				int i=Integer.parseInt(day);
				sb.append("\"D"+i+"\""+":2,");
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		sb.append("}}}");
		System.out.println(sb.toString());
		
		 return sb.toString();
	}
	
	
	@Override
	public ReleasesVo getReleasesCountByDate(String date) {
		Integer deptId=deptMapper.findDeptIdByUserId(UserUtils.getUser().getId());
		System.out.println("de-->"+deptId);
		return releasesMapper.getReleasesCountByDate(date,deptId);
	}

	@Override
	public List<Releases> getReleasesByDateAndPeriod(String date, Integer period) {
		System.out.println("d--"+date);
		System.out.println("p-->"+period);
		Integer deptId=deptMapper.findDeptIdByUserId(UserUtils.getUser().getId());
		System.out.println("de-->"+deptId);
		return releasesMapper.getReleasesByDateAndPeriod(date,period,deptId);
	}

	
	//格式化时间
	 public static  Date getDate2(String string) throws ParseException {
	        //String string = "2018-2-1";
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
	        return sdf.parse(string);
	    }
	 
	 public static  String getDate3(Date date) throws ParseException {
	        //String string = "2018-2-1";
	        SimpleDateFormat sdf = new SimpleDateFormat("dd");
	        return sdf.format(date);
	    }
	
	 public static  Date getDate(String string) throws ParseException {
	        //String string = "2018-2-1";
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        System.out.println(sdf.parse(string));
	        return sdf.parse(string);
	    }
	
	 //插入固定模板的放号记录
	 public  void insertRecord(Integer version,String []dates){
		 //String []dates={"2018-10-25","2018-10-26"};
		 Integer deptId=deptMapper.findDeptIdByUserId(UserUtils.getUser().getId());
			for(String date:dates){
				if(version==111){
					for(int i=0;i<6;i++){	
					try {
						Releases releases=new Releases();
						releases.setTimeIterval(modules[i][0]);
						releases.setAppointmentNumber(Integer.parseInt(modules[i][1]));
						releases.setOperationNumber(Integer.parseInt(modules[i][1]));
						releases.setDay(getDate(date));
						//1表示上午，2表示下午
						if(i>2){
							releases.setPeriod(2);
						}else{
							releases.setPeriod(1);
						}
						releases.setModuleId(11111);
						//窗口id
						releases.setWindowId(deptId);
						releasesMapper.insertSelective(releases);
						System.out.print(releases.toString());
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}
				System.out.println();
				}else  {
					
					for(int i=6;i<8;i++){	
						try {
							Releases releases=new Releases();
							releases.setTimeIterval(modules[i][0]);
							releases.setAppointmentNumber(Integer.parseInt(modules[i][1]));
							releases.setOperationNumber(Integer.parseInt(modules[i][1]));
							releases.setDay(getDate(date));
							if(i>6){
								releases.setPeriod(2);
							}else{
								releases.setPeriod(1);
							}
							releases.setModuleId(11112);
							//窗口id
							releases.setWindowId(deptId);
							System.out.print(releases.toString());
							releasesMapper.insertSelective(releases);
						} catch (ParseException e) {
							e.printStackTrace();
						}
					}
					
				}// end else
				
			}
	 }
	
	public static void main(String[]args){
		ReleaseServerImpl rl=new ReleaseServerImpl();
		ArrayList<String>list= DateUtils.getDates(6);
		System.out.println("list-->"+list.toString());
		try {
			Date da=getDate("2018-10-11");
			String d=getDate3(da);
			if(String.valueOf(d.charAt(0)).equals("0")){
				d=String.valueOf(d.charAt(1));
				System.out.println("c-->"+d);
			}
			System.out.println("da-->"+da);
			System.out.println("d-->"+d);
			System.out.println("d-->"+d.charAt(0));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		StringBuffer sb=new StringBuffer();
		//组装放号日期
       
		int Y=2018;
		int M=10;
		
		int arr[]={1,2,3,4};
		sb.append("{"+"\"Y"+Y+"\""+":{"+"\"M"+M+"\":{");
		for(int i:arr){
			sb.append("\"D"+i+"\""+":2,");
		}
		sb.append("}}}");
		System.out.println(sb.toString());
	}


	@Override
	public List<Releases> getReleasesByWindowIdAndDateAndPeriod(Integer windowId, String date, Integer period) {
		 return releasesMapper.getReleasesByDateAndPeriod(date,period,windowId);
	}


	@Override
	public ArrayList<String> getReleasesDate(Integer windowId) {
		int day=6;
		ArrayList<String>listDates=DateUtils.getDates(day);
		return listDates;
	}


	@Override
	public List<String> findAppointTimeByDate(String appointmentDay) {
		Integer deptId=deptMapper.findDeptIdByUserId(UserUtils.getUser().getId());
		System.out.println("de-->"+deptId);
		return releasesMapper.findAppointTimeByDate(deptId,appointmentDay);
	}


	@Override
	public Map<String, String> CallBackReleaseNumber(List<Releases> list)  {
		Map<String,String>map=new HashMap<String,String>(8);
		Date date=null;
		for(Releases rs:list){
			Releases record=releasesMapper.selectByPrimaryKey(rs.getId());
			date=record.getDay();
			//要回收数量要小于等于可预约数量
			if(rs.getOperationNumber()<=record.getOperationNumber()){
				//回收可预约数量
				record.setOperationNumber(record.getOperationNumber()-rs.getOperationNumber());
				record.setAppointmentNumber(record.getAppointmentNumber()-rs.getOperationNumber());
				//更新可预约数量
				releasesMapper.updateByPrimaryKeySelective(record);
			}else{
				String msg="时间段："+record.getTimeIterval()+"的可预约数小于要回收的数量";
				String key=""+record.getId();
				map.put(key,msg);
			}
		}
		
		Integer deptId=deptMapper.findDeptIdByUserId(UserUtils.getUser().getId());
		System.out.println("de-->"+deptId);
		String day;
		day = DateUtils.formatDate(date);
		System.out.println("day--->"+day);
		ReleasesVo rv= releasesMapper.getReleasesCountByDate(day,deptId);
		System.out.println("rs-->"+rv.toString());
		if(rv.getAppointmentNumber()<=0){
		Integer id=releasesMapper.deleteRecordByWinIdAndDate(deptId,day);
		System.out.println("de--id--"+id);
		}
		return map;
	}

	


}
