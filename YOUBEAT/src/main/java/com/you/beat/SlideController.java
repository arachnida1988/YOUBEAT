package com.you.beat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/slider")
public class SlideController {
	
	@RequestMapping(value="/sliderTest", method={RequestMethod.POST , RequestMethod.GET})
	public String slider(){
		return "slider/sliderTest";
	}
	
}
