package com.you.beat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/popupTest")
public class ModalPopupController {
	
	@RequestMapping(value="/test")
	public String Test1(){
		
		return"popupTest/test";
	}

}
