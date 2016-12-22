package com.you.shoppingcart;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.you.album.AlbumDAO;
import com.you.album.AlbumDTO;
import com.you.fileup.FileupDAO;
import com.you.fileup.FileupDTO;
import com.you.music.MusicDAO;
import com.you.music.MusicDTO;
import com.you.util.PageMaker;

@Service
public class ShoppingcartService {

	@Autowired
	private ShoppingcartDAO scDAO;
	@Autowired
	private MusicDAO musicDAO;
	@Autowired
	private AlbumDAO AlbumDAO;
	@Autowired
	private FileupDAO fileupDAO;
	
	// 장바구니에 등록
	@Transactional
	public String shoppingcartAdd(ShoppingcartDTO shoppingcartDTO, Model model) {
		int result = 0;
		try {
			// 1. 장바구니 추가할 음악 검사 -> 장바구니에 앨범이 존재하는지 체크하는 것
			// 음악을 장바구니에 넣기전에 체크하는 과정
			boolean albumCheck = false;
			if(shoppingcartDTO.getScategory().equals("music")) {				
				// 1-1. 음악 VIEW 가져오기
				MusicDTO music = this.musicDAO.musicView_cart(shoppingcartDTO.getScategorynum());
				// 1-2. 장바구니 리스트 가져오기 - 앨범만
				ShoppingcartDTO albumCategory = new ShoppingcartDTO();
				albumCategory.setSid(shoppingcartDTO.getSid());
				albumCategory.setScategory("album");
				List<ShoppingcartDTO> albumList = this.scDAO.shoppingcartList(albumCategory);
				// 1-3. ANUM을 체크하고 2번, 3번항목 pass할지? 안할지? -> true, false로 검사
				for(ShoppingcartDTO sc : albumList) {
					// 앨범 번호가 있으면
					if(music.getAnum() == sc.getScategorynum()) {
						albumCheck = true;
						result = 2;
					} 
				}
			} else if(shoppingcartDTO.getScategory().equals("album")) {
				// 앨범 번호로 매칭되는 음악리스트 가져오기
				List<MusicDTO> musics = this.musicDAO.getMusicList_anum(shoppingcartDTO.getScategorynum());
				// 1-2. 장바구니 리스트 가져오기 - 앨범만
				ShoppingcartDTO musicCategory = new ShoppingcartDTO();
				musicCategory.setSid(shoppingcartDTO.getSid());
				musicCategory.setScategory("music");
				List<ShoppingcartDTO> musicList = this.scDAO.shoppingcartList(musicCategory);
				for(MusicDTO m : musics) {
					for(ShoppingcartDTO sc : musicList) {
						// 음악번호가 존재하면
						if(m.getMnum() == sc.getScategorynum()) {
							// 장바구니에 있는 영화 정보 삭제
							this.scDAO.shoppingcartDel(sc.getSnum());
						}
					} // for
				} // for		
			} // else if		
			// 앨범이 존재하지 않으면 장바구니의 등록
			if(albumCheck == false) {
				// 2. 장바구니 목록안에 있는지 검사
				List<ShoppingcartDTO> cartList = this.scDAO.shoppingcartList(shoppingcartDTO);
				boolean numCheck = false;
				for(ShoppingcartDTO sc : cartList) {
					if(shoppingcartDTO.getScategorynum() == sc.getScategorynum()) {
						// 존재하면
						numCheck = true;
						result = 2;
					}
				}
				// 3. 장바구니에 없으면 등록
				if(numCheck == false) {				
					result = this.scDAO.shoppingcartAdd(shoppingcartDTO);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("result", result);
		return "shoppingcart/shoppingcartResult";
	}
	
	// 장바구니 페이지
	public String cartList(ShoppingcartDTO shoppingcartDTO, Model model) {
		List<MusicDTO> rdMusics = null;
		List<AlbumDTO> rdAlbums = null;
		List<FileupDTO> rdImgs = null;
		int nullCheck = 0;
		try {
			// 1. SID, MUSIC으로 리스트 호출
			shoppingcartDTO.setScategory("music");
			List<ShoppingcartDTO> cMusics = this.scDAO.shoppingcartList(shoppingcartDTO);
			// 1-1. 음악 번호로 장르 가져오기 - 코드 재사용( 음악 정보 가져오는 DAO를 호출 하겠다. )
			// 원래는 그냥 MusicDTO인데 장르만 사용할것이기 때문에 mGenreList라고 변수 선언
			List<MusicDTO> mGenreList = new ArrayList<>();
			// MusicDAO부분이 하나씩 꺼내오는 부분이라서 이렇게 해야하는점.
			for(ShoppingcartDTO musics : cMusics) {
				// 원래는 그냥 MusicDTO인데 장르만 사용할것이기 때문에 헷갈리지 않게 mGenre라고 선언
				MusicDTO mGenre = this.musicDAO.musicView_cart(musics.getScategorynum());
				mGenreList.add(mGenre);
			}
			// 2. SID, ALBUM으로 리스트 호출
			shoppingcartDTO.setScategory("album");
			List<ShoppingcartDTO> cAlbums = this.scDAO.shoppingcartList(shoppingcartDTO);
			// 2-1. 앨범 번호로 장르 가져오기
			List<String> aGenreList = new ArrayList<>();
			// MusicDAO부분이 하나씩 꺼내오는 부분이라서 이렇게 해야하는점.
			for(ShoppingcartDTO albums : cAlbums) {
				String aGenre = this.musicDAO.getGenreAndPriceOfMusic2(albums.getScategorynum());
				aGenreList.add(aGenre);
			}
			// 3. 장바구니에 많이 들어있는 장르를 파악 (제일 중요 - 어떻게 해야할지 생각..)
			// 3-1. MUSIC에서 존재하는 총 장르를 가져와서 비교???
			List<String> allGenre = this.musicDAO.getTotalGenreList();
			int [] genreCounts = new int[allGenre.size()];
			for(int i=0; i<genreCounts.length; i++) {
				// 음악 부분 
				for(MusicDTO mGenre : mGenreList) {
					// 장르가 매치가 되면
					if(allGenre.get(i).equals(mGenre.getMgenre())) {
						// 해당되는 count값 증가
						genreCounts[i]++;
					}
				}
				// 앨범 부분
				for(String aGenre : aGenreList) {
					// 장르가 매치가 되면
					if(allGenre.get(i).equals(aGenre.toString())) {
						// 해당되는 count값 증가
						genreCounts[i]++;
					}
				}
			}
			// 3-2. 정렬..
			for(int i=0; i<genreCounts.length; i++) {
				for(int j=0; j<genreCounts.length; j++) {
					if(genreCounts[i] < genreCounts[j]) {
						int temp = genreCounts[i];
						genreCounts[i] = genreCounts[j];
						genreCounts[j] = temp;
					}
				}
			}
			// 4. 그 장르에 맞는 MUSIC 20개 뽑아오기 최근 날짜 순으로..
			// 4-1. PageMaker필요.. perPage=20
			int maxIndex = genreCounts.length-1;
			String maxGenre = allGenre.get(maxIndex);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCurPage(1);
			pageMaker.setPerPage(20);
			pageMaker.makeRow();
			rdMusics = this.musicDAO.musicList_map(maxGenre, pageMaker);
			pageMaker.makePage(rdMusics.size());
			// 5. 앨범 정보 가져오기
			rdAlbums = new ArrayList<>();
			for(MusicDTO m : rdMusics) {
				AlbumDTO album = this.AlbumDAO.albumView(m.getAnum());
				rdAlbums.add(album);
			}
			// 6. 이미지 가져오기
			rdImgs = this.fileupDAO.fileupAlbumList(rdAlbums);
			if(rdImgs != null) {
				nullCheck = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("sid", shoppingcartDTO.getSid());
		model.addAttribute("nullCheck", nullCheck);
		model.addAttribute("rdMusics", rdMusics);
		model.addAttribute("rdAlbums", rdAlbums);
		model.addAttribute("rdImgs", rdImgs);
		return "shoppingcart/cartList";
	}
	
	// AJAX 요청 부분 - 장바구니의 앨범 리스트
	public String cartAlbumList(ShoppingcartDTO shoppingcartDTO, Model model) {
		List<ShoppingcartDTO> cartAlbums = null;
		try {
			cartAlbums = this.scDAO.shoppingcartList(shoppingcartDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// AJAX 요청 부분 - 장바구니의 음악 리스트
	public String cartMusicList(ShoppingcartDTO shoppingcartDTO, Model model) {
		return null;
	}
	
	// AJAX 요청 부분 - 장바구니의 앨범, 음악의 총 가격 얻어오기
	public String cartTotalPriceResult(ShoppingcartDTO shoppingcartDTO, Model model) {
		shoppingcartDTO.setScategory("music");
		shoppingcartDTO.setScategory("album");
		return null;
	}
}
