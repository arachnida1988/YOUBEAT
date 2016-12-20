package com.you.music;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.you.util.PageMaker;

@Repository
public class MusicDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "MusicMapper.";
	
	// Music ���
	public int musicInsert(MusicDTO musicDTO) throws Exception {
		return this.sqlSession.insert(namespace+"musicInsert", musicDTO);
	}
	
	// Music ����Ʈ
	public List<MusicDTO> musicList(PageMaker pageMaker) throws Exception {
		return this.sqlSession.selectList(namespace+"musicList", pageMaker);
		
	}
	
	// Music �� ���� �������� 
	public int musicTotalCount() throws Exception {
		return sqlSession.selectOne(namespace+"musicTotalCount");
	}
	
	// Music View
	public MusicDTO musicView(int mnum) throws Exception {
		return null;
	}
	
	// Music ���� 
	public MusicDTO musicUpdate(MusicDTO musicDTO) throws Exception {
		return null;
	}
	
	// �ٹ� ������ ���� �����Ǵ� ���ǵ�
	public int musicsDelete(int anum) throws Exception {
		return this.sqlSession.delete(namespace+"musicsDelete", anum);
	}
	
	// ���� �ϳ��� �����Ǵ� �Լ�
	public int musicDelete(int mnum) throws Exception {
		return this.sqlSession.delete(namespace+"musicDelete", mnum);
	}
	
	// 앨범의 번호로 음악별로 더해진 총가격(=앨범 가격) 가져오기
	public int getGenreAndPriceOfMusic(int anum) throws Exception {
		System.out.println("anum : "+anum);
		return this.sqlSession.selectOne(namespace+"getGenreAndPriceOfMusic", anum);
	}
}
