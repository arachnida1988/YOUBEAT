package com.you.streaming;

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
	
	//tracks part list 불러오기
	public void tracksList(int curPage, int perPage, Model model){
		List<MusicDTO> music = streamingDAO.musicList(curPage, perPage, model);
		List<Mp3DTO> mp3 = streamingDAO.mp3List();
		List<ArtistDTO> artist = streamingDAO.artistList();
		List<AlbumDTO> album = streamingDAO.albumList();
		List<FileupDTO> files = streamingDAO.fileupAlbumList(album);
		
		//music == 나머지 모든 리스트 매칭 작업
		List<Mp3DTO> mp3Complete = new ArrayList<Mp3DTO>();
		List<ArtistDTO> artistComplete = new ArrayList<ArtistDTO>();
		List<AlbumDTO> albumComplete = new ArrayList<AlbumDTO>();
		List<FileupDTO> filesComplete = new ArrayList<FileupDTO>();
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
				if(albumComplete.get(m).getAtitle().equals(artist.get(n).getArartist())){
					artistComplete.add(artist.get(n));
				}
			}
		}
		System.out.println("음악리스트 사이즈 : "+music.size());
		System.out.println("매칭된 mp3 파일리스트 사이즈 : "+mp3Complete.size());	
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
		for(AlbumDTO albumDTO : featuredAlbums) {
			// 아티스트 정보 불러오기
			ArtistDTO artistDTO = this.streamingDAO.artistView(albumDTO.getAartist());
			// 음악 장르, 총 가격(앨범 가격) 가져오기
			int aprice = this.streamingDAO.getGenreAndPriceOfMusic(albumDTO.getAnum());
			featuredArtists.add(artistDTO);
			aprices.add(aprice);
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
		// *********** NEW ARTISTS 부분 끝 *********** 
		
		// ************ 장르별로 음악DTO 가져오는 부분 ***************
		// ************ 장르별로 음악DTO 가져오는 부분  끝***************
		model.addAttribute("featuredAlbums", featuredAlbums);
		model.addAttribute("featuredImgs", featuredImgs);
		model.addAttribute("aprices", aprices);
		model.addAttribute("page", pageMaker);
		model.addAttribute("newArtistList", newArtistList);
		model.addAttribute("newArtistImgList", newArtistFileList);
		model.addAttribute("newAlbumList", newAlbumList);
		model.addAttribute("newAlbumFileList", newAlbumFileList);
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
		// *********** NEW ARTISTS 부분 끝 *********** 

		model.addAttribute("page", pageMaker);
		model.addAttribute("newArtistList", newArtistList);
		model.addAttribute("newArtistImgList", newArtistFileList);
		model.addAttribute("newAlbumList", newAlbumList);
		model.addAttribute("newAlbumFileList", newAlbumFileList);
		return "artist/newChartsPage";
	}
}
