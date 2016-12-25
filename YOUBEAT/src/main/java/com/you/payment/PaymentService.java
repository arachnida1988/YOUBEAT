package com.you.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class PaymentService {

	@Autowired
	private PaymentDAO paymentDAO;
}
