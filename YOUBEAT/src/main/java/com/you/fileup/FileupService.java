package com.you.fileup;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class FileupService {
	
	@Autowired
	private FileupDAO fileupDAO;
	
	public void fileupWrite(FileupDTO fileupDTO, MultipartHttpServletRequest mr, HttpSession session){
		System.out.println("------------");
		String path = session.getServletContext().getRealPath("resources/upload");
		MultipartFile mf = mr.getFile("file");
		String fileName = UUID.randomUUID().toString()+"_"+mf.getOriginalFilename();
		File f = new File(path, fileName);
		try {
			mf.transferTo(f);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		fileupDTO.setFfilename(fileName);
		fileupDTO.setForiginalname(mf.getOriginalFilename());
		int result = fileupDAO.fileupWrite(fileupDTO);
		System.out.println(""+result);
	}
	
	public void fileupList(FileupDTO fileupDTO, Model model){
		model.addAttribute("fileupList", fileupDAO.fileupList(fileupDTO));
	}
	
	public void fileupMP3(Model model){
		model.addAttribute("fileupList", fileupDAO.fileupMP3());
	}
	
	
}