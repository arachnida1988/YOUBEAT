package com.you.streaming;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.you.album.AlbumDTO;
import com.you.artist.ArtistDTO;
import com.you.fileup.FileupDTO;
import com.you.mp3.Mp3DTO;
import com.you.music.MusicDTO;
import com.you.util.PageMaker;

@Service
public class StreamingService {

	@Autowired
	private StreamingDAO streamingDAO;
	
	//음악한개 스트링 타입
	public String music_addList(String music, int album){
		List<MusicDTO> musicList = streamingDAO.getMusicList_anum(album);
		List<MusicDTO> musicComplete = new ArrayList<>();
		for(int i=0;i<musicList.size();i++){
			if(musicList.get(i).getMtitle().equals(music)){
				musicComplete.add(musicList.get(i));
			}
		}
		// 해당앨범의 상세정보
		AlbumDTO thisAlbumInfo = streamingDAO.albumView(album);
		// 해당앨범을 리스트로하여 파일매칭
		List<AlbumDTO> albumChange = new ArrayList<AlbumDTO>();
		albumChange.add(thisAlbumInfo);
		List<FileupDTO> file = streamingDAO.fileupAlbumList(albumChange);
		FileupDTO fileupDTO = file.get(0);

		List<Mp3DTO> mp3Complete = new ArrayList<Mp3DTO>();
		List<Mp3DTO> mp3 = streamingDAO.mp3List();
		for (int i = 0; i < musicList.size(); i++) {
			for (int j = 0; j < mp3.size(); j++) {
				if (musicList.get(i).getMtitle().equals(mp3.get(j).getTitle())) {
					mp3Complete.add(mp3.get(j));
				}
			}
		}
		String result="";
		for(int index=0; index<musicComplete.size();index++){
			String div = "<div class='music_addList' song='"+
					mp3Complete.get(index).getMfilename()+"' artist='"+
					mp3Complete.get(index).getArtist()+"' cover='/beat/resources/upload/"+fileupDTO.getFfilename()+
					"' title='"+musicList.get(index).getMtitle()+"'></div>";
			result=result+div;
		}
		System.out.println(result);
		return result;
	}

	//앨범내용 스트링 타입.
	public String album_addList(int anum, String artist, Model model) {
		// 해당앨범의 뮤직리스트
		List<MusicDTO> musicList = streamingDAO.getMusicList_anum(anum);
		System.out.println("music size : " + musicList.size());
		// 해당앨범의 상세정보
		AlbumDTO thisAlbumInfo = streamingDAO.albumView(anum);
		// 해당앨범을 리스트로하여 파일매칭
		List<AlbumDTO> albumChange = new ArrayList<AlbumDTO>();
		albumChange.add(thisAlbumInfo);
		List<FileupDTO> file = streamingDAO.fileupAlbumList(albumChange);
		FileupDTO fileupDTO = file.get(0);

		List<Mp3DTO> mp3Complete = new ArrayList<Mp3DTO>();
		List<Mp3DTO> mp3 = streamingDAO.mp3List();
		for (int i = 0; i < musicList.size(); i++) {
			for (int j = 0; j < mp3.size(); j++) {
				if (musicList.get(i).getMtitle().equals(mp3.get(j).getTitle())) {
					mp3Complete.add(mp3.get(j));
				}
			}
		}
		String result="";
		for(int index=0; index<musicList.size();index++){
			String div = "<div class='album_addList' song='"+
					mp3Complete.get(index).getMfilename()+"' artist='"+
					mp3Complete.get(index).getArtist()+"' cover='/beat/resources/upload/"+fileupDTO.getFfilename()+
					"' title='"+musicList.get(index).getMtitle()+"'></div>";
			result=result+div;
		}
		System.out.println(result);
		return result;
	}	
	
	//메인서칭
	public void mainSearch(String q, Model model){
		q="%"+q+"%";
		List<ArtistDTO> artistList = streamingDAO.artistSearch(q);
		model.addAttribute("artistList", artistList);//아티스트 검색
		model.addAttribute("artistfiles", this.streamingDAO.fileupArtistList(artistList));//아티스트사진
		List<AlbumDTO> albumList = streamingDAO.albumSearch(q);
		model.addAttribute("albumList", albumList);//앨범 검색
		model.addAttribute("albumfiles", streamingDAO.fileupAlbumList(albumList));

		List<MusicDTO> music = streamingDAO.musicSearch(q);//밑으로 뮤직 검색
		List<Mp3DTO> mp3 = streamingDAO.mp3List();
		List<ArtistDTO> artist = streamingDAO.artistList();
		List<AlbumDTO> album = streamingDAO.albumList();
		List<FileupDTO> files = streamingDAO.fileupAlbumList(album);
		System.out.println("music size : "+music.size());
		//music == 나머지 모든 리스트 매칭 작업
		List<Mp3DTO> mp3Complete = new ArrayList<Mp3DTO>();
		List<ArtistDTO> artistComplete = new ArrayList<ArtistDTO>();
		List<AlbumDTO> albumComplete = new ArrayList<AlbumDTO>();
		List<FileupDTO> filesComplete = new ArrayList<FileupDTO>();
		System.out.println("나온아티스트 사이즈"+artist.size());

		for(int i=0;i<music.size();i++){

			for(int j=0;j<mp3.size();j++){
				if(music.get(i).getMtitle().equals(mp3.get(j).getTitle())){
					mp3Complete.add(mp3.get(j));
				}
			}

			for(int k=0;k<album.size();k++){
				if(music.get(i).getAnum() == album.get(k).getAnum()){
					albumComplete.add(album.get(k));
					filesComplete.add(files.get(k));
				}
			}
		}
		for(int m=0;m<albumComplete.size();m++){
			for(int n=0;n<artist.size();n++){
				if(albumComplete.get(m).getAartist().equals(artist.get(n).getArartist())){
					artistComplete.add(artist.get(n));
				}
			}
		}

		System.out.println("음악리스트 사이즈 : "+music.size());
		/*		for(int i=0;i<music.size();i++){
			System.out.println(i+"   "+music.get(i).getMtitle());
		}
		System.out.println("--------------------------------------------------------");
		for(int i=0;i<music.size();i++){
			System.out.println(i+"   "+mp3Complete.get(i).getTitle());
		}*/
		System.out.println("매칭된 mp3 파일리스트 사이즈 : "+mp3Complete.size());
		System.out.println("album size : "+ albumComplete.size());
		System.out.println("artist size : "+ artistComplete.size());
		System.out.println("files size : "+ filesComplete.size());
		model.addAttribute("album", albumComplete);
		model.addAttribute("mp3", mp3Complete);
		model.addAttribute("artist", artistComplete);
		model.addAttribute("files", filesComplete);
		model.addAttribute("music", music);
	}

	//앨범 상세 뷰 로드
	public void albumView(int anum,String artist, Model model){
		//해당앨범의 뮤직리스트
		List<MusicDTO> musicList = streamingDAO.getMusicList_anum(anum);
		//해당앨범의 상세정보
		AlbumDTO thisAlbumInfo = streamingDAO.albumView(anum);
		//해당 아티스트의 모든 앨범리스트
		List<AlbumDTO> albumList = streamingDAO.getAlbumList_name(artist);//수정중
		//해당앨범을 리스트로하여 파일매칭
		List<AlbumDTO> albumChange =new ArrayList<AlbumDTO>();
		albumChange.add(thisAlbumInfo);
		List<FileupDTO> file = streamingDAO.fileupAlbumList(albumChange);
		FileupDTO fileupDTO = file.get(0);

		List<Mp3DTO> mp3Complete = new ArrayList<Mp3DTO>();
		List<Mp3DTO> mp3 = streamingDAO.mp3List();
		for(int i=0;i<musicList.size();i++){
			for(int j=0;j<mp3.size();j++){
				if(musicList.get(i).getMtitle().equals(mp3.get(j).getTitle())){
					mp3Complete.add(mp3.get(j));
				}
			}
		}

		//그가수의 모든리스트에서 뿌려줄 앨범 제외 하기
		for(int i=0;i<albumList.size();i++){
			if(thisAlbumInfo.getAtitle().equals(albumList.get(i).getAtitle())){
				albumList.remove(i);
				break;
			}
		}
		model.addAttribute("albumInfo", thisAlbumInfo);
		model.addAttribute("musicList", musicList);
		model.addAttribute("albumImg", fileupDTO);
		model.addAttribute("mp3", mp3Complete);
		model.addAttribute("albumList", albumList);//수정중
	}

	//tracks part list 불러오기
	public void tracksList(int curPage, int perPage, Model model, String arraytype, int albumASC, Date startDate, Date lastDate){
		System.out.println(startDate+"----"+lastDate);
		List<MusicDTO> music = streamingDAO.musicList(curPage, perPage, model, arraytype, albumASC, startDate, lastDate);
		List<Mp3DTO> mp3 = streamingDAO.mp3List();
		List<ArtistDTO> artist = streamingDAO.artistList();
		List<AlbumDTO> album = streamingDAO.albumList();
		List<FileupDTO> files = streamingDAO.fileupAlbumList(album);

		//music == 나머지 모든 리스트 매칭 작업
		List<Mp3DTO> mp3Complete = new ArrayList<Mp3DTO>();
		List<ArtistDTO> artistComplete = new ArrayList<ArtistDTO>();
		List<AlbumDTO> albumComplete = new ArrayList<AlbumDTO>();
		List<FileupDTO> filesComplete = new ArrayList<FileupDTO>();
		System.out.println("나온아티스트 사이즈"+artist.size());

		for(int i=0;i<music.size();i++){

			for(int j=0;j<mp3.size();j++){
				if(music.get(i).getMtitle().equals(mp3.get(j).getTitle())){
					mp3Complete.add(mp3.get(j));
				}
			}

			for(int k=0;k<album.size();k++){
				if(music.get(i).getAnum() == album.get(k).getAnum()){
					albumComplete.add(album.get(k));
					filesComplete.add(files.get(k));
				}
			}
		}
		for(int m=0;m<albumComplete.size();m++){
			for(int n=0;n<artist.size();n++){
				if(albumComplete.get(m).getAartist().equals(artist.get(n).getArartist())){
					artistComplete.add(artist.get(n));
				}
			}
		}

		System.out.println("음악리스트 사이즈 : "+music.size());
		/*		for(int i=0;i<music.size();i++){
				System.out.println(i+"   "+music.get(i).getMtitle());
			}
			System.out.println("--------------------------------------------------------");
			for(int i=0;i<music.size();i++){
				System.out.println(i+"   "+mp3Complete.get(i).getTitle());
			}*/
		System.out.println("매칭된 mp3 파일리스트 사이즈 : "+mp3Complete.size());
		System.out.println("album size : "+ albumComplete.size());
		System.out.println("artist size : "+ artistComplete.size());
		System.out.println("files size : "+ filesComplete.size());
		model.addAttribute("album", albumComplete);
		model.addAttribute("mp3", mp3Complete);
		model.addAttribute("artist", artistComplete);
		model.addAttribute("files", filesComplete);
		model.addAttribute("music", music);
	}


	// *****************************************************
	// Artist List - 아티스트 페이지 - 추천 페이지
	@Transactional
	public String artistfeaturedPage(int curPage, int perPage, Model model) {
		// *********** FEATURED 부분 시작 ***********
		// 아티스트 이름으로 판매율이 가장 높은 앨범을 1개씩 가져오기
		List<ArtistDTO> getArtists = this.streamingDAO.artistList();
		List<AlbumDTO> getMaxAlbumOfArtist = new ArrayList<AlbumDTO>();
		for(ArtistDTO artistDTO : getArtists) {
			AlbumDTO albumDTO = this.streamingDAO.getAlbumOfArtist(artistDTO.getArartist());
			getMaxAlbumOfArtist.add(albumDTO);
		}		
		// 앨범 판매량에 따라 정렬하기
		// 기본 세팅
		int [] albumCounts = new int[getMaxAlbumOfArtist.size()];
		for(int i=0; i<getMaxAlbumOfArtist.size(); i++) {
			albumCounts[i] = getMaxAlbumOfArtist.get(i).getAcounts();
		}
		// 판매량 정렬 시작
		for(int i=0; i<albumCounts.length; i++) {
			for(int j=0; j<albumCounts.length; j++) {
				if(albumCounts[i] > albumCounts[j]) {
					int temp = albumCounts[i];
					albumCounts[i] = albumCounts[j];
					albumCounts[j] = temp;
				}
			}
		}

		// 정렬된 앨범 판매량과 기존의 앨범 List와 매칭 시켜 10순위 까지의 앨범을 List에 ADD
		// test는 8개로 진행
		List<AlbumDTO> featuredAlbums = new ArrayList<AlbumDTO>();
		for(int i=0; i<albumCounts.length; i++) {
			for(int j=0; j<getMaxAlbumOfArtist.size(); j++) {
				if(albumCounts[i] == getMaxAlbumOfArtist.get(j).getAcounts()) {
					featuredAlbums.add(getMaxAlbumOfArtist.get(j));
				}
			}
		}

		// 1. 매칭된 10개의 아티스트 사진 불러오기 위해서
		List<ArtistDTO> featuredArtists = new ArrayList<ArtistDTO>();
		// 2. 매칭된 음악 정보 불러오기
		List<Integer> aprices = new ArrayList<Integer>();
		List<String> mgenres = new ArrayList<String>();
		for(AlbumDTO albumDTO : featuredAlbums) {
			// 아티스트 정보 불러오기
			ArtistDTO artistDTO = this.streamingDAO.artistView(albumDTO.getAartist());
			// 음악 장르, 총 가격(앨범 가격) 가져오기
			int aprice = this.streamingDAO.getGenreAndPriceOfMusic(albumDTO.getAnum());
			String mgenre = this.streamingDAO.getGenreAndPriceOfMusic2(albumDTO.getAnum());
			featuredArtists.add(artistDTO);
			aprices.add(aprice);
			mgenres.add(mgenre);
		}
		// 이미지 불러오기
		List<FileupDTO> featuredImgs = this.streamingDAO.fileupArtistList(featuredArtists);

		// *********** FEATURED 부분 끝 ***********

		// *********** NEW ARTISTS 부분 시작 *********** 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		// 한 페이지당 6개가져오기 위함
		pageMaker.makeRow();
		// artists에 count값 가져와서 page처리 세팅
		pageMaker.makePage(this.streamingDAO.artistTotalCount());
		// 페이징 처리된 리스트 가져오기
		List<ArtistDTO> newArtistList = this.streamingDAO.artistfeaturedPage(pageMaker);	
		// 페이징 처리된 아티스트 사진 가져오기
		List<FileupDTO> newArtistFileList = this.streamingDAO.fileupArtistList(newArtistList);
		// 아티스트의 새 앨범 가져오기 - 최근 날짜의 앨범을 가져오자.
		List<AlbumDTO> newAlbumList = new ArrayList<AlbumDTO>();
		for(ArtistDTO artists : newArtistList) {			
			// 1-1. 최근 날짜 가져오기 - 아티스트로 검색
			String recentDate = this.streamingDAO.getRecentAlbumDate(artists.getArartist());
			// 1-2. 가져온 최근 날짜와 아티스트 명으로 앨범 정보 가져오기
			// List에 저장하기
			newAlbumList.add(this.streamingDAO.getAlbumInfo_date(recentDate, artists.getArartist()));
		}
		// 아티스트의 앨범 이미지 가져오기
		List<FileupDTO> newAlbumFileList = this.streamingDAO.fileupAlbumList(newAlbumList);
		// 앨범 가격, 장르 가져오기
		List<Integer> newAlbumPrices = new ArrayList<Integer>();
		for(AlbumDTO albumDTO : newAlbumList) {
			int aprice = this.streamingDAO.getGenreAndPriceOfMusic(albumDTO.getAnum());
			newAlbumPrices.add(aprice);
		}
		
		// *********** NEW ARTISTS 부분 끝 *********** 
		
		// ******** ARTIST CHARTS BY GENRE 부분 시작 *********
		// 음악 DB에 존재하는 장르 가져오기 - 중복 제거된 List
		List<String> genreList = this.streamingDAO.getTotalGenreList();
		// 장르별로 존재하는 음악수 가져오기
		List<Integer> genreCounts = new ArrayList<Integer>();
		for(String s : genreList) {
			genreCounts.add(this.streamingDAO.getGenreCount(s.toString()));
		}
		
		// ******** ARTIST CHARTS BY GENRE 부분 끝 *********
		// 상단 부분
		model.addAttribute("featuredAlbums", featuredAlbums);
		model.addAttribute("featuredImgs", featuredImgs);
		model.addAttribute("aprices", aprices);
		model.addAttribute("mgenres", mgenres);
		// 하단 부분
		model.addAttribute("page", pageMaker);
		model.addAttribute("newArtistList", newArtistList);
		model.addAttribute("newArtistImgList", newArtistFileList);
		model.addAttribute("newAlbumList", newAlbumList);
		model.addAttribute("newAlbumFileList", newAlbumFileList);
		model.addAttribute("newAlbumPrices", newAlbumPrices);
		// 장르 부분
		model.addAttribute("genreList", genreList);
		model.addAttribute("genreCounts", genreCounts);
		return "artist/featuredPage";
	}

	// 아티스트 페이지의 하단리스트 AJAX 처리를 위함
	@Transactional
	public String artistNewCharts(int curPage, int perPage, Model model) {
		// *********** NEW ARTISTS 부분 시작 *********** 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		// 한 페이지당 6개가져오기 위함
		pageMaker.makeRow();
		// artists에 count값 가져와서 page처리 세팅
		pageMaker.makePage(this.streamingDAO.artistTotalCount());
		// 페이징 처리된 리스트 가져오기
		List<ArtistDTO> newArtistList = this.streamingDAO.artistfeaturedPage(pageMaker);	
		// 페이징 처리된 아티스트 사진 가져오기
		List<FileupDTO> newArtistFileList = this.streamingDAO.fileupArtistList(newArtistList);
		// 아티스트의 새 앨범 가져오기 - 최근 날짜의 앨범을 가져오자.
		List<AlbumDTO> newAlbumList = new ArrayList<AlbumDTO>();
		for(ArtistDTO artists : newArtistList) {			
			// 1-1. 최근 날짜 가져오기 - 아티스트로 검색
			String recentDate = this.streamingDAO.getRecentAlbumDate(artists.getArartist());
			// 1-2. 가져온 최근 날짜로 앨범 정보 가져오기
			// List에 저장하기
			newAlbumList.add(this.streamingDAO.getAlbumInfo_date(recentDate, artists.getArartist()));
		}
		// 아티스트의 앨범 이미지 가져오기
		List<FileupDTO> newAlbumFileList = this.streamingDAO.fileupAlbumList(newAlbumList);
		// 앨범 가격, 장르 가져오기
		List<Integer> newAlbumPrices = new ArrayList<Integer>();
		for(AlbumDTO albumDTO : newAlbumList) {
			int aprice = this.streamingDAO.getGenreAndPriceOfMusic(albumDTO.getAnum());
			newAlbumPrices.add(aprice);
		}
		// *********** NEW ARTISTS 부분 끝 *********** 

		model.addAttribute("page", pageMaker);
		model.addAttribute("newArtistList", newArtistList);
		model.addAttribute("newArtistImgList", newArtistFileList);
		model.addAttribute("newAlbumList", newAlbumList);
		model.addAttribute("newAlbumFileList", newAlbumFileList);
		model.addAttribute("newAlbumPrices", newAlbumPrices);
		return "artist/newChartsPage";
	}
	// ArtistView - 아티스트 정보, 음악 정보(판매량이 많은 순서대로) 가져오기
	public String artistView(String arartist, Model model) {
		// 1. 아티스트 정보 가져오기
		ArtistDTO artistDTO = this.streamingDAO.artistView(arartist);
		// 코드 재사용성을 위해
		List<ArtistDTO> artist = new ArrayList<ArtistDTO>();
		artist.add(artistDTO);
		// 2. 아티스트 이미지 가져오기 -> 1개의 이미지를 가져오지만 코드 재사용을 위해 List를 쓰겠음 
		List<FileupDTO> artistImgs = this.streamingDAO.fileupArtistList(artist);
		// 2-1 > FileupDTO 꺼내서 model 처리
		FileupDTO artistImg = artistImgs.get(0);
		// 3. 앨범 리스트 페이지 만들기
		PageMaker albumPage = new PageMaker();
		albumPage.setCurPage(1);
		albumPage.setPerPage(4);
		albumPage.makeRow();
		List<AlbumDTO> albumList = this.streamingDAO.getAlbumList_map(arartist, albumPage);
		// 페이지 만들기
		albumPage.makePage(albumList.size());
		// 4. 음악 차트 페이지 만들기
		PageMaker musicPage = new PageMaker();
		musicPage.setCurPage(1);
		musicPage.setPerPage(6);
		musicPage.makeRow();
		// 아티스트의 모든 앨범 가져오기
		List<AlbumDTO> albums = this.streamingDAO.getAlbumList_name(arartist);
		// 5. 모든 음악 정보 가져오기
		// 모든앨범의 모든 음악을 저장하기 위한 List
		List<MusicDTO> allMusic = new ArrayList<MusicDTO>();
		for(AlbumDTO a : albums) {
			// 앨범 번호로 관련된 음악들 가져오기
			List<MusicDTO> mList = this.streamingDAO.getMusicList_anum(a.getAnum());
			for(MusicDTO m : mList) {
				// 음악 리스트를 개별로 담아두기
				allMusic.add(m);
			}	
		}
		// 페이지 만들기 - sub
		musicPage.makePage(allMusic.size());
		// 
		// 5-2 > 판매율이 높은 음악 리스트 10개를 가져오기 - music으로 접근해야함
		// 임시적으로 정렬을 위한 배열
		int [] tempArr = new int[allMusic.size()];
		for(int i=0; i<allMusic.size(); i++) {
			tempArr[i] = allMusic.get(i).getMcounts();
		}
		// 정렬하기
		for(int i=0; i<tempArr.length; i++) {
			for(int j=0; j<tempArr.length; j++) {
				if(tempArr[i] > tempArr[j]) {
					int temp = tempArr[i];
					tempArr[i] = tempArr[j];
					tempArr[j] = temp;
				}
			}
		}
		// top 10 음악
		List<MusicDTO> tenMusic = new ArrayList<MusicDTO>();
		for(int i=0; i<tempArr.length; i++) {
			// 모든 음악이 10개 미만일때 ex 사이즈가 5이고 배열길이도 5이면 break;
			if(tenMusic.size() == tempArr.length) {
				break;
			}
			for(int j=0; j<allMusic.size(); j++) {
				// 10개 순위 꽉참. 모든 숫자가 0인경우(단 한개도 판매가 되지 않은 경우) 
				// 아무렇게 막들어가서 10개 넘어가기 때문에
				if(tenMusic.size() == 10) {
					break;
				} else {
					if(tempArr[i] == allMusic.get(j).getMcounts()) {
						tenMusic.add(allMusic.get(j));
					} 					
				}
			}
		}

		// top 10 음악의 앨범 매칭 시켜주는 작업
		List<AlbumDTO> tenAlbum = new ArrayList<AlbumDTO>();
		for(MusicDTO m : tenMusic) {			
			AlbumDTO albumDTO = this.streamingDAO.albumView(m.getAnum());
			tenAlbum.add(albumDTO);
		}

		model.addAttribute("artist", artistDTO);
		model.addAttribute("artistImg", artistImg);
		model.addAttribute("albumPage", albumPage);
		model.addAttribute("musicPage", musicPage);
		model.addAttribute("tenMusic", tenMusic);
		model.addAttribute("tenAlbum", tenAlbum);
		return "artist/artistView";
	}

	//  LATEST ALBUMS - AJAX 요청 (앨범, 앨범 이미지 가져오기) 리스트로 perPage는 4
	public String artistLatestAlbums (String arartist, int curPage, 
			int perPage, Model model) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();

		// 앨범 정보 가져오기
		List<AlbumDTO> albumList = this.streamingDAO.getAlbumList_map(arartist, pageMaker);
		// 페이지 만들기
		pageMaker.makePage(albumList.size());
		// 앨범 이미지 가져오기
		List<FileupDTO> albumImgList = this.streamingDAO.fileupAlbumList(albumList);
		// 앨범 가격 가져오기
		List<Integer> albumPrices = new ArrayList<Integer>();
		for(AlbumDTO albumDTO : albumList) {
			int aprice = this.streamingDAO.getGenreAndPriceOfMusic(albumDTO.getAnum());
			albumPrices.add(aprice);
		}	
		model.addAttribute("albumList", albumList);
		model.addAttribute("albumImgList", albumImgList);
		model.addAttribute("albumPrices", albumPrices);
		return "artist/latestAlbumsPart";
	}

	// MUSIC CHARTS - AJAX 요청 (음악, 아티스트 이미지, 앨범 이미지 가져오기)
	public String artistMusicCharts (String arartist, int curPage, Model model) {
		// ************************************************************
		// 1. fsection='artist', subsection='아티스트 이름'으로 이미지 가져오기
		ArtistDTO artistDTO = this.streamingDAO.artistView(arartist);
		// 코드 재사용성을 위해
		List<ArtistDTO> artist = new ArrayList<ArtistDTO>();
		artist.add(artistDTO);
		// 아티스트 이미지 가져오기 -> 1개의 이미지를 가져오지만 코드 재사용을 위해 List를 쓰겠음 
		List<FileupDTO> artistImg = this.streamingDAO.fileupArtistList(artist);
		// ************************************************************

		// ************************************************************
		// 2. 아티스트의 모든 앨범 가져오기
		List<AlbumDTO> albums = this.streamingDAO.getAlbumList_name(arartist);
		// 3. 모든 음악 정보 가져오기
		// 모든앨범의 모든 음악을 저장하기 위한 List
		List<MusicDTO> allMusic = new ArrayList<MusicDTO>();
		for(AlbumDTO a : albums) {
			// 앨범 번호로 관련된 음악들 가져오기
			List<MusicDTO> mList = this.streamingDAO.getMusicList_anum(a.getAnum());
			for(MusicDTO m : mList) {
				// 음악 리스트를 개별로 담아두기
				allMusic.add(m);
			}	
		}
		// 6개씩만 jsp 음악들을 뿌려주기 pageMaker를 하지않고 직접하기
		// DB에서 가져오는부분들이 불편하기 때문에 직접하기
		List<MusicDTO> sixMusic = new ArrayList<MusicDTO>();
		// 인덱스 범위 설정
		int startIndex = (curPage-1)*6;
		int lastIndex = curPage*6;
		for(int i=startIndex; i<lastIndex; i++) {
			if( i == allMusic.size() ) {
				break;
			} else {			
				sixMusic.add(allMusic.get(i));
			}
		}
		// ************************************************************

		// ************************************************************
		// 6개의 음악리스트를 통해서 앨범, 앨범 이미지 매칭하기
		List<AlbumDTO> sixAlbum = new ArrayList<AlbumDTO>();
		for(MusicDTO m : sixMusic) {			
			AlbumDTO albumDTO = this.streamingDAO.albumView(m.getAnum());
			sixAlbum.add(albumDTO);
		}
		// 파일에서 section = 앨범제목, subsection = 가수
		List<FileupDTO> sixAlbumImg = this.streamingDAO.fileupAlbumList(sixAlbum);	
		// ************************************************************

		model.addAttribute("artistImg", artistImg);
		model.addAttribute("sixMusic", sixMusic);
		model.addAttribute("sixAlbum", sixAlbum);
		model.addAttribute("sixAlbumImg", sixAlbumImg);
		return "artist/musicChartsPart";
	}
}
