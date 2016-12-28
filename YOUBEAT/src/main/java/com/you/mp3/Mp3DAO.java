package com.you.mp3;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Mp3DAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "Mp3Mapper.";
	
	public void mp3Write(List<Mp3DTO> mp3names){
		int result=0;
		for(Mp3DTO m : mp3names){
			result = result + sqlSession.insert(namespace+"mp3Write", m);
		}
		System.out.println(result + " 개 성공");
	}
	
	public List<Mp3DTO> mp3List() throws Exception{
		return sqlSession.selectList(namespace+"mp3List");
	}
	
	public Mp3DTO mp3View(Mp3DTO mp3DTO) throws Exception {
		return sqlSession.selectOne(namespace+"mp3View", mp3DTO);
	}
}
