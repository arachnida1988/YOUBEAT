package com.you.board;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "BoardMapper.";
	
	// Write
	public int boardWrite(BoardDTO boardDTO) throws Exception {
		return this.sqlSession.insert(namespace+"boardWrite", boardDTO);
	}
	
	// Update
	public int boardUpdate(BoardDTO boardDTO) throws Exception {
		return this.sqlSession.update(namespace+"boardUpdate", boardDTO);
	}
	
	
	// Reply
	public int boardReply(BoardDTO boardDTO) throws Exception {
		return this.sqlSession.insert(namespace+"boardReply", boardDTO);
	}
	
	// Delete
	public int boardDelete(int bnum) throws Exception {
		return this.sqlSession.delete(namespace+"boardDelete", bnum);
	}	
	
	// List
	
	// totalCount 총 게시글 수 가져오기
	
	// ParentUpdate - 부모글 ref, step 증가
	
	// View

	// plusCounts 조회수 증가
}
