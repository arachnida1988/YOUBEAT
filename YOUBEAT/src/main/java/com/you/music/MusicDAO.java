package com.you.music;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return this.sqlSession.selectOne(namespace+"getGenreAndPriceOfMusic", anum);
	}
	// 앨범의 번호로 음악 장르 가져오기 가져오기
	public String getGenreAndPriceOfMusic2(int anum) throws Exception {
		return this.sqlSession.selectOne(namespace+"getGenreAndPriceOfMusic2", anum);
	}

	// 중복제거된 모든 장르의 리스트 가져오기
	public List<String> getTotalGenreList() throws Exception {
		return this.sqlSession.selectList(namespace+"getTotalGenreList");
	}

	// 장르별로 존재하는 음악수 가져오기
	public int getGenreCount(String mgenre) throws Exception {
		return this.sqlSession.selectOne(namespace+"getGenreCount", mgenre);
	}

	// 앨범의 번호로 음악리스트 가져오기 (1개앨범씩 가져오기)
	public List<MusicDTO> getMusicList_anum(int anum) throws Exception {
		return this.sqlSession.selectList(namespace+"getMusicList_anum", anum);
	}

	// 장바구니 부분에서 사용할 음악 정보 가져오는 부분 - 음악번호
	public MusicDTO musicView_cart(int mnum) throws Exception {
		return this.sqlSession.selectOne(namespace+"musicView_cart", mnum);
	}
	
	// 16.12.21.11:18 추가 ****************** 
	// 장르로 음악 리스트 20개만 가져오기 최근 날짜 
	public List<MusicDTO> musicList_map(String mgenre, PageMaker pageMaker) 
			throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("page", pageMaker);
		map.put("mgenre", mgenre);
		return this.sqlSession.selectList(namespace+"musicList_map", map);
	}
}
