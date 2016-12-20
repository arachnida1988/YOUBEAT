package com.you.album;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.you.music.MusicDAO;
import com.you.util.PageMaker;

@Service
public class AlbumService {

	@Autowired
	private AlbumDAO albumDAO;
	@Autowired
	private MusicDAO musicDAO;
	
	// Album 등록
	public void albumInsert(AlbumDTO albumDTO, Model model) {
		int result = 0;
		String message = "";
		try {
			result = this.albumDAO.albumInsert(albumDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result > 0) {
			message = "앨범 등록 완료";
		} else {
			message = "앨범 등록 실패";
		}
		model.addAttribute("message", message);
	}
	
	// Album 리스트
	public void albumList(int curPage, int perPage, Model model) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		List<AlbumDTO> aList = null;
		
		try {
			// 앨범의 총 갯수 가져와서 page 만들어주기
			pageMaker.makePage(this.albumDAO.albumTotalCount());
			// 앨범 리스트 가져오기
			aList = this.albumDAO.albumList(pageMaker);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("list", aList);
	}
	
	// Album VIEW
	public void albumView(int anum, Model model) {
		AlbumDTO albumDTO = null;	
		try {
			albumDTO = this.albumDAO.albumView(anum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("view", albumDTO);
	}
	
	// Album 변경
	public void albumUpdate(AlbumDTO albumDTO, RedirectAttributes rd) {
		int result = 0;
		String message = "";
		try {
			result = this.albumDAO.albumUpdate(albumDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result > 0) {
			message = "앨범 정보 수정 완료";
		} else {
			message = "앨범 정보 수정 실패";
		}
		rd.addFlashAttribute("message", message);		
	}
	
	// Album 삭제
	// 삭제시 Music의 anum들도 같이 삭제 되어야 한다.
	@Transactional
	public void albumDelete(int anum, RedirectAttributes rd) {
		int result = 0;
		String message = "";
		try {
			// Album 삭제
			result = this.albumDAO.albumDelete(anum);
			// Music도 같이 삭제 되어야한다.
			result = this.musicDAO.musicsDelete(anum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result > 0) {
			message = "앨범 삭제 완료";
		} else {
			message = "앨범 삭제 실패";
		}
		rd.addFlashAttribute("message", message);			
	}
}
	

