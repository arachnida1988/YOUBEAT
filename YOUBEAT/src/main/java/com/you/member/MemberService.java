package com.you.member;

import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.you.payment.PaymentDAO;
import com.you.payment.PaymentDTO;
import com.you.util.PageMaker;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private PaymentDAO paymentDAO;
	private int cfNumber = 0;	// 인증 번호를 위한 변수 처리
	List<String> memids = null;	// 이메일로 보내줄 ID를 담고있는 List

	// ID 중복검사
	public String memberIdCheck(String memid, Model model) {
		int result = 0;	// ID 체크 변수
		try {
			// ID가 중복이면 일 때
			if(memid.equals(this.memberDAO.memberIdCheck(memid))) {
				// 1로 세팅
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("result", result);
		return "member/memberResult";
	}
	
	// Join
	public String memberJoin(MemberDTO memberDTO, Model model) {
		int result = 0;
		
		// 회원처리 세팅 해주기
		memberDTO.setMemrating("member");
		try {
			result = this.memberDAO.memberJoin(memberDTO);
			System.out.println("IN_RESULT : "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("OUT_RESULT : "+result);
		model.addAttribute("result", result);
		return "member/memberResult";
	}
	
	// Login
	public String memberLogin(MemberDTO memberDTO, Model model) {
		String path = "";
		String message = "";
		
		try {
			memberDTO = this.memberDAO.memberLogin(memberDTO);
		} catch (Exception e) {
			memberDTO = null;
			e.printStackTrace();
		}
		if(memberDTO != null) {
			message = "로그인 완료!";
			path = "template/youbeat";
		} else {
			message = "ID나 PassWord가 일치하지 않습니다.";
			path = "member/memberLogin";
		}
		model.addAttribute("message", message);
		model.addAttribute("member", memberDTO);
		return path;
	}
	
	// Delete
	public String memberDelete(MemberDTO memberDTO, 
			RedirectAttributes rd, HttpSession session) {
		int result = 0;
		String message = "";
		String path = "";
		
		try {
			result = this.memberDAO.memberDelete(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result > 0) {
			message = "회원 탈퇴 완료";
			path = "template/youbeat";
			session.invalidate();
		} else {
			message = "회원 탈퇴 실패";
			path = "redirect:/member/memberView";
		}
		rd.addFlashAttribute("message", message);
		return path;
	}
	
	// 이메일로 인증번호 전송하는 메서드
	public String memberSendtoConfirmNumber(MemberDTO memberDTO, 
			String type, Model model) {
		int result = 0;			// SQL 쿼리문 결과값
		try {
			// 업데이트 부분에서 요청시
			if(type.equals("update")) {
				// ID와 PW로 
				memberDTO = this.memberDAO.memberLogin(memberDTO);
				
			// find 부분에서 요청시	
			} else if(type.equals("find")){
				// ID와 E-MAIL
				memberDTO = this.memberDAO.memberGetPassword(memberDTO);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 회원이 존재하면
		if(memberDTO != null) {
			String email = memberDTO.getMememail();
            // 메일 보내는 함수
            this.messageSendtoEmail(email, "requestNumber");
            // 결과 처리
            result = 1;
		} 
		model.addAttribute("result", result);
		return "member/memberResult";
	}
	
	// Update
	// DAO 2번 처리하기 때문..
	@Transactional
	public String memberUpdate(MemberDTO memberDTO, Model model) {
		int result = 0;
		try {
			result = this.memberDAO.memberUpdate(memberDTO);
			// ID와 PW를 통해서 가져와야 함..
			memberDTO = this.memberDAO.memberLogin(memberDTO);
		} catch (Exception e) {
			memberDTO = null;
			e.printStackTrace();
		}
		model.addAttribute("member", memberDTO);
		model.addAttribute("result", result);
		return "member/memberResult";
	}
	
	// Find id - 이메일로 보내기
	public String memberIdSendtoEmail(String mememail, Model model) {
		int result = 0;
		try {
			// 이메일 존재하는지 비교하기 위해서
			memids = this.memberDAO.memberIdSendtoEmail(mememail);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ID가 존재하면
		if(memids != null) {
            // 메일 보내는 함수
            this.messageSendtoEmail(mememail, "memberID");
            // 결과처리
            result = 1;
		}
        model.addAttribute("result", result);
        return "member/memberResult";
	}
	
	// Find PW - 비밀번호 보기
	public String memberGetPassword(MemberDTO memberDTO, Model model) {
		try {
			memberDTO = this.memberDAO.memberGetPassword(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(memberDTO != null) {
			model.addAttribute("password", memberDTO.getMempw());
		} else {
			model.addAttribute("password", null);
		}
		return "member/memberPasswordResult";
	}
	
	// 비밀번호 변경
	public String memberUpdatePassword(MemberDTO memberDTO, Model model) {
		int result = 0;
		try {
			result = this.memberDAO.memberUpdatePassword(memberDTO);
			// ID와 PW를 통해서 가져와야 함..
			memberDTO = this.memberDAO.memberLogin(memberDTO);
		} catch (Exception e) {
			memberDTO = null;
			e.printStackTrace();
		}
		model.addAttribute("member", memberDTO);
		model.addAttribute("result", result);
		return "member/memberResult";		
	}
	
	// 이메일로 전송하는 메서드 
	public void messageSendtoEmail(String email, String type) {
        Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
        p.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
        p.put("mail.smtp.port", "587");                 // gmail 포트
        
        Authenticator auth = new MyAuthentication();   
        //session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
        
        try{
            //편지보낸시간
            msg.setSentDate(new Date());
             
            InternetAddress from = new InternetAddress();
            from = new InternetAddress("YOUBEAT<sendmailtest13@gmail.com>");
             
            // 이메일 발신자
            msg.setFrom(from);
             
            // 이메일 수신자
            InternetAddress to = new InternetAddress(email);
            msg.setRecipient(Message.RecipientType.TO, to);
            
            // 인증 번호의 경우
            if(type.equals("requestNumber")) {            	
            	// 이메일 제목
                // Random 함수를 이용해서 6자리 인증 번호 보내기
                Random random = new Random();
                cfNumber = random.nextInt(900000) + 100000;
            	msg.setSubject("YOUBEAT에서 보낸 인증번호입니다.", "UTF-8");
            	// 이메일 내용 
            	msg.setText("인증번호 : "+this.cfNumber, "UTF-8");
            	System.out.println("송신 인증번호 : "+this.cfNumber);
            	
            // 회원 ID를 주는 경우	
            } else if(type.equals("memberID")) {
                // ID 일부분 secret *** 처리하기
                // ID가 여러개 있을수 있기 때문
                String [] ids = new String[memids.size()];
            	// 아이디가 여러개인 경우를 처리하기 위해서
            	String sendids = "";
                for(int i=0; i<memids.size(); i++) {
                	ids[i] = "";
                	// 현재 ID의 길이 구하기
                	int id_length = memids.get(i).length();
                	// 첫번째자리부터 4번째 자리까지 더하기
                	ids[i] += memids.get(i).substring(0, id_length-6);
                	// ***~ 처리해줄 자리의 길이 구하기
                	int secretLength = memids.get(i).substring(id_length-5, id_length-1).length();
                	// 그길이만큼
                	for(int j=0; j<secretLength; j++) {
                		ids[i] += "*";
                	}
                	ids[i] += memids.get(i).substring(id_length-2, id_length);

                	if(i == (memids.size()-1)) {	            		
                		sendids += ids[i];
                	} else {
                		sendids += ids[i]+", ";
                	}
                }            	
            	// 이메일 제목
            	msg.setSubject("YOUBEAT에서 보낸 회원님의 ID입니다.", "UTF-8");
            	// 이메일 내용 
            	msg.setText("회원님의 ID : "+sendids, "UTF-8");           	
            }
            // 이메일 헤더 
            msg.setHeader("content-Type", "text/html");
             
            //메일보내기
            javax.mail.Transport.send(msg);
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }				
	}
	
	// 인증번호 확인을 위한 메서드
	public String memberCheckNumber(int confirmNumber, Model model) {
		int result = 0;
		// 인증 번호가 맞다면
		System.out.println("수신 인증번호 : "+confirmNumber);
		if(this.cfNumber == confirmNumber) {
			result = 1;	// 결과값을 1로 주고
		}
		this.cfNumber = 0;	// 0으로 초기화
		model.addAttribute("result", result);
		return "member/memberResult";
	}	
	
	// 보내는 이메일 권한 설정 해주는 내부 클래스
	class MyAuthentication extends Authenticator {      
	    PasswordAuthentication pa;
	    
	    public MyAuthentication(){ 
	        String id = "sendmailtest13";    // 구글 ID
	        String pw = "asdf94115";         // 구글 비밀번호
	        
	        // ID와 비밀번호를 입력한다.
	        pa = new PasswordAuthentication(id, pw);
	    }
	 
	    // 시스템에서 사용하는 인증정보
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }
	}
	
	// VIEW - AJAX ( memberAccount )
	public String memberAccount(MemberDTO memberDTO, Model model) {
		try {
			memberDTO = this.memberDAO.memberAccount(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("memberView", memberDTO);
		return "member/memberAccount";
	}
	
	// VIEW - AJAX ( memberBuylist ) 
	public String memberBuylist(int curPage, int perPage, 
			MemberDTO memberDTO, Model model) {
		List<PaymentDTO> paymentList = null;
		PageMaker pMaker = new PageMaker();
		pMaker.setCurPage(curPage);
		pMaker.setPerPage(perPage);
		pMaker.makeRow();
		
		try {
			pMaker.makePage(this.paymentDAO.paymentTotalCount(memberDTO.getMemid()));
			paymentList = this.paymentDAO.paymentPageList(pMaker, memberDTO.getMemid());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("page", pMaker);
		return "member/memberBuylist";
	}
	
	
	// VIEW - AJAX( MP3 LIST )
	public String memberMp3list(MemberDTO memberDTO, int pnum, Model model) {
		// PNUM의 값으로.. MP3 파일 가져오기 .. 페이지 처리
		// 1. PNUM으로 정보 가져오기 - PCATEGORYNUM으로 음악 검색
		// 앨범이면 -> 음악 DTO 접근
		// 음악이면 -> 음악 DTO 접근
		// 10개씩 뿌려줄것인지?? page 처리?? 아니면 그냥 다 뿌려줄것인지??
		
		
		return "member/memberMp3list";
	}
}
