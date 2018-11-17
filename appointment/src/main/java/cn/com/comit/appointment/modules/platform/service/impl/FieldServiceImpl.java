package cn.com.comit.appointment.modules.platform.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.comit.appointment.modules.platform.dao.FieldsMapper;
import cn.com.comit.appointment.modules.platform.entity.Fields;
import cn.com.comit.appointment.modules.platform.service.IFieldService;

@Service("FieldServiceImpl")
public class FieldServiceImpl implements IFieldService {
	
	@Autowired
	private FieldsMapper fieldsMapper;

	@Override
	public List<Fields> findFieldsByIllegalId(Integer id) {
		return fieldsMapper.findFieldsByIllegalId(id);
	}

}
