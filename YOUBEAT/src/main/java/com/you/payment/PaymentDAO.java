package com.you.payment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "PaymentMapper.";
	
	public int paymentAdd(PaymentDTO paymentDTO) throws Exception {
		return this.sqlSession.insert(namespace+"paymentAdd", paymentDTO);
	}
	
	public List<PaymentDTO> paymentList(PaymentDTO paymentDTO) throws Exception {
		return this.sqlSession.selectList(namespace+"paymentList", paymentDTO);
	}
}
