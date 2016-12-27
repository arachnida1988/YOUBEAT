package com.you.beat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.you.member.MemberDTO;
import com.you.member.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	// Join - 페이지 이동
	@RequestMapping(value="/memberJoin", method=RequestMethod.GET)
	public void memberJoin(){}

	// Join - 중복검사 처리
	@RequestMapping(value="/memberIdCheck", method=RequestMethod.POST)
	public String memberIdCheck(@RequestParam String memid, Model model) {
		return this.mService.memberIdCheck(memid, model);
	}
	
	// Join - 회원가입 성공 페이지로 이동
	@RequestMapping(value="/memberJoinResult", method=RequestMethod.GET)
	public void memberJoinResult(){}
	
	// Join - 회원 가입 처리
	@RequestMapping(value="/memberJoin", method=RequestMethod.POST)
	public String memberJoin(MemberDTO memberDTO, Model model) {
		// mService의 경로값을 리턴받아 이동
		return this.mService.memberJoin(memberDTO, model);
	}	
	
	// Login - 페이지 이동
	@RequestMapping(value="/memberLogin", method=RequestMethod.GET)
	public void memberLogin() {}
	
	// Login 처리
	@RequestMapping(value="/memberLogin", method=RequestMethod.POST)
	public String memberLogin(MemberDTO memberDTO, Model model) {
		// mService의 경로값을 리턴받아 이동
		return this.mService.memberLogin(memberDTO, model);
	}
	
	// Logout
	@RequestMapping(value="/memberLogout")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// View 경로 이동
	@RequestMapping(value="/memberView", method=RequestMethod.GET)
	public void memberView() {}
	
	// VIEW - AJAX ( memberAccount )
	@RequestMapping(value="/memberAccount", method=RequestMethod.POST)
	public String memberAccount(MemberDTO memberDTO, Model model) {
		return this.mService.memberAccount(memberDTO, model);
	}
	
	// VIEW - AJAX ( memberBuylist ) 
	@RequestMapping(value="/memberBuylist", method=RequestMethod.POST)
	public String memberBuylist(MemberDTO memberDTO, Model model) {
		return this.mService.memberBuylist(memberDTO, model);
	}
	
	// Delete 처리
	@RequestMapping(value="/memberDelete", method=RequestMethod.POST)
	public String memberDelete(MemberDTO memberDTO, 
			RedirectAttributes rd ,HttpSession session) {
		return this.mService.memberDelete(memberDTO, rd, session);
	}
	
	// Update - 경로 이동
	@RequestMapping(value="/memberUpdate", method=RequestMethod.GET)
	public void memberUpdate() {}
	
	// Update 처리를 위한 인증 팝업창으로 이동
	@RequestMapping(value="/memberCheckPopup", method=RequestMethod.GET)
	public void memberCheckPopup() {}
	
	// Update 처리
	@RequestMapping(value="/memberUpdate", method=RequestMethod.POST)
	public String memberUpdate(MemberDTO memberDTO, Model model) {
		return this.mService.memberUpdate(memberDTO, model);
	}
	
	// Find Id 팝업창으로 이동
	@RequestMapping(value="/memberFindidPopup", method=RequestMethod.GET)
	public void memberFindidPopup() {}
	
	// Find Id - 이메일 보내기
	@RequestMapping(value="/memberIdSendtoEmail", method=RequestMethod.POST)
	public String memberIdSendtoEmail(@RequestParam String mememail, Model model) {
		return this.mService.memberIdSendtoEmail(mememail, model);
	}
	
	// Find PW 팝업창으로 이동
	@RequestMapping(value="/memberFindpwPopup", method=RequestMethod.GET)
	public void memberFindpwPopup() {}
	
	// Find PW - 비밀번호 보기
	@RequestMapping(value="/memberShowPassword", method=RequestMethod.POST)
	public String memberGetPassword(MemberDTO memberDTO, Model model) {
		return this.mService.memberGetPassword(memberDTO, model);
	}
	
	// 기존 비밀번호 변경
	@RequestMapping(value="/memberUpdatePassword", method=RequestMethod.POST)
	public String memberUpdatePassword(MemberDTO memberDTO, Model model) {
		return this.mService.memberUpdatePassword(memberDTO, model);
	}
	
	// 인증 번호 전송을 위함
	@RequestMapping(value="/memberSendtoConfirmNumber", method=RequestMethod.POST)
	public String memberSendtoConfirmNumber(MemberDTO memberDTO, 
			@RequestParam String type, Model model) {
		return this.mService.memberSendtoConfirmNumber(memberDTO, type, model);
	}
	
	// 인증번호 확인을 위함 
	@RequestMapping(value="/memberCheckNumber", method=RequestMethod.POST)
	public String memberCheckNumber(@RequestParam int confirmNumber, Model model){
		return this.mService.memberCheckNumber(confirmNumber, model);
	}	
}
