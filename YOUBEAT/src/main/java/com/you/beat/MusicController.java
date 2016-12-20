package com.you.beat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.you.music.MusicDTO;
import com.you.music.MusicService;

@Controller
@RequestMapping(value="/music")
public class MusicController {

	@Autowired
	private MusicService mService;
	
	// 음악 등록 Insert
	@RequestMapping(value="/musicInsert", method=RequestMethod.POST)
	public String musicInsert(MusicDTO musicDTO, @RequestParam int saveCounts, 
			Model model) {
		this.mService.musicInsert(musicDTO, saveCounts, model);
		return "album/albumResult";	// 경로 설정 해주기
	}
	
	// List
	@RequestMapping(value="/musicList")
	public void musicList(@RequestParam(defaultValue="1")int curPage, 
			@RequestParam(defaultValue="10")int perPage, Model model) {

	}
	
	// View
	public void musicView(@RequestParam int mnum, Model model) {
		
	}
	
	// Update
	public String musicUpdate(MusicDTO musicDTO, RedirectAttributes rd) {
		return "redirect:/";
	}
	
	// Delete
	public String musicDelete(@RequestParam int mnum, RedirectAttributes rd) {
		return "redirect:/";
	}
}
