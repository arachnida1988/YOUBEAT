package com.you.beat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.you.fileup.FileupDTO;
import com.you.fileup.FileupService;

@Controller
@RequestMapping(value = "/fileup")
public class FileupController {
		
		@Autowired
		private FileupService fileupService;
		
		@RequestMapping(value = "fileupStream")
		public void fileupsample(){
		}
		
		@RequestMapping(value = "/fileupWrite", method=RequestMethod.GET)
		public void fileupWrite(){}
		
		@RequestMapping(value = "/fileupWrite", method=RequestMethod.POST)
		public String fileupWrite(FileupDTO fileupDTO, MultipartHttpServletRequest mr, HttpSession session){	
			System.out.println("post");
			fileupService.fileupWrite(fileupDTO, mr, session);
			return "redirect:/fileup/fileupWrite";
		}
		
		@RequestMapping(value = "/fileupList")
		public String fileupList(FileupDTO fileupDTO, Model model){
			fileupService.fileupList(fileupDTO, model);
			return "/fileup/fileupList";
		}
		
		@RequestMapping(value = "/fileupMP3")
		public String fileupMP3(Model model){
			fileupService.fileupMP3(model);
			return "/fileup/fileupMP3";
		}
		
	
}
