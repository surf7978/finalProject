package com.company.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.board.service.BoardService;
import com.company.board.service.BoardVO;
import com.company.common.PagingVOCr4;


@Service
public class BoardServiceimpl implements BoardService{
	
	@Autowired BoardMapper boardMapper;
	//단건조회
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardMapper.getBoard(vo);
	}
	@Override
	public BoardVO getBoard2(BoardVO vo) {
		return boardMapper.getBoard2(vo);
	}

	
	//전체조회
	@Override
	public List<BoardVO> getSearchBoard(BoardVO vo) {
		return boardMapper.getSearchBoard(vo);
	}
	//수정
	@Override
	public int updateBoard(BoardVO vo) {
		return boardMapper.updateBoard(vo);
	}
	//수정2
	@Override
	public int updateBoard2(BoardVO vo) {
		return boardMapper.updateBoard2(vo);
	}
	
	//탈퇴
	@Override
	public int deleteBoard(BoardVO vo) {
		return boardMapper.deleteBoard(vo);
	}
	
	//자유게시판 글쓰기
	@Override
	public int insertBoard(BoardVO vo) {
		return boardMapper.insertBoard(vo);
	}

	
	//자랑하기 글쓰기
	@Override
	public int insertBoard2(BoardVO vo) {
		
		return boardMapper.insertBoard2(vo);
	}
	
	//자유게시판 전체조회
	@Override
	public List<BoardVO> getSearchBoardCategiry1(PagingVOCr4 vo) {
	
		return boardMapper.getSearchBoardCategiry1(vo);
	}
	
	//자랑하기 전체조회
	@Override
	public List<BoardVO> getSearchBoardCategiry2(BoardVO vo) {
	
		return boardMapper.getSearchBoardCategiry2(vo);
	}
	
	@Override
	public int getCount(BoardVO vo) {
		return boardMapper.getCount(vo);
	}
	
	@Override
	public List<BoardVO> getSearchBoardCategory199(BoardVO vo) {
		return boardMapper.getSearchBoardCategory199(vo);
	}
	@Override
	public int countBoard() {
		return boardMapper.countBoard();
	}
	@Override
	public int updateViews(BoardVO vo) {
		
		return boardMapper.updateViews(vo);
	}


}
