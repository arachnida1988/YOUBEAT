package com.you.streaming;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.you.album.AlbumDAO;
import com.you.album.AlbumDTO;
import com.you.artist.ArtistDAO;
import com.you.artist.ArtistDTO;
import com.you.fileup.FileupDAO;
import com.you.fileup.FileupDTO;
import com.you.mp3.Mp3DAO;
import com.you.mp3.Mp3DTO;
import com.you.music.MusicDAO;
import com.you.music.MusicDTO;
import com.you.util.PageMaker;
import com.you.util.Searching;

@Repository
public class StreamingDAO {

	@Autowired
	private ArtistDAO artistDAO;
	@Autowired
	private AlbumDAO albumDAO;
	@Autowired
	private MusicDAO musicDAO;
	@Autowired
	private FileupDAO fileupDAO;
	@Autowired
	private Mp3DAO mp3dao;

	//메인서치 검색조건에 맞는 뮤직리스트
	public List<MusicDTO> musicSearch(String q){
		List<MusicDTO> ar = new ArrayList<MusicDTO>();
		try {
			ar = musicDAO.musicSearch(q);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ar;
	}
	
	
	//메인서치 앨범 검색조건 리스트 뽑기
	public List<AlbumDTO> albumSearch(String q){
		List<AlbumDTO> ar = new ArrayList<AlbumDTO>();
		try {
			ar = albumDAO.albumSearch(q);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ar;
	}
	
	//메인서치 아티스트 검색조건 리스트뽑기
	public List<ArtistDTO> artistSearch(String q){
		List<ArtistDTO> ar = new ArrayList<ArtistDTO>();
		try {
			ar = artistDAO.artistSearch(q);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ar;
	}

	//아티스트 리스트 기본형 모두뽑기
	public List<ArtistDTO> artistList(){
		List<ArtistDTO> ar = new ArrayList<ArtistDTO>();
		try {
			ar = artistDAO.artistList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ar;
	}

	//tracks 뮤직리스트  뽑기
	public List<MusicDTO> musicList(int curPage, int perPage,Model model, String arraytype, int albumASC, Date startDate, Date lastDate){
		List<MusicDTO> ar = new ArrayList<MusicDTO>();

		//검색조건추가
		switch (arraytype) {
		case "dateup":
			break;
		case "datedown":
			break;
		case "titleup":
			break;
		case "titledown":
			break;
		case "genreup":
			break;
		case "genredown":
		break;
		default :
			arraytype="dateup";
		break;
		}
		int totalCount=0;
		Searching searching = new Searching();
		System.out.println("정렬되는 타입"+arraytype);
		searching.setArraytype(arraytype);
		searching.setAlbumASC(albumASC);
		searching.setStartDate(startDate);
		searching.setLastDate(lastDate);
		try {
			totalCount = musicDAO.searchMusicTotalCount(searching);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		//페이징 셋팅
		searching.setCurPage(curPage);
		searching.setPerPage(perPage);
		searching.makeRow();
		searching.makePage(totalCount);
		try {
			ar = musicDAO.searchMusicList(searching);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("pageMaker", searching);
		return ar;
	}

	//album리스트 모두뽑기
	public List<AlbumDTO> albumList(){
		List<AlbumDTO> ar = new ArrayList<AlbumDTO>();
		try {
			ar= albumDAO.alnumList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ar;
	}

	//album리스트를 가지고 파일1:1매칭 뽑기
	public List<FileupDTO> fileupAlbumList(List<AlbumDTO> albumList){
		List<FileupDTO> ar=null;
		try {
			ar = fileupDAO.fileupAlbumList(albumList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ar;
	}

	//mp3모든리스트 가져오기
	public List<Mp3DTO> mp3List(){
		List<Mp3DTO> ar = new ArrayList<Mp3DTO>();
		try {
			ar = mp3dao.mp3List();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ar;
	}

	// 복사
	// 아티스트 리스트 페이징 처리형태 뽑기
	public List<ArtistDTO> artistfeaturedPage(PageMaker pageMaker) {
		List<ArtistDTO> pageingList = null;
		try {
			pageingList = this.artistDAO.artistfeaturedPage(pageMaker);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pageingList;
	}

	// 아티스트 DB에 존재하는 모든 데이터의 COUNT값 가져오기
	public int artistTotalCount() {
		int totalCount = 0;
		try {
			totalCount = this.artistDAO.artistTotalCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}

	// 아티스트 관련되어있는 File 가져오기 (사진)
	public List<FileupDTO> fileupArtistList(List<ArtistDTO> artistList) {
		List<FileupDTO> artistFileList = null;
		try {
			artistFileList = this.fileupDAO.fileupArtistList(artistList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return artistFileList;
	}

	// 아티스트의 가장 높은 판매율인 앨범 가져오기
	public AlbumDTO getAlbumOfArtist(String aartist) {
		AlbumDTO albumDTO = null;
		try {
			albumDTO = this.albumDAO.getAlbumOfArtist(aartist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return albumDTO;
	}

	// 아티스트 정보
	public ArtistDTO artistView(String arartist) {
		ArtistDTO artistDTO = null;
		try {
			artistDTO = this.artistDAO.artistView(arartist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return artistDTO;
	}

	// 아티스트를 이용해서 가장 최근 날짜를 가져오기
	public String getRecentAlbumDate(String aartist) {
		String recentDate = "";
		try {
			recentDate = this.albumDAO.getRecentAlbumDate(aartist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recentDate;
	}

	// 날짜로 앨범정보를 가져오는 함수
	public AlbumDTO getAlbumInfo_date(String adate, String aartist) {
		AlbumDTO albumDTO = null;
		try {
			albumDTO = this.albumDAO.getAlbumInfo_date(adate, aartist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return albumDTO;
	}

	// 앨범의 번호로 음악별로 더해진 총가격(=앨범 가격) 가져오기
	public int getGenreAndPriceOfMusic(int anum) {
		int aprice = 0;
		try {
			aprice = this.musicDAO.getGenreAndPriceOfMusic(anum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return aprice;
	}
	// 앨범의 번호로 음악 장르 가져오기
	public String getGenreAndPriceOfMusic2(int anum) {
		String mgenre = "";
		try {
			mgenre = this.musicDAO.getGenreAndPriceOfMusic2(anum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mgenre;
	}

	// 중복제거된 모든 장르 리스트 가져오기
	public List<String> getTotalGenreList() {
		List<String> genreList = null;
		try {
			genreList = this.musicDAO.getTotalGenreList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return genreList;
	}

	// 장르별로 존재하는 음악수 가져오기
	public int getGenreCount(String mgenre) {
		int genreCount = 0;
		try {
			genreCount = this.musicDAO.getGenreCount(mgenre);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return genreCount;
	}

	//  Map으로 앨범 리스트 가져오기 -> page수가 1 ~ n 만큼 정해져 있다.
	public List<AlbumDTO> getAlbumList_map(String aartist, PageMaker pageMaker) {
		List<AlbumDTO> albumList = null;
		try {
			albumList = this.albumDAO.getAlbumList_map(aartist, pageMaker);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return albumList;
	}

	// 아티스트 이름으로 모든 앨범 리스트 가져오기
	public List<AlbumDTO> getAlbumList_name(String aartist) {
		List<AlbumDTO> albumList = null;
		try {
			albumList = this.albumDAO.getAlbumList_name(aartist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return albumList;
	}

	// 앨범의 번호로 음악리스트 가져오기 (1개앨범씩 가져오기)
	public List<MusicDTO> getMusicList_anum(int anum) {
		List<MusicDTO> musicList = null;
		try {
			musicList = this.musicDAO.getMusicList_anum(anum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return musicList;
	}

	// 앨범의 번호로 앨범의 정보를 가져오기
	public AlbumDTO albumView(int anum) {
		AlbumDTO albumDTO = null;
		try {
			albumDTO = this.albumDAO.albumView(anum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return albumDTO;
	}
}
