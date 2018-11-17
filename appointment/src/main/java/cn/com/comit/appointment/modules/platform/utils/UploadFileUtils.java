package cn.com.comit.appointment.modules.platform.utils;

import java.io.File;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import cn.com.comit.appointment.modules.platform.dao.FilesMapper;
import cn.com.comit.appointment.modules.platform.entity.Files;

/**
 * 上传文件工具类
 * 
 * @author ASUS
 *
 */
@Component
public class UploadFileUtils {

	@Autowired
	private FilesMapper filesMapper;

	public Files upload(String basePath, MultipartFile file, String fileLabel) throws Exception {
		String fileName = file.getOriginalFilename();
		String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
		if (fileType.equalsIgnoreCase("bat") || fileType.equalsIgnoreCase("exe") || fileType.equalsIgnoreCase("js")
				|| fileType.equalsIgnoreCase("com") || fileType.equalsIgnoreCase("cmd")
				|| fileType.equalsIgnoreCase("dll")) {
			throw new RuntimeException("系统不允许上传.bat/.exe/.js/.com等格式的文件。");
		}
		String path = basePath;
		File newFile = new File(path);
		if (!newFile.isDirectory()) {
			newFile.mkdirs();
		}
		File resultFile = new File(path + "/" + fileName);
		file.transferTo(resultFile);
		Files iFile = new Files();
		iFile.setUploadDate(new Date());
		iFile.setOriginalName(fileName);
		iFile.setType(fileType);
		System.out.println("ifile-->" + iFile.toString());
		int ids = filesMapper.insertSelective(iFile);
		System.out.println("id----->" + ids);
		System.out.println("idss----->" + iFile.getId());
		return iFile;
	}

	public Files uploads(String basePath, MultipartFile file, Integer id) throws Exception {
		String fileName = file.getOriginalFilename();
		String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
		if (fileType.equalsIgnoreCase("bat") || fileType.equalsIgnoreCase("exe") || fileType.equalsIgnoreCase("js")
				|| fileType.equalsIgnoreCase("com") || fileType.equalsIgnoreCase("cmd")
				|| fileType.equalsIgnoreCase("dll")) {
			throw new RuntimeException("系统不允许上传.bat/.exe/.js/.com等格式的文件。");
		}
		String path = basePath;
		File newFile = new File(path);
		if (!newFile.isDirectory()) {
			newFile.mkdirs();
		}
		File resultFile = new File(path + "/" + fileName);
		file.transferTo(resultFile);
		Files iFile = new Files();
		iFile.setUploadDate(new Date());
		iFile.setOriginalName(fileName);
		iFile.setType(fileType);
		System.out.println("ifile-->" + iFile.toString());
		int ids = filesMapper.insertSelective(iFile);
		System.out.println("id----->" + ids);
		System.out.println("idss----->" + iFile.getId());
		return iFile;
	}

	/***
	 *  保存文件    
	 *  @param file    
	 *  @return    
	 */
	public boolean saveFile(MultipartFile file, String basePath, String fileName, String fileType) {
		// 判断文件是否为空
		if (!file.isEmpty()) {
			try {
				String path = basePath;
				File newFile = new File(path);
				if (!newFile.isDirectory()) {
					newFile.mkdirs();
				}
				// 文件保存路径
				// 转存文件
				file.transferTo(new File(path+ "/" + fileName));
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

}
