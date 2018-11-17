package cn.com.comit.appointment.modules.wechat.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import cn.com.comit.appointment.common.utils.DateUtils;
import cn.com.comit.appointment.modules.platform.dao.AddFieldsMapper;
import cn.com.comit.appointment.modules.platform.dao.DataSourcesMapper;
import cn.com.comit.appointment.modules.platform.dao.DeptMapper;
import cn.com.comit.appointment.modules.platform.dao.FieldsMapper;
import cn.com.comit.appointment.modules.platform.dao.FilesMapper;
import cn.com.comit.appointment.modules.platform.dao.IllegalsMapper;
import cn.com.comit.appointment.modules.platform.dao.WindowsMapper;
import cn.com.comit.appointment.modules.platform.entity.AddFields;
import cn.com.comit.appointment.modules.platform.entity.Dept;
import cn.com.comit.appointment.modules.platform.entity.Fields;
import cn.com.comit.appointment.modules.platform.entity.Files;
import cn.com.comit.appointment.modules.platform.entity.Illegals;
import cn.com.comit.appointment.modules.platform.entity.Windows;
import cn.com.comit.appointment.modules.releases.dao.ReleasesMapper;
import cn.com.comit.appointment.modules.releases.entity.Releases;
import cn.com.comit.appointment.modules.wechat.entity.TemplateData;
import cn.com.comit.appointment.modules.wechat.paramBo.AppointmentRecordsBo;
import cn.com.comit.appointment.modules.wechat.paramBo.SearchFieldBo;
import cn.com.comit.appointment.modules.wechat.paramBo.SerachResultBo;
import cn.com.comit.appointment.modules.wechat.service.IWechatService;
import cn.com.comit.appointment.modules.wechat.test.msg.DESEncryption;
import cn.com.comit.appointment.modules.wechat.test.msg.SendMessageTest;
import cn.com.comit.appointment.modules.wechat.utils.SendSMsgUtil;
import cn.com.comit.appointment.modules.wechat.utils.WX_TemplateMsgUtil;
import cn.com.comit.appointment.modules.workbench.dao.AppointmentRecordsMapper;
import cn.com.comit.appointment.modules.workbench.entity.AppointmentRecords;

@Service("WechatServiceImpl")
public class WechatServiceImpl implements IWechatService {
	
	@Autowired
	private ReleasesMapper releasesMapper;
	@Autowired
	private  IllegalsMapper illegalsMapper;
	@Autowired
	private FieldsMapper fieldsMapper;
	@Autowired
	private DataSourcesMapper dataSourcesMapper;
	@Autowired
	private AddFieldsMapper addFieldsMapper;
	@Autowired
	private AppointmentRecordsMapper appointmentRecordsMapper;
	@Autowired
	private FilesMapper filesMapper;
	@Autowired
	private DeptMapper deptMapper;
	@Autowired
	private WindowsMapper windowsMapper;
	

	@Override
	public Map<String, Object> getSerachField(Integer id) {
		//根据违章id获取查询字段
		List<Fields>fields=fieldsMapper.findFieldsByIllegalId(id);
		System.out.println("fields-->"+fields.toString());
		//根据违章id获取补充字段
		List<AddFields>addFields=addFieldsMapper.findAddFieldsByIllegalId(id);
		System.out.println("addFields---------->"+addFields.toString());
		//根据违章id获取固定窗口信息
		List<Dept>depts=deptMapper.getWindowByIllegalId(id);
		System.out.println("depts---------->"+depts.toString());
		String date=DateUtils.getDate();
		//String date="2018-11-01";
		Integer windowId=129901330;
		Map<String,Object>map=new HashMap<String,Object>(8);
		//上午预约时间
		List<Releases> listAm=releasesMapper.getReleasesByDateAndPeriod(date,1,windowId);
		//下午预约时间
		List<Releases> listPm=releasesMapper.getReleasesByDateAndPeriod(date,2,windowId);
		//预约时间段,默认6天
		int day=0;
		Integer days=windowsMapper.findDaysByWindowId(windowId);
		if(days!=null){
			day=days;
		}else{
			day=6;
		}
		ArrayList<String>listDates=DateUtils.getDates(day);
		//ArrayList<String>listDate=releasesMapper.getReleasesDate(windowId);
		map.put("listDate", listDates);
		map.put("resultSet",listAm);
		map.put("resultSet2",listPm);
		map.put("fields", fields);
		map.put("addFields", addFields);
		map.put("depts", depts);
		System.out.println("获取查询字段----》"+map.toString());
		return map;
	}

	@Override
	public Map<String, Object> getSerachResult(SearchFieldBo searchFieldBo) {
		Map<String,Object>map=new HashMap<String,Object>(8);
		//write search result
		 try {
		StringBuffer sb=new StringBuffer("{");
		sb.append("\"illegalType\":"+"\""+searchFieldBo.getCarNum()+"\",");
		sb.append("\"carNum\":"+"\""+searchFieldBo.getCarNum()+"\",");
		sb.append("\"inform\":"+"\""+searchFieldBo.getInform()+"\",");
		sb.append("\"userName\":"+"\""+searchFieldBo.getUserName()+"\",");
		sb.append("\"illegalTime\":"+"\""+searchFieldBo.getIllegalTime()+"\",");
		sb.append("\"identityCode\":"+"\""+searchFieldBo.getIdentityCode()+"\"}");
		
		sb.append("_TE_{\"UserId\":\"200174\",\"OrgId\":\"200041\",\"EquipmentBrand\":\"Xiaomi\",\"SystemVersion\":\"6.0.1\",\"EquipmentModel\":\"MI NOTE LTE\",\"SoftwareVersion\":\"v2.0.0.4.20161028\",\"CId\":\"null\"}_TE_");
		String key=DESEncryption.toHexString(DESEncryption.encrypt(DateUtils.formatDateTime(new Date()),"tesecret"));
		sb.append(key);
		System.out.println("sb---->"+sb.toString());
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//end
		SerachResultBo serachResult=new SerachResultBo() ;
		serachResult.setStatus(0);
		
		String date=DateUtils.getDate();
		Integer windowId=129901330;
		//上午预约时间
	   List<Releases> listAm=releasesMapper.getReleasesByDateAndPeriod(date,1,windowId);
		//下午预约时间
		List<Releases> listPm=releasesMapper.getReleasesByDateAndPeriod(date,2,windowId);
		//预约时间段,默认6天
		int day=0;
		Integer days=windowsMapper.findDaysByWindowId(windowId);
		if(days!=null){
			day=days;
		}else{
			day=6;
		}
		ArrayList<String>listDates=DateUtils.getDates(day);
		map.put("listDate", listDates);
		map.put("resultSet",listAm);
		map.put("resultSet2",listPm);
		map.put("fields", searchFieldBo);
		map.put("serachResult", serachResult);
		return map;
	}

	@Override
	public Map<String, Object> getRelease(String date, Integer windowId) {
		Map map=new HashMap<String,Object>(8);
		//预约时间段,默认6天
				int day=0;
				Integer days=windowsMapper.findDaysByWindowId(windowId);
				if(days!=null){
					day=days;
				}else{
					day=6;
				}
				ArrayList<String>listDates=DateUtils.getDates(day);
		//上午预约时间
		 List<Releases> listAm=releasesMapper.getReleasesByDateAndPeriod(date,1,windowId);
		//下午预约时间
		List<Releases> listPm=releasesMapper.getReleasesByDateAndPeriod(date,2,windowId);
		map.put("listDate", listDates);
		map.put("resultSet",listAm);
		map.put("resultSet2",listPm);
		System.out.println("map--getRelease---------->"+map.toString());
		return map;
	}

	@Override
	public List<Illegals> findAllIllegals() {
		return illegalsMapper.findAllIllegals();
	}

	@Override
	public List<AddFields> findAddFieldsByIllegalId(Integer id) {
		return addFieldsMapper.findAddFieldsByIllegalId(id);
	}

	@Override
	@Transactional
	public Map<String, Object> insertAppointmentRecord(AppointmentRecordsBo appointmentRecords) {
		Map<String, Object> map=new HashMap<String,Object>(8);
		//判断放号数量是否还有剩余数量
		Releases releases=null;
		try {
		//根据预约日期和预约时间区间
		releases = releasesMapper.findAppointNumberByDate(appointmentRecords.getWindowId(),  appointmentRecords.getRemarks1(),appointmentRecords.getTimeItersal());
		System.out.println("relea---->"+releases.toString());
		if(releases.getOperationNumber()<=0){
			System.out.println("getOperationNumber---->"+releases.getOperationNumber());
			map.put("releasesNum", "该时间段剩余数量为0，请重新预约其他时间段");
			return map;
		}
		appointmentRecords.setOperatorDay(new Date());
		appointmentRecords.setStatus(1);
		//记录处理窗口id
		appointmentRecords.setAppointmentWindow(appointmentRecords.getWindowId().toString());
		System.out.println("date-->"+DateUtils.getDate4(appointmentRecords.getRemarks1()));
		appointmentRecords.setAppointmentDay(DateUtils.getDate4(appointmentRecords.getRemarks1()));
		Integer id=appointmentRecordsMapper.insertSelective(appointmentRecords);
		System.out.println("id========"+id);
		if(id>0){
			//放号数量减一,更新放号情况
			Releases reRecord=new Releases();
			reRecord.setId(releases.getId());
			reRecord.setOperationNumber(releases.getOperationNumber()-1);
			releasesMapper.updateByPrimaryKeySelective(reRecord);
			
			System.out.println("id---->"+appointmentRecords.getId());
			long time=System.currentTimeMillis();
			//预约码==2个数字+时间
			 Random random = new Random();  
			 String start="";
			 String end="";
		        // 1位验证码  
		        for (int i = 0; i < 1; i++) {  
		        	start=String.valueOf(random.nextInt(10));  
		        }  
		        for (int i = 0; i < 1; i++) {  
		        	end=String.valueOf(random.nextInt(10));  
		        }  
			String appointCode=start+time+end;
			AppointmentRecords record=new AppointmentRecords();
			record.setId(appointmentRecords.getId());
			record.setAppointmentCode(appointCode);
			//更新预约码
			appointmentRecordsMapper.updateByPrimaryKeySelective(record);
			List<Files>files=filesMapper.findFilesByIllegalId(id);
			map.put("userCode", appointmentRecords.getUserCode());
			map.put("appointCode", appointCode);
			map.put("files", files);
			//获取预约窗口信息
			Windows win=windowsMapper.findWindowsByDeptId(appointmentRecords.getWindowId());
			//微信公众号推送预约成功信息
			if(win!=null){
			    Map<String,TemplateData> param = new HashMap<>();
	            param.put("first",new TemplateData("恭喜预约成功！","#696969"));
	            param.put("keyword1",new TemplateData(appointmentRecords.getRemarks1(),"#696969"));
	            param.put("keyword2",new TemplateData(win.getWindowName(),"#696969"));
	            param.put("keyword3",new TemplateData(win.getWindowAddress(),"#696969"));
	            param.put("remark",new TemplateData("很高兴为你服务，预约当天请记得来哦！","#696969"));
	            String openId=appointmentRecords.getUserCode();
	            //消息模板id
	            String moduleId="I-pGWBLif2upnmsanxCHq15n1XlwFl6O7HVTZbYGnJc";
	            JSON.toJSONString(param);
	            JSONObject jsonObject = JSONObject.parseObject(JSON.toJSONString(param));
	            System.out.println("jsonObject-->"+jsonObject);
	            //调用发送微信消息给用户的接口
	            WX_TemplateMsgUtil.sendWechatMsgToUser(openId,moduleId, "", 
	                  "#000000", jsonObject);
	            
	            //发送预约成功短信给用户
	            String period=appointmentRecords.getPeriod()==1?"上午":"下午";
	            String content="预约成功通知   预约码："+appointCode
	            		+"  预约时间："+appointmentRecords.getRemarks1()
	            		+period+"  "+appointmentRecords.getTimeItersal()
	            		+"   预约窗口："+win.getWindowName()
	            		+"   预约地点："+win.getWindowAddress();
			System.out.println("content---》"+content);
			SendSMsgUtil.sendParams(appointmentRecords.getUserPhone(), content, "localhost");
			}
			
		}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return map;
	}
	

	@Override
	public List<AppointmentRecords> findAppointRecordByUserCode(AppointmentRecords appointmentRecords) {
		return appointmentRecordsMapper.findAppointRecordByUserCode(appointmentRecords);
	}

	@Override
	@Transactional
	public Map<String,String> delMyAppoint(AppointmentRecords  appointmentRecords) {
		AppointmentRecords record=appointmentRecordsMapper.selectByPrimaryKey(appointmentRecords.getId());
		System.out.println("record---->"+record.toString());
		//在预约时间前一天24点之前都可以取消预约
		long time=DateUtils.subDate(record.getAppointmentDay(), new Date());
		Map<String,String>map=new HashMap<String,String>(8);
		System.out.println("time-->"+time);
		if(time>0){
			 appointmentRecordsMapper.deleteByPrimaryKey(appointmentRecords.getId());
			 map.put("status", "取消预约成功");
		}else{
			map.put("status", "取消预约失败，取消预约时间最迟在预约时间前一天的24点之前");
		}
		return map;
	}

	@Override
	public Map<String, String> sendMsgCode(HttpSession session,String phone, String ip) {
		 StringBuilder code = new StringBuilder();  
	        Map<String,String>map=new HashMap<String,String>(8);
	        Random random = new Random();  
	        // 6位验证码  
	        for (int i = 0; i < 6; i++) {  
	            code.append(String.valueOf(random.nextInt(10)));  
	        }  
	        session.setAttribute("code",code.toString());
	        session.setAttribute("phone",phone);
	        String content="正在核实您的用户信息，您的验证码是："+code.toString()+"   验证码5分钟内有效，如非本人操作请忽略";
	        //发送短信
	        SendSMsgUtil.sendParams(phone,content,ip);  
	        try {
	            //TimerTask实现5分钟后从session中删除code
	            final Timer timer=new Timer();
	            timer.schedule(new TimerTask() {
	                @Override
	                public void run() {
	                    session.removeAttribute("code");
	                    session.removeAttribute("phone");
	                    System.out.println("code删除成功");
	                    timer.cancel();
	                }
	            },5*60*1000);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        
	        map.put("phone", phone);
	        map.put("code", code.toString());
	        return map;
	}
	
	
	public static void  main(String []args){
		long userCode=System.currentTimeMillis();
		String cs="css"+userCode;
		System.out.println("l-->"+userCode);
		System.out.println("cs-->"+cs);
		System.out.println("cs-->"+DateUtils.getDate());
	}
	
}
