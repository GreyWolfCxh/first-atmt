package cn.com.comit.appointment.modules.platform.service.impl;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import cn.com.comit.appointment.modules.platform.dao.AddFieldsMapper;
import cn.com.comit.appointment.modules.platform.dao.DataSourcesMapper;
import cn.com.comit.appointment.modules.platform.dao.FieldsMapper;
import cn.com.comit.appointment.modules.platform.dao.FilesMapper;
import cn.com.comit.appointment.modules.platform.dao.IllegalsMapper;
import cn.com.comit.appointment.modules.platform.dao.WindowsMapper;
import cn.com.comit.appointment.modules.platform.entity.AddFields;
import cn.com.comit.appointment.modules.platform.entity.DataSources;
import cn.com.comit.appointment.modules.platform.entity.Fields;
import cn.com.comit.appointment.modules.platform.entity.Files;
import cn.com.comit.appointment.modules.platform.entity.Illegals;
import cn.com.comit.appointment.modules.platform.service.IIllegalService;
import cn.com.comit.appointment.modules.platform.utils.UploadFileUtils;
import cn.com.comit.appointment.modules.sys.utils.UserUtils;

/**
 * 违章类型服务接口实现类
 * @author admin
 *
 */
@Service("IllegalServiceImpl")
public class IllegalServiceImpl implements IIllegalService {
	
	@Autowired
	private IllegalsMapper illegalsMapper;
	@Autowired
	private FilesMapper filesMapper;
	@Autowired
	private FieldsMapper fieldsMapper;
	@Autowired
	private AddFieldsMapper addFieldsMapper;
	@Autowired
	private DataSourcesMapper dataSourcesMapper;
	@Autowired
	private WindowsMapper windowsMapper;
	@Autowired
	UploadFileUtils uploadFileUtils;



	@Override
	public Map<String,Object> findIllegalsById(Integer id) {
		Map<String,Object>map=new HashMap<String,Object>(8);
		
		map.put("illegals", illegalsMapper.selectByPrimaryKey(id));//获取违章类型信息
		map.put("fileList", filesMapper.findFilesByIllegalId(id));//获取上传文件
		map.put("fieldList", fieldsMapper.findFieldsByIllegalId(id));//获取查询字段
		map.put("addFieldList", addFieldsMapper.findAddFieldsByIllegalId(id));//获取补充字段
		map.put("dataList", dataSourcesMapper.findDataSourceByIllegalId(id));//获取数据源
		map.put("windowList", windowsMapper.findWindowsByIllegalId(id));//获取固定窗口
		System.out.println("违章类型详情：-->"+map.toString());
		return map;
	}

	@Override
	@Transactional
	public Integer delIllegalTypeById(Integer id) {
		return illegalsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Integer insertIllegals(Illegals record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer updateIllegals(Illegals record) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Illegals> findIllegals(Illegals illegals) {
		return illegalsMapper.findIllegals(illegals);
	}

	@Override
	public int findIllegalsCount(Illegals illegals) {
		return illegalsMapper.findIllegalsCount(illegals);
	}

	@Override
	public boolean findIllegalsTypeByName(String illegalName) {
		Illegals record=illegalsMapper.findIllegalsTypeByName(illegalName);
		//判断是否存在该违章类型
		if(record!=null){
			return true;
		}
		return false;
	}

	@Override
	public boolean addIllegalTypes(Illegals illegals, MultipartFile[] files, String[] filed, String dataSources,
			String[] addField, String basePath, Integer[] windowIds) {
		illegals.setTime(new Date());
		illegals.setUpdateTime(new Date());
		illegalsMapper.insertSelective(illegals);
		int id=illegals.getId();
		boolean flag=true;
		System.out.println("id---------------->"+id);
		if(id>0){
			System.out.println("ILLLLLLL----->"+illegals.toString());
			//保存文件
			if(files!=null){
				for(MultipartFile file:files){
					try {
						String fileName = file.getOriginalFilename();
						String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
						if (fileType.equalsIgnoreCase("bat") || fileType.equalsIgnoreCase("exe") || fileType.equalsIgnoreCase("js")
								|| fileType.equalsIgnoreCase("com") || fileType.equalsIgnoreCase("cmd")
								|| fileType.equalsIgnoreCase("dll")) {
							throw new RuntimeException("系统不允许上传.bat/.exe/.js/.com等格式的文件。");
						}
						// flag=uploadFileUtils.saveFile(file, basePath,fileName,fileType);
							String path = basePath;
							File newFile = new File(path);
							if (!newFile.isDirectory()) {
								newFile.mkdirs();
							}
							System.out.println("basePath-->"+basePath);
							System.out.println("newFile-->"+newFile);
							// 文件保存路径
							// 转存文件
							file.transferTo(new File(path+ "/" + fileName));
							
							Files iFile = new Files();
							iFile.setUploadDate(new Date());
							iFile.setOriginalName(fileName);
							iFile.setType(fileType);
							iFile.setIllegalId(id);
							iFile.setUploadBy(UserUtils.getUser().getNum());
							iFile.setRemarks1(basePath);
							System.out.println("ifile-->" + iFile.toString());
							filesMapper.insertSelective(iFile);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			//违章查询状态下
			if(illegals.getSearchStatus()>0){
			//保存查询字段
			if(filed!=null){
			for(String fd:filed){
				String[] s=fd.split(",");
				//拼接查询字段记录
				Fields record=new Fields();
				record.setFieldZname(s[0]);
				record.setFieldEname(s[1]);
				record.setIllegalId(id);
				int fs=fieldsMapper.insertSelective(record);
			 }
			}
			//保存数据源
			System.out.println("数据源---------》"+dataSources);
			if(dataSources!=null){
				String[] s=dataSources.split(",");
				//拼接查询字段记录
				DataSources record=new DataSources();
				record.setDatasourceZname(s[0]);
				record.setDatasourceEname(s[1]);
				record.setIllegalId(id);
				dataSourcesMapper.insertSelective(record);
			
			 }
			}
			//固定处理窗口状态下
			if(illegals.getWindowStatus()>0){
				if(windowIds!=null){
				for(Integer windowId:windowIds){
					//插入新数据
					Map map=new HashMap(8);
					map.put("windowId",windowId);
					map.put("illegalTypeId",id);
					int iw=illegalsMapper.addIllegalAndWindow(map);
					
				 }
				}
			}
			//补充字段状态
			if(illegals.getAdDataStatus()>0){
			//保存补充字段
				if(addField!=null){
				for(String ad:addField){
					System.out.println("补充字段---------》"+ad);
					String[] s=ad.split(",");
					//拼接查询字段记录
					AddFields record=new AddFields();
					record.setAddZname(s[0]);
					record.setAddEname(s[1]);
					record.setIllegalId(id);
					addFieldsMapper.insertSelective(record);
				 }
				}
			}
			
		}
		
		return flag;
	}

	@Override
	public List<Illegals> findAllIllegals() {
		return illegalsMapper.findAllIllegals();
	}

}
