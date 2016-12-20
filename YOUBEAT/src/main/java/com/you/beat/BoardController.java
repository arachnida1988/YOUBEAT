package com.you.beat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.you.board.BoardDTO;
import com.you.board.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	// write
	public String boardWrite(BoardDTO boardDTO, RedirectAttributes rd) {
		this.bService.boardWrite(boardDTO, rd);
		return "redirect:/";
	}
	
	// update
	public String boardUpdate(BoardDTO boardDTO, RedirectAttributes rd) {
		return "redirect:/";
	}
	
	// reply
	public String boardReply(BoardDTO boardDTO, RedirectAttributes rd) {
		return "redirect:/";
	}
	
	// Delete
	public String boardDelete(@RequestParam int bnum, RedirectAttributes rd) {
		return "redirect:/";
	}
	
	// List
	public void boardList(@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="10") int perPage, Model model) {
		
	}
	
	// View
	public void boardView(@RequestParam int bnum, Model model) {
		
	}
}
