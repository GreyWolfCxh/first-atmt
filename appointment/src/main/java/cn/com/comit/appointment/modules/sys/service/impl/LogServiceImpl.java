package cn.com.comit.appointment.modules.sys.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.comit.appointment.modules.sys.dao.LogsMapper;
import cn.com.comit.appointment.modules.sys.entity.Logs;
import cn.com.comit.appointment.modules.sys.service.ILogService;

/**
 * 日志服务接口实现类
 * @author admin
 *
 */
@Service("LogServiceImpl")
public class LogServiceImpl implements ILogService {
	
	@Autowired
	private LogsMapper logsMapper;

	@Override
	public void add() {
		Logs log=new Logs();
		log.setOperater(1);
		log.setOperateTime(new Date());
		log.setContent("测试" );
		logsMapper.insertSelective(log);
		
		System.out.println("增加-->"+log.getId());
	}

	@Override
	public void edit() {
		Logs log=new Logs();
		log.setId(1);
		log.setOperateTime(new Date());
		log.setContent("修改测试" );
		logsMapper.updateByPrimaryKey(log);
		System.out.println("增加-->"+log.getId());
	}

	@Override
	public void del() {
		logsMapper.deleteByPrimaryKey(1);
		System.out.println("删除-->");
	}

	@Override
	public void search() {
		Logs log=logsMapper.selectByPrimaryKey(1);
		System.out.println("查找-->"+log.toString());
	}

}
