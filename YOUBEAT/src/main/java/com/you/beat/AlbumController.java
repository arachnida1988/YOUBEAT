package com.you.beat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.you.album.AlbumDTO;
import com.you.album.AlbumService;

@Controller
@RequestMapping(value="/album")
public class AlbumController {
	
	@Autowired
	private AlbumService aService;
	
	// page 이동
	@RequestMapping(value="/albumInsert", method=RequestMethod.GET)
	public void albumInsert() {
	}
	
	// Album 등록
	@RequestMapping(value="/albumInsert", method=RequestMethod.POST)
	public String albumInsert(AlbumDTO albumDTO, Model model) {
		this.aService.albumInsert(albumDTO, model);
		return "album/albumResult";
	}
	
	// Album List
	@RequestMapping(value="/albumList")
	public void albumList(@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="10") int perPage, Model model) {
		this.aService.albumList(curPage, perPage, model);
	}
	
	// Album View
	@RequestMapping(value="/albumView")
	public void albumView(@RequestParam int anum, Model model) {
		this.aService.albumView(anum, model);
	}
	
	// Album Update
	public String albumUpdate(AlbumDTO albumDTO, RedirectAttributes rd) {
		this.aService.albumUpdate(albumDTO, rd);
		return "redirect:/"; // 경로 수정하기
	}
	
	// Album 삭제
	public String albumDelete(@RequestParam int anum, RedirectAttributes rd) {
		this.aService.albumDelete(anum, rd);
		return "redirect:/";	// 경로 수정 필요함
	}
}

