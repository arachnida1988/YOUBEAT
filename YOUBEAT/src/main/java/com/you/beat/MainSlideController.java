package com.you.beat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/template")
public class MainSlideController {
	
	@RequestMapping(value="/youbeat", method=RequestMethod.GET)
	public String slider(){
		return "template/youbeat";
	}	
}