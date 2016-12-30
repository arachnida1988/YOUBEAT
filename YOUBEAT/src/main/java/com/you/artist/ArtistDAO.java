package com.you.artist;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.you.util.PageMaker;

@Repository
public class ArtistDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "ArtistMapper.";
	// 리스트 기본형
	public List<ArtistDTO> artistList() throws Exception{
		return this.sqlSession.selectList(namespace+"artistList");
	}
	
	// Artist Insert
	public int artistInsert(ArtistDTO artistDTO) throws Exception {
		return this.sqlSession.insert(namespace+"artistInsert", artistDTO);
	}
	
	// Artist View
	public ArtistDTO artistView(String arartist) throws Exception {
		return this.sqlSession.selectOne(namespace+"artistView", arartist);
	}

	// Artist Update
	
	// Artist Delete
	
	
	// 페이징 처리된 리스트 
	public List<ArtistDTO> artistfeaturedPage(PageMaker pageMaker) throws Exception {
		return this.sqlSession.selectList(namespace+"artistfeaturedPage", pageMaker);
	}
	
	// Artist DB에 존재하는 모든 COUNT값 
	public int artistTotalCount() throws Exception {
		return this.sqlSession.selectOne(namespace+"artistTotalCount");
	}
	
	//메인서치의 아티스트 검색
	public List<ArtistDTO> artistSearch(String q) throws Exception{
		return this.sqlSession.selectList(namespace+"artistSearch", q);
	}
	
	// 최근 데뷔날짜의 아티스트 뽑아오기
	public List<ArtistDTO> artistRecentInfo() throws Exception {
		return this.sqlSession.selectList(namespace+"artistRecentInfo");
	}
}
