package com.you.member;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "MemberMapper.";
	
	// Join
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		return this.sqlSession.insert(namespace+"memberJoin", memberDTO);
	}
	
	// ID check
	public String memberIdCheck(String memid) throws Exception {
		return this.sqlSession.selectOne(namespace+"memberIdCheck", memid);
	}
	
	// Login
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception {
		return this.sqlSession.selectOne(namespace+"memberLogin", memberDTO);
	}
	
	// GetPassword - id, email
	public MemberDTO memberGetPassword(MemberDTO memberDTO) throws Exception {
		return this.sqlSession.selectOne(namespace+"memberGetPassword", memberDTO);
	}
	
	// Delete
	public int memberDelete(MemberDTO memberDTO) throws Exception {
		return this.sqlSession.delete(namespace+"memberDelete", memberDTO);
	}
	
	// Update
	public int memberUpdate(MemberDTO memberDTO) throws Exception {
		return this.sqlSession.update(namespace+"memberUpdate", memberDTO);
	}
	
	// ID SendtoEmail - 여러번 가입하고, 같은 메일이 있을수 있기때문에 List
	public List<String> memberIdSendtoEmail(String mememail) throws Exception {
		return this.sqlSession.selectList(namespace+"memberIdSendtoEmail", mememail);
	}
	
	// PW 변경
	public int memberUpdatePassword(MemberDTO memberDTO) throws Exception {
		return this.sqlSession.update(namespace+"memberUpdatePassword", memberDTO);
	}
	
	// memberAccount
	public MemberDTO memberAccount(MemberDTO memberDTO) throws Exception {
		return this.sqlSession.selectOne(namespace+"memberAccount", memberDTO);
	}
}
