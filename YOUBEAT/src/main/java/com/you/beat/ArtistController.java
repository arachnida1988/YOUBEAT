package com.you.beat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.you.artist.ArtistService;

@Controller
@RequestMapping(value="/artist")
public class ArtistController {
	
	@Autowired
	private ArtistService aService;
	
	// Artist - 페이지 이동 
	
	// Artist Insert 처리
	
	// Artist View
	
	// Artist Update
	
	// Artist Delete
	
	// Artist List
}
