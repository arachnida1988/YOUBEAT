package com.you.mp3;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public class Mp3Service {
	
	@Autowired
	private Mp3DAO mp3dao;
	
	public void mp3Write(Mp3DTO mp3dto, MultipartHttpServletRequest mr, HttpSession session){
		List<Mp3DTO> mp3names = new ArrayList<Mp3DTO>();
		List<MultipartFile> files = mr.getFiles("mp3");
		String path = session.getServletContext().getRealPath("resources/upload");
		for(int i=0;i<files.size();i++){
			MultipartFile mf = files.get(i);
			System.out.println(mf.getOriginalFilename());
			String mp3name = mp3dto.getArtist()+"_"+mp3dto.getAlbumname()+"_"+mf.getOriginalFilename();
			System.out.println(mp3name);
			File f = new File(path, mp3name);
			String title = mf.getOriginalFilename().substring(0,mf.getOriginalFilename().length()-4);
			try {
				mf.transferTo(f);
			}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Mp3DTO mp3dto2 = new Mp3DTO();
			mp3dto2.setAlbumname(mp3dto.getAlbumname());
			mp3dto2.setArtist(mp3dto.getArtist());
			mp3dto2.setTitle(title);
			mp3dto2.setMoriginalname(mf.getOriginalFilename());
			mp3dto2.setMfilename(mp3name);
			mp3names.add(mp3dto2);
		}
			mp3dao.mp3Write(mp3names);
	}
	
	public List<Mp3DTO> mp3List(Model model){
		/*model.addAttribute("mp3", mp3dao.mp3List());*/
		List<Mp3DTO> ar = new ArrayList<Mp3DTO>();
		try {
			ar = mp3dao.mp3List();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ar;
	}
}
