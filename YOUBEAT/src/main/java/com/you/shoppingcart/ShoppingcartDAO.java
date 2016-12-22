package com.you.shoppingcart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShoppingcartDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "ShoppingcartMapper.";
	
	// 장바구니 등록하기전에 존재하는지 알아보기 위한 리스트 가져오기 - 아이디,카테고리
	public List<ShoppingcartDTO> shoppingcartList(ShoppingcartDTO shoppingcartDTO) 
			throws Exception {
		return this.sqlSession.selectList(namespace+"shoppingcartList", shoppingcartDTO);
	}
	
	// 장바구니에 등록
	public int shoppingcartAdd(ShoppingcartDTO shoppingcartDTO) throws Exception {
		return this.sqlSession.insert(namespace+"shoppingcartAdd", shoppingcartDTO);
	}
	
	// 장바구니에서 삭제
	public int shoppingcartDel(int snum) throws Exception {
		return this.sqlSession.delete(namespace+"shoppingcartDel", snum);
	}
}
