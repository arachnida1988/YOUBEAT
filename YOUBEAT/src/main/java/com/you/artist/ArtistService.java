package com.you.artist;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ArtistService {
	
	@Autowired
	private ArtistDAO artistDAO;
	
	// Artist Insert
	public void artistInsert(ArtistDTO artistDTO, Model model) {
		int result = 0;
		String message = "";
		
		try {
			result = this.artistDAO.artistInsert(artistDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result > 0) {
			message = "아티스트 등록 완료";
		} else {
			message = "아티스트 등록 실패";
		}
		model.addAttribute("message", message);
	}
	// Artist View
	
	// Artist Update
	
	// Artist Delete
	
	// Artist List
}
