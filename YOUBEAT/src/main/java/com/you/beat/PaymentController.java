package com.you.beat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.you.payment.PaymentDTO;
import com.you.payment.PaymentService;

@Controller
@RequestMapping(value="/payment")
public class PaymentController {
	
	@Autowired
	private PaymentService pService;
	
	// 체크아웃 페이지
	@RequestMapping(value="/checkout", method=RequestMethod.GET)
	public String checkout(PaymentDTO paymentDTO, Model model) {
		return this.pService.checkout(paymentDTO, model);
	}
	
	// 결제 완료
	@RequestMapping(value="/paymentAdd", method=RequestMethod.POST)
	public String paymentAdd(PaymentDTO paymentDTO, Model model, RedirectAttributes rd) {
		return this.pService.paymentAdd(paymentDTO, model, rd);
	}
}
