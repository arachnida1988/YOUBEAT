package com.you.beat;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.you.mp3.Mp3DTO;
import com.you.mp3.Mp3Service;

@Controller
@RequestMapping(value = "/mp3")
public class Mp3Controller {
	@Autowired
	private Mp3Service mp3Service;
	
	@RequestMapping(value = "/mp3main")
	public void mp3main(){}
	
	@RequestMapping(value = "/mp3Write", method=RequestMethod.GET)
	public void mp3Write(){}
	
	@RequestMapping(value = "/mp3Write", method=RequestMethod.POST)
	public String mp3Write(Mp3DTO mp3dto, MultipartHttpServletRequest mr, HttpSession session){
		mp3Service.mp3Write(mp3dto, mr, session);
		return "redirect:/mp3/mp3main";
	}
	
	@RequestMapping(value = "/mp3List")
	public String mp3List(Model model){
		mp3Service.mp3List(model);
		return "/mp3/mp3List";
	}
	
}
