package com.you.beat;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.you.mp3.Mp3DTO;
import com.you.mp3.Mp3Service;

@Controller
@RequestMapping(value = "/json")
@ResponseBody
public class JsonController {
	
	@Autowired
	private Mp3Service mp3Service;
	
	@RequestMapping(value = "/mp3List", produces="application/json; charset=utf-8")
	public String mp3List(Model model){
		List<Mp3DTO> list = mp3Service.mp3List(model);
		JSONArray json = new JSONArray();
		for(int i=0;i<list.size();i++){
			JSONObject song = new JSONObject();
			song.put("url", "../resources/upload/"+list.get(i).getMfilename());
			song.put("album", list.get(i).getAlbumname());
			song.put("artist", list.get(i).getArtist());
			song.put("name", list.get(i).getTitle());
			song.put("live", false);
			song.put("cover_art_url", "../resources/amplitudejs-master/examples/images/theweatherman.jpg");
			json.add(song);
		}
		//song.put("default_album_art", "../resources/amplitudejs-master/examples/playlist-album-art/images/no-cover-large.png");
		System.out.println(json.toJSONString());
		return json.toJSONString();
		
		/*return new ResponseEntity<List<Mp3DTO>>(mp3Service.mp3List(model), HttpStatus.OK);*/
	}
	
}
