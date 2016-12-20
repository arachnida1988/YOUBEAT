package com.you.album;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.you.util.PageMaker;

@Repository
public class AlbumDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "AlbumMapper.";
	
	// Album ���
	public int albumInsert(AlbumDTO albumDTO) throws Exception {
		return this.sqlSession.insert(namespace+"albumInsert", albumDTO);
	}
	
	// Album MaxNum
	public int albumMaxNum() throws Exception {
		return this.sqlSession.selectOne(namespace+"albumMaxNum");
	}
	
	// AlbumList
	public List<AlbumDTO> albumList(PageMaker pageMaker) throws Exception {
		return this.sqlSession.selectList(namespace+"albumList", pageMaker);
	}
	
	
	//------------tracks
	//All AlbumList
	public List<AlbumDTO> alnumList()throws Exception{
		return this.sqlSession.selectList(namespace+"allAlbumList");
	}
	//tracks
	
	
	
	// AlbumTotalCount
	public int albumTotalCount() throws Exception {
		return this.sqlSession.selectOne(namespace+"albumTotalCount");
	}
	
	// Album VIEW
	public AlbumDTO albumView(int anum) throws Exception {
		return this.sqlSession.selectOne(namespace+"albumView", anum);
	}
	
	// Album ����
	public int albumUpdate(AlbumDTO albumDTO) throws Exception {
		return this.sqlSession.update(namespace+"albumUpdate", albumDTO);
	}
	
	// Album ����
	public int albumDelete(int anum) throws Exception {
		return this.sqlSession.delete(namespace+"albumDelete", anum);
	}
	
	// 복사 
	// 아티스트의 가장 높은 판매율인 앨범 가져오기
	public AlbumDTO getAlbumOfArtist(String aartist) throws Exception {
		return this.sqlSession.selectOne(namespace+"getAlbumOfArtist", aartist);
	}
	
	// 아티스트를 이용해서 가장 최근 날짜를 가져오기
	public String getRecentAlbumDate(String aartist) throws Exception {
		return this.sqlSession.selectOne(namespace+"getRecentAlbumDate", aartist);
	}
	
	// 날짜와 아티스트로 앨범정보를 가져오는 함수
	public AlbumDTO getAlbumInfo_date(String adate, String aartist) throws Exception {
		AlbumDTO albumDTO = new AlbumDTO();
		albumDTO.setAdate(adate);
		albumDTO.setAartist(aartist);
		return this.sqlSession.selectOne(namespace+"getAlbumInfo_date", albumDTO);
	}
	// 복사 끝
}
