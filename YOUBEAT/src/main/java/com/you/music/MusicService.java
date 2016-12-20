package com.you.music;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.you.album.AlbumDAO;
import com.you.album.AlbumDTO;
import com.you.util.PageMaker;

@Service
public class MusicService {

	@Autowired
	private MusicDAO musicDAO;
	@Autowired
	private AlbumDAO albumDAO;
	
	// Music 등록
	@Transactional
	public void musicInsert(MusicDTO musicDTO, int saveCounts, Model model) {
		int result = 0;
		String message = "";
		try {
			// 1 - 1 앨범의 번호 가져오기
			int anum = this.albumDAO.albumMaxNum();
			// 1 - 2 앨범 번호 Setting
			musicDTO.setAnum(anum);
			// 2 - 1 앨범의 정보를 가져와서
			AlbumDTO albumDTO = this.albumDAO.albumView(anum);
			// 2 - 2 앨범의 발매 날짜 Setting
			musicDTO.setMdate(albumDTO.getAdate());
			// music 등록
			result = this.musicDAO.musicInsert(musicDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result > 0) {
			message = "음악 등록 완료";
		} else {
			message = "음악 등록 실패";
		}
		model.addAttribute("message", message);
	}
	
	// Music 리스트
	public void musicList(int curPage, int perPage, Model model) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
	}
	
	// Music View
	public void musicView(int mnum, Model model) {
		
	}
	
	// Music 변경 
	public void musicUpdate(MusicDTO musicDTO, RedirectAttributes rd) {
		
	}
	
	// Music 하나만 삭제
	public void musicDelete(int mnum, RedirectAttributes rd) {
		
	}
}
