package com.spring.getjob.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.getjob.board.mapper.BoardMapper;
import com.spring.getjob.board.vo.BoardVO;
import com.spring.getjob.paging.PageVO;

@Repository
public class BoardDaop implements BoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void deleteBoard(int id) throws Exception {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		mapper.deleteBoard(id);
		
	}
	
	@Override
	public int getTotalCount(PageVO vo) throws Exception {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);	
		return mapper.getTotalCount(vo);
	}
	
	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		mapper.insertBoard(vo);
		
	}
	
	@Override
	public List<BoardVO> listPage(PageVO vo) throws Exception {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		return mapper.listPage(vo);
		
	}
	
	@Override
	public BoardVO selectBoard(BoardVO vo) throws Exception {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		return mapper.selectBoard(vo);
	}
	
	@Override
	public List<BoardVO> selectList(BoardVO vo) throws Exception {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		return mapper.selectList(vo);
		
	}
	
	@Override
	public void updateBoard(BoardVO vo) throws Exception {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		mapper.updateBoard(vo);
		
	}
	
	@Override
	public void updateViewCnt(int id) throws Exception {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		mapper.updateViewCnt(id);
		
	}
	
	

}
