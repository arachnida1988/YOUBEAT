package com.you.beat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class MainSlideController {
	
	@Controller
	@RequestMapping(value="/template")
	public class MSlideController {
		
		@RequestMapping(value="/youbeat", method={RequestMethod.POST , RequestMethod.GET})
		public String slider(){
			return "template/youbeat";
		}
		
	}


}