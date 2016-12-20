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

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	private int cfNumber = 0;	// ���� ��ȣ�� ���� ���� ó��
	List<String> memids = null;	// �̸��Ϸ� ������ ID�� ����ִ� List

	// ID �ߺ��˻�
	public String memberIdCheck(String memid, Model model) {
		int result = 0;	// ID üũ ����
		try {
			// ID�� �ߺ��̸� �� ��
			if(memid.equals(this.memberDAO.memberIdCheck(memid))) {
				// 1�� ����
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
		
		// ȸ��ó�� ���� ���ֱ�
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
			message = "�α��� �Ϸ�!";
			path = "redirect:/";
		} else {
			message = "ID�� PassWord�� ��ġ���� �ʽ��ϴ�.";
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
			message = "ȸ�� Ż�� �Ϸ�";
			path = "redirect:/";
			session.invalidate();
		} else {
			message = "ȸ�� Ż�� ����";
			path = "redirect:/member/memberView";
		}
		rd.addFlashAttribute("message", message);
		return path;
	}
	
	// �̸��Ϸ� ������ȣ �����ϴ� �޼���
	public String memberSendtoConfirmNumber(MemberDTO memberDTO, 
			String type, Model model) {
		int result = 0;			// SQL ������ �����
		try {
			// ������Ʈ �κп��� ��û��
			if(type.equals("update")) {
				// ID�� PW�� 
				memberDTO = this.memberDAO.memberLogin(memberDTO);
			// find �κп��� ��û��	
			} else if(type.equals("find")){
				// ID�� E-MAIL
				memberDTO = this.memberDAO.memberGetPassword(memberDTO);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ȸ���� �����ϸ�
		if(memberDTO != null) {
			String email = memberDTO.getMememail();
            // ���� ������ �Լ�
            this.messageSendtoEmail(email, "requestNumber");
            // ��� ó��
            result = 1;
		}
		model.addAttribute("result", result);
		return "member/memberResult";
	}
	
	// Update
	// DAO 2�� ó���ϱ� ����..
	@Transactional
	public String memberUpdate(MemberDTO memberDTO, Model model) {
		int result = 0;
		try {
			result = this.memberDAO.memberUpdate(memberDTO);
			// ID�� PW�� ���ؼ� �����;� ��..
			memberDTO = this.memberDAO.memberLogin(memberDTO);
		} catch (Exception e) {
			memberDTO = null;
			e.printStackTrace();
		}
		model.addAttribute("member", memberDTO);
		model.addAttribute("result", result);
		return "member/memberResult";
	}
	
	// Find id - �̸��Ϸ� ������
	public String memberIdSendtoEmail(String mememail, Model model) {
		int result = 0;
		try {
			// �̸��� �����ϴ��� ���ϱ� ���ؼ�
			memids = this.memberDAO.memberIdSendtoEmail(mememail);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ID�� �����ϸ�
		if(memids != null) {
            // ���� ������ �Լ�
            this.messageSendtoEmail(mememail, "memberID");
            // ���ó��
            result = 1;
		}
        model.addAttribute("result", result);
        return "member/memberResult";
	}
	
	// Find PW - ��й�ȣ ����
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
	
	// ��й�ȣ ����
	public String memberUpdatePassword(MemberDTO memberDTO, Model model) {
		int result = 0;
		try {
			result = this.memberDAO.memberUpdatePassword(memberDTO);
			// ID�� PW�� ���ؼ� �����;� ��..
			memberDTO = this.memberDAO.memberLogin(memberDTO);
		} catch (Exception e) {
			memberDTO = null;
			e.printStackTrace();
		}
		model.addAttribute("member", memberDTO);
		model.addAttribute("result", result);
		return "member/memberResult";		
	}
	
	// �̸��Ϸ� �����ϴ� �޼��� 
	public void messageSendtoEmail(String email, String type) {
        Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");     // gmail�� ������ true ����
        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp ���� �ּ�
        p.put("mail.smtp.auth","true");                 // gmail�� ������ true ����
        p.put("mail.smtp.port", "587");                 // gmail ��Ʈ
        
        Authenticator auth = new MyAuthentication();   
        //session ���� ��  MimeMessage����
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
        
        try{
            //���������ð�
            msg.setSentDate(new Date());
             
            InternetAddress from = new InternetAddress();
            from = new InternetAddress("YOUBEAT<sendmailtest13@gmail.com>");
             
            // �̸��� �߽���
            msg.setFrom(from);
             
            // �̸��� ������
            InternetAddress to = new InternetAddress(email);
            msg.setRecipient(Message.RecipientType.TO, to);
            
            // ���� ��ȣ�� ���
            if(type.equals("requestNumber")) {            	
            	// �̸��� ����
                // Random �Լ��� �̿��ؼ� 6�ڸ� ���� ��ȣ ������
                Random random = new Random();
                cfNumber = random.nextInt(900000) + 100000;
            	msg.setSubject("YOUBEAT���� ���� ������ȣ�Դϴ�.", "UTF-8");
            	// �̸��� ���� 
            	msg.setText("������ȣ : "+this.cfNumber, "UTF-8");
            	System.out.println("�۽� ������ȣ : "+this.cfNumber);
            	
            // ȸ�� ID�� �ִ� ���	
            } else if(type.equals("memberID")) {
                // ID �Ϻκ� secret *** ó���ϱ�
                // ID�� ������ ������ �ֱ� ����
                String [] ids = new String[memids.size()];
            	// ���̵� �������� ��츦 ó���ϱ� ���ؼ�
            	String sendids = "";
                for(int i=0; i<memids.size(); i++) {
                	ids[i] = "";
                	// ���� ID�� ���� ���ϱ�
                	int id_length = memids.get(i).length();
                	// ù��°�ڸ����� 4��° �ڸ����� ���ϱ�
                	ids[i] += memids.get(i).substring(0, id_length-6);
                	// ***~ ó������ �ڸ��� ���� ���ϱ�
                	int secretLength = memids.get(i).substring(id_length-5, id_length-1).length();
                	// �ױ��̸�ŭ
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
            	// �̸��� ����
            	msg.setSubject("YOUBEAT���� ���� ȸ������ ID�Դϴ�.", "UTF-8");
            	// �̸��� ���� 
            	msg.setText("ȸ������ ID : "+sendids, "UTF-8");           	
            }
            // �̸��� ��� 
            msg.setHeader("content-Type", "text/html");
             
            //���Ϻ�����
            javax.mail.Transport.send(msg);
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }				
	}
	
	// ������ȣ Ȯ���� ���� �޼���
	public String memberCheckNumber(int confirmNumber, Model model) {
		int result = 0;
		// ���� ��ȣ�� �´ٸ�
		System.out.println("���� ������ȣ : "+confirmNumber);
		if(this.cfNumber == confirmNumber) {
			result = 1;	// ������� 1�� �ְ�
		}
		this.cfNumber = 0;	// 0���� �ʱ�ȭ
		model.addAttribute("result", result);
		return "member/memberResult";
	}	
	
	// ������ �̸��� ���� ���� ���ִ� ���� Ŭ����
	class MyAuthentication extends Authenticator {      
	    PasswordAuthentication pa;
	    
	    public MyAuthentication(){ 
	        String id = "sendmailtest13";    // ���� ID
	        String pw = "asdf94115";         // ���� ��й�ȣ
	        
	        // ID�� ��й�ȣ�� �Է��Ѵ�.
	        pa = new PasswordAuthentication(id, pw);
	    }
	 
	    // �ý��ۿ��� ����ϴ� ��������
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }
	}	
}
