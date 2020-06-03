package com.spring.getjob.board.mapper;

import java.util.List;

import com.spring.getjob.board.vo.BoardVO;
import com.spring.getjob.paging.PageVO;

public interface BoardMapper {
	
	// 게시물 리스트 조회
		public List<BoardVO> selectList(BoardVO vo) throws Exception;
		
		// 게시물 등록
		public void insertBoard(BoardVO vo) throws Exception;
		
		// 게시물 수정
		public void updateBoard(BoardVO vo) throws Exception;
		
		// 게시물 삭제
		public void deleteBoard(int id) throws Exception;
		
		// 게시물 조회
		public BoardVO selectBoard(BoardVO vo) throws Exception;
		
		// 조회수 증가
		public int updateViewCnt(int id) throws Exception;
		
		// 리스트페이지 
		public List<BoardVO> listPage(PageVO vo) throws Exception;
		
		// 최대게시글
		public int getTotalCount(PageVO vo) throws Exception;

}
