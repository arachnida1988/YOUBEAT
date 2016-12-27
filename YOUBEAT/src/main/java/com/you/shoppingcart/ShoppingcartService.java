package com.you.shoppingcart;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

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
import com.you.payment.PaymentDAO;
import com.you.payment.PaymentDTO;
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
	@Autowired
	private PaymentDAO paymentDAO;
	
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
							this.scDAO.shoppingcartDelete(sc.getSnum());
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
				// 3. 결제 내역에서 존재하는지 검사
				PaymentDTO pDTO = new PaymentDTO();
				pDTO.setPid(shoppingcartDTO.getSid());
				pDTO.setPcategory(shoppingcartDTO.getScategory());
				List<PaymentDTO> paymentList = this.paymentDAO.paymentList(pDTO);
				for(PaymentDTO p : paymentList) {
					if(shoppingcartDTO.getScategorynum() == p.getPcategorynum()) {
						// 존재하면
						numCheck = true;
						result = 3;
					}
				}
				// 4. 장바구니에 없으면 등록
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
	// 장바구니 목록에서 삭제
	@Transactional
	public String shoppingcartDelete(ShoppingcartDTO shoppingcartDTO, Model model,
			String strSnum) {
		String path = "";
		try {
			StringTokenizer st = new StringTokenizer(strSnum, "/");
			while(st.hasMoreTokens()) {
				// 장바구니에서 삭제
				this.scDAO.shoppingcartDelete(Integer.parseInt(st.nextToken()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 음악인지, 장바구니인지 판단하기 위해서
		if(shoppingcartDTO.getScategory().equals("music")) {
			// 음악 리스트 뿌리기
			path = this.cartMusicList(shoppingcartDTO, model);
		} else {
			// 앨범 리스트 뿌리기
			path = this.cartAlbumList(shoppingcartDTO, model);
		}
		return path;
	}
	
	// 장바구니 페이지
	@Transactional
	public String cartList(ShoppingcartDTO shoppingcartDTO, Model model) {
		List<MusicDTO> rdMusics = null;
		List<AlbumDTO> rdAlbums = null;
		List<FileupDTO> rdImgs = null;
		List<MusicDTO> mGenreList = null;
		List<String> aGenreList = null;
		List<String> substrMtitle = null;
		int nullCheck_1 = 0;
		int nullCheck_2 = 0;
		try {
			// 1. SID, MUSIC으로 리스트 호출
			shoppingcartDTO.setScategory("music");
			List<ShoppingcartDTO> cMusics = this.scDAO.shoppingcartList(shoppingcartDTO);
			if(!cMusics.isEmpty()) {
				nullCheck_1 = 1;
			}
			if(nullCheck_1 == 1) {
				// 1-1. 음악 번호로 장르 가져오기 - 코드 재사용( 음악 정보 가져오는 DAO를 호출 하겠다. )
				// 원래는 그냥 MusicDTO인데 장르만 사용할것이기 때문에 mGenreList라고 변수 선언
				mGenreList = new ArrayList<>();
				// MusicDAO부분이 하나씩 꺼내오는 부분이라서 이렇게 해야하는점.
				for(ShoppingcartDTO musics : cMusics) {
					// 원래는 그냥 MusicDTO인데 장르만 사용할것이기 때문에 헷갈리지 않게 mGenre라고 선언
					MusicDTO mGenre = this.musicDAO.musicView_cart(musics.getScategorynum());
					mGenreList.add(mGenre);
				}
			}
			// 2. SID, ALBUM으로 리스트 호출
			shoppingcartDTO.setScategory("album");
			List<ShoppingcartDTO> cAlbums = this.scDAO.shoppingcartList(shoppingcartDTO);
			if(!cAlbums.isEmpty()) {
				nullCheck_2 = 1;
			}
			if(nullCheck_2 == 1) { 	
				// 2-1. 앨범 번호로 장르 가져오기
				aGenreList = new ArrayList<>();
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
				// 3-2. 최대값 구하기
				int maxCount = genreCounts[0];
				int maxIndex = 0;
				for(int i=0; i<genreCounts.length; i++) {
					if(maxCount < genreCounts[i]) {
						maxCount = genreCounts[i];
						maxIndex = i;
					}
				}
				// 4. 그 장르에 맞는 MUSIC 20개 뽑아오기 최근 날짜 순으로..
				// 4-1. PageMaker필요.. perPage=20
				String maxGenre = allGenre.get(maxIndex);
				PageMaker pageMaker = new PageMaker();
				pageMaker.setCurPage(1);
				pageMaker.setPerPage(20);
				pageMaker.makeRow();
				rdMusics = this.musicDAO.musicList_map(maxGenre, pageMaker);
				pageMaker.makePage(rdMusics.size());
				// 5. 앨범 정보 가져오기
				rdAlbums = new ArrayList<>();
				substrMtitle = new ArrayList<>();
				for(MusicDTO m : rdMusics) {
					AlbumDTO album = this.AlbumDAO.albumView(m.getAnum());
					// 음악 타이틀 자르기
					String mtitle = m.getMtitle();
					if(mtitle.length() > 45) {
						mtitle = mtitle.substring(0, 40)+"...";
					}
					rdAlbums.add(album);
					substrMtitle.add(mtitle);
				}
				// 6. 이미지 가져오기
				rdImgs = this.fileupDAO.fileupAlbumList(rdAlbums);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(nullCheck_1 == 0 && nullCheck_2 == 0 ) {	
			System.out.println("empty!");
			model.addAttribute("result", 0);
		} else {
			System.out.println("good!");
			model.addAttribute("result", 1);
			model.addAttribute("substrMtitle", substrMtitle);
			model.addAttribute("rdMusics", rdMusics);
			model.addAttribute("rdAlbums", rdAlbums);
			model.addAttribute("rdImgs", rdImgs);
		}
		return "shoppingcart/cartList";
	}
	
	// AJAX 요청 부분 - 장바구니의 음악 리스트
	@Transactional
	public String cartMusicList(ShoppingcartDTO shoppingcartDTO, Model model) {
		List<ShoppingcartDTO> cartMusics = null;
		List<MusicDTO> musicList = null;
		List<AlbumDTO> albumList = null;
		List<FileupDTO> imgList = null;
		List<String> substrAtitle = null;
		List<String> substrMtitle = null;
		int subTotal = 0;
		int check = 0;
		int musicCount = 0;
		try {
			cartMusics = this.scDAO.shoppingcartList(shoppingcartDTO);
			// 갯수 가져오기
			musicCount = cartMusics.size();
			// 음악 정보 가져오기 (리스트 만들기)
			musicList = new ArrayList<>();
			for(ShoppingcartDTO sc : cartMusics) {
				MusicDTO m = this.musicDAO.musicView_cart(sc.getScategorynum());
				musicList.add(m);
			}
			// 앨범 정보 가져오기 (리스트 만들기)
			albumList = new ArrayList<>();
			substrAtitle = new ArrayList<>();
			substrMtitle = new ArrayList<>();
			for(MusicDTO m : musicList) {
				// 음악의 총 가격 구하기
				subTotal += m.getMprice();
				AlbumDTO a = this.AlbumDAO.albumView(m.getAnum());
				// 앨범 타이틀 10줄로 줄이기
				String atitle = a.getAtitle();
				String mtitle = m.getMtitle();
				if(atitle.length() > 20) {
					atitle = atitle.substring(0, 15)+"...";
				}
				if(mtitle.length() > 45) {
					mtitle = mtitle.substring(0, 40)+"...";
				}
				// 음악 타이틀 10줄로 줄이기
				substrAtitle.add(atitle);
				substrMtitle.add(mtitle);
				albumList.add(a);
			}
			// 이미지 파일 가져오기 (리스트)
			imgList = this.fileupDAO.fileupAlbumList(albumList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(cartMusics != null) {
			check = 1;
		}
		model.addAttribute("check", check);
		model.addAttribute("substrAtitle", substrAtitle);
		model.addAttribute("substrMtitle", substrMtitle);
		model.addAttribute("cartMusics", cartMusics);
		model.addAttribute("musicCount", musicCount);
		model.addAttribute("musicList", musicList);
		model.addAttribute("albumList", albumList);
		model.addAttribute("imgList", imgList);
		model.addAttribute("subTotal", subTotal);
		return "shoppingcart/cartMusicResult";
	}
	
	// AJAX 요청 부분 - 장바구니의 앨범 리스트
	@Transactional
	public String cartAlbumList(ShoppingcartDTO shoppingcartDTO, Model model) {
		List<ShoppingcartDTO> cartAlbums = null;
		List<AlbumDTO> albumList = null;
		List<FileupDTO> imgList = null;
		List<String> genreList = null;
		List<Integer> priceList = null;
		List<String> substrAtitle = null;
		List<String> substrAtitle2 = null;
		int subTotal = 0;
		int check = 0;
		int albumCount = 0;
		try {
			cartAlbums = this.scDAO.shoppingcartList(shoppingcartDTO);
			// 앨범 갯수 가져오기
			albumCount = cartAlbums.size();
			// 앨범 정보 가져오기 (리스트 만들기)
			albumList = new ArrayList<>();
			substrAtitle = new ArrayList<>();
			substrAtitle2 = new ArrayList<>();
			for(ShoppingcartDTO sc : cartAlbums) {
				AlbumDTO a = this.AlbumDAO.albumView(sc.getScategorynum());
				// 앨범 타이틀 10줄로 줄이기
				String atitle = a.getAtitle();
				String atitle2 = a.getAtitle();
				if(atitle.length() > 20) {
					atitle = atitle.substring(0, 15)+"...";
				}
				if(atitle2.length() > 45) {
					atitle2 = atitle2.substring(0, 40)+"...";
				}
				substrAtitle.add(atitle);
				substrAtitle2.add(atitle2);
				albumList.add(a);
			}
			// 이미지 파일 가져오기 (리스트)
			imgList = this.fileupDAO.fileupAlbumList(albumList);
			// 음악 장르, 음악 가격 가져오기 - 앨범번호로
			genreList = new ArrayList<>();
			priceList = new ArrayList<>();
			for(AlbumDTO a : albumList) {
				String genre = this.musicDAO.getGenreAndPriceOfMusic2(a.getAnum());
				int price = this.musicDAO.getGenreAndPriceOfMusic(a.getAnum());
				genreList.add(genre);
				priceList.add(price);
				// 앨범의 총가격 구하기
				subTotal += price;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(cartAlbums != null) {
			check = 1;
		}
		
		model.addAttribute("check", check);
		model.addAttribute("substrAtitle", substrAtitle);
		model.addAttribute("substrAtitle2", substrAtitle2);
		model.addAttribute("cartAlbums", cartAlbums);
		model.addAttribute("albumCount", albumCount);
		model.addAttribute("albumList", albumList);
		model.addAttribute("imgList", imgList);
		model.addAttribute("genreList", genreList);
		model.addAttribute("priceList", priceList);
		model.addAttribute("subTotal", subTotal);
		return "shoppingcart/cartAlbumResult";
	}
	
	
	// AJAX 요청 부분 - 장바구니의 앨범, 음악의 총 가격 얻어오기
	@Transactional
	public String cartTotalPriceResult(ShoppingcartDTO shoppingcartDTO, Model model) {
		List<ShoppingcartDTO> cartMusics = null;
		List<ShoppingcartDTO> cartAlbums = null;
		List<MusicDTO> musicList = null;
		List<AlbumDTO> albumList = null;
		List<Integer> priceList = null;
		int totalPrice = 0;
		int check = 0;
		try {
			// 음악 정보 가져오기 (리스트 만들기)
			shoppingcartDTO.setScategory("music");
			cartMusics = this.scDAO.shoppingcartList(shoppingcartDTO);
			musicList = new ArrayList<>();
			for(ShoppingcartDTO sc : cartMusics) {
				MusicDTO m = this.musicDAO.musicView_cart(sc.getScategorynum());
				musicList.add(m);
			}
			// 음악 총 가격 더하기
			for(MusicDTO m : musicList) {
				totalPrice += m.getMprice();
			}
			// 앨범 정보 가져오기 (리스트 만들기)
			shoppingcartDTO.setScategory("album");
			cartAlbums = this.scDAO.shoppingcartList(shoppingcartDTO);
			albumList = new ArrayList<>();
			for(ShoppingcartDTO sc : cartAlbums) {
				AlbumDTO a = this.AlbumDAO.albumView(sc.getScategorynum());
				albumList.add(a);
			}
			// 앨범 총 가격 더하기
			priceList = new ArrayList<>();
			for(AlbumDTO a : albumList) {
				int price = this.musicDAO.getGenreAndPriceOfMusic(a.getAnum());
				priceList.add(price);
				totalPrice += price;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(priceList != null) {
			check = 1;
		}
		model.addAttribute("check", check);
		model.addAttribute("totalPrice", totalPrice);
		return "shoppingcart/cartTotalPriceResult";
	}
	
	// 장바구니에 있는 목록들을 통해 버튼 비활성화 처리 - music
	public List<ShoppingcartDTO> checkingCartInfo(ShoppingcartDTO shoppingcartDTO) {
		List<ShoppingcartDTO> checkingInfo = null;
		try {
			checkingInfo = this.scDAO.shoppingcartList(shoppingcartDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return checkingInfo;
	}
}
