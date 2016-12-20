package com.you.fileup;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.you.album.AlbumDTO;
import com.you.artist.ArtistDTO;

@Repository
public class FileupDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace="FileupMapper.";
	
	
	
	public int fileupWrite(FileupDTO fileupDTO){
		return sqlSession.insert(namespace+"fileupWrite", fileupDTO);
	}
	
	public List<FileupDTO> fileupList(FileupDTO fileupDTO){
		return sqlSession.selectList(namespace+"fileupList");
	}
	
	public List<FileupDTO> fileupMP3(){
		return sqlSession.selectList(namespace+"fileupMP3");
	}
	
	//tracks 앨범제목과 아티스트로 1:1매칭하여 이미지 DTO리스트 뽑기
	public List<FileupDTO> fileupAlbumList(List<AlbumDTO> albumList) throws Exception{
		List<FileupDTO> ar = new ArrayList<FileupDTO>();
		for(int i=0;i<albumList.size();i++){
			FileupDTO f = new FileupDTO();
			f.setFsection(albumList.get(i).getAtitle());
			f.setFsubsection(albumList.get(i).getAartist());
			f = sqlSession.selectOne(namespace+"fileupOne", f);
			ar.add(f);
		}
		return ar;
	}
	
	// artist 이미지, 정보 가져오기
	public List<FileupDTO> fileupArtistList(List<ArtistDTO> artistList) throws Exception {
		List<FileupDTO> artistFileList = new ArrayList<FileupDTO>();
		for(int i=0; i<artistList.size(); i++) {
			FileupDTO fileupDTO = new FileupDTO();
			fileupDTO.setFsubsection(artistList.get(i).getArartist());
			fileupDTO = this.sqlSession.selectOne(namespace+"fileupArtistList", fileupDTO);
			artistFileList.add(fileupDTO);
		}
		return artistFileList;
	}
}
