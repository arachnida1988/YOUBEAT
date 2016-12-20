package com.you.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	// write
	public void boardWrite(BoardDTO boardDTO, RedirectAttributes rd) {
		int result = 0;
		String message = "";
		try {
			result = this.boardDAO.boardWrite(boardDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result > 0) {
			message = "글 등록 완료";
		} else {
			message = "글 등록 실패";
		}
		rd.addFlashAttribute("message", message);
	}
	
	// update
	public void boardUpdate(BoardDTO boardDTO, RedirectAttributes rd) {

	}
	
	// reply
	public void boardReply(BoardDTO boardDTO, RedirectAttributes rd) {

	}
	
	// Delete
	public void boardDelete(@RequestParam int bnum, RedirectAttributes rd) {

	}
	
	// List
	public void boardList(@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="10") int perPage, Model model) {
		
	}
	
	// View
	public void boardView(@RequestParam int bnum, Model model) {
		
	}
}
