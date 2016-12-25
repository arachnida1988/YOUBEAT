package com.you.beat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.you.payment.PaymentService;

@Controller
@RequestMapping(value="/payment")
public class PaymentController {
	
	@Autowired
	private PaymentService pService;
	
	// 체크아웃 페이지
	@RequestMapping(value="/checkout", method=RequestMethod.POST)
	public String checkout(@RequestParam String memid, Model model) {
		model.addAttribute("memid", memid);
		return "payment/checkoutPage";
	}
}
