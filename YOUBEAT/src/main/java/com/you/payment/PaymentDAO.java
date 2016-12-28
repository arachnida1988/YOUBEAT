package com.you.payment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.you.util.PageMaker;

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
	
	// 페이지 처리된 결제 내역 리스트
	public List<PaymentDTO> paymentPageList(PageMaker pageMaker, 
			String pid) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("pid", pid);
		map.put("page", pageMaker);
		return this.sqlSession.selectList(namespace+"paymentPageList", map);
	}
	
	public int paymentTotalCount(String pid) throws Exception {
		return this.sqlSession.selectOne(namespace+"paymentTotalCount", pid);
	}
	
	public PaymentDTO paymentView(int pnum) throws Exception {
		return this.sqlSession.selectOne(namespace+"paymentView", pnum);
	}
}
