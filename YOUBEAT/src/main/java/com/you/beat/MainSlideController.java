package com.you.beat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.you.album.AlbumDAO;
import com.you.album.AlbumDTO;
import com.you.artist.ArtistDAO;
import com.you.artist.ArtistDTO;
import com.you.fileup.FileupDAO;
import com.you.fileup.FileupDTO;
import com.you.music.MusicDAO;
import com.you.music.MusicDTO;
import com.you.streaming.StreamingService;

@Controller
@RequestMapping(value="/template")
public class MainSlideController {
	
	@Autowired
	private AlbumDAO albumDAO;
	@Autowired
	private MusicDAO musicDAO;
	@Autowired
	private ArtistDAO ArtistDAO;
	@Autowired
	private FileupDAO fileupDAO;
	@Autowired
	private StreamingService streamingService;
	
	
	@RequestMapping(value="/youbeat", method=RequestMethod.GET)
	public String slider(Model model){
		List<MusicDTO> featuredMusics = null;
		List<AlbumDTO> featuredMusicAlbums = null;
		List<FileupDTO> featuredMusicImgs = null;
		List<AlbumDTO> newAlbums = null;
		List<FileupDTO> newAlbumImgs = null;
		List<Integer> newAlbumPrices = null;
		List<AlbumDTO> featuredAlbums = null;
		List<FileupDTO> featuredAlbumImgs = null;
		List<Integer> featuredAlbumPrices = null;	
		List<ArtistDTO> artistList = null;
		List<FileupDTO> artistImgList = null;
		
		try {
			// 1. 판매량 높은 음악 가져오기
			featuredMusics = this.musicDAO.musicMaxMcountInfo();
			featuredMusicAlbums = new ArrayList<>();
			for(MusicDTO m : featuredMusics) {
				AlbumDTO a = this.albumDAO.albumView(m.getAnum());
				// 음악명이 긴 부분 substring 처리
				String title = m.getMtitle();
				if(title.length() > 20) {
					title = title.substring(0, 17)+"...";
				}
				m.setMtitle(title);
				featuredMusicAlbums.add(a);
			}
			// 1-1. 이미지 가져오기
			featuredMusicImgs = this.fileupDAO.fileupAlbumList(featuredMusicAlbums);
			
			// 2. 최신 앨범 가져오기!
			newAlbums = this.albumDAO.albumRecentlyInfo();
			// 2-1. 이미지 가져오기
			newAlbumImgs = this.fileupDAO.fileupAlbumList(newAlbums);
			// 2-2. 음악 가격 가져오기
			newAlbumPrices = new ArrayList<>();
			for(AlbumDTO a : newAlbums) {
				int price = this.musicDAO.getGenreAndPriceOfMusic(a.getAnum());
				// 앨범명이 긴 부분 substring 처리
				String title = a.getAtitle();
				if(title.length() > 20) {
					title = title.substring(0, 17)+"...";
				}
				a.setAtitle(title);
				newAlbumPrices.add(price);
			}
			 
			// 3. 판매량 높은 앨범 가져오기!
			featuredAlbums = this.albumDAO.albumMaxAcountInfo();
			// 3-1. 이미지 가져오기
			featuredAlbumImgs = this.fileupDAO.fileupAlbumList(featuredAlbums);
			// 3-2. 음악 가격 가져오기
			featuredAlbumPrices = new ArrayList<>();
			for(AlbumDTO a : featuredAlbums) {
				int price = this.musicDAO.getGenreAndPriceOfMusic(a.getAnum());
				// 앨범명이 긴 부분 substring 처리
				String title = a.getAtitle();
				if(title.length() > 20) {
					title = title.substring(0, 17)+"...";
				}
				a.setAtitle(title);
				featuredAlbumPrices.add(price);
			}
			
			// 4. 아티스와 연관된 앨범 가져오기
			artistList = this.ArtistDAO.artistRecentInfo();
			// 4-1. 이미지 가져오기
			artistImgList = this.fileupDAO.fileupArtistList(artistList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 1. 판매량 높은 음악
		model.addAttribute("featuredMusics", featuredMusics);
		model.addAttribute("featuredMusicAlbums", featuredMusicAlbums);
		model.addAttribute("featuredMusicImgs", featuredMusicImgs);
		// 2. 최신 앨범 가져오기
		model.addAttribute("newAlbums", newAlbums);
		model.addAttribute("newAlbumImgs", newAlbumImgs);
		model.addAttribute("newAlbumPrices", newAlbumPrices);
		// 3. 판매량 높은 앨범 가져오기
		model.addAttribute("featuredAlbums", featuredAlbums);
		model.addAttribute("featuredAlbumImgs", featuredAlbumImgs);
		model.addAttribute("featuredAlbumPrices", featuredAlbumPrices);
		// 4. 아티스트
		model.addAttribute("artistList", artistList);
		model.addAttribute("artistImgList", artistImgList);
		return "template/youbeat";
	}
	
	//앨범가져오기
	@RequestMapping(value="/album_addAlbum")
	@ResponseBody
	public String album_addList(@RequestParam int title,@RequestParam String artist, Model model){
		return streamingService.album_addList(title,artist,model);
	}
	
	@RequestMapping(value="/sliderTest")
	public String slideTest() {
		return "slider/sliderTest";
	}
}