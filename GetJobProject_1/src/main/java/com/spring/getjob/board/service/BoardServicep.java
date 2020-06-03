package com.spring.getjob.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.getjob.board.dao.BoardDao;
import com.spring.getjob.board.vo.BoardVO;
import com.spring.getjob.paging.PageVO;

@Service
public class BoardServicep implements BoardService{
	
	@Autowired
	private BoardDao dao;
	
	
	
	@Override
	public void deleteBoard(int id) throws Exception {
		dao.deleteBoard(id);
		
	}@Override
	public int getTotalCount(PageVO vo) throws Exception {
		return dao.getTotalCount(vo);
		
	}@Override
	public void insertBoard(BoardVO vo) throws Exception {
		dao.insertBoard(vo);
		
	}@Override
	public List<BoardVO> listPage(PageVO vo) throws Exception {
		return dao.listPage(vo);
	}@Override
	public BoardVO selectBoard(BoardVO vo) throws Exception {
		BoardVO boardVO = dao.selectBoard(vo);
		return boardVO;
	}@Override
	public List<BoardVO> selectList(BoardVO vo) throws Exception {
		List<BoardVO> list = null;
		list = dao.selectList(vo);
		return list;
	}@Override
	public void updateBoard(BoardVO vo) throws Exception {
		dao.updateBoard(vo);
		
	}@Override
	public void updateViewCnt(int id) throws Exception {
		dao.updateViewCnt(id);
		
	}

}
