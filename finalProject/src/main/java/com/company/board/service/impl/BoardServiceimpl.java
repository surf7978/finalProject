package com.company.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.board.service.BoardService;
import com.company.board.service.BoardVO;

@Service
public class BoardServiceimpl implements BoardService{
	
	@Autowired BoardMapper BoardMapper;
	//단건조회
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return BoardMapper.getBoard(vo);
	}
	

	
	//전체조회
	@Override
	public List<BoardVO> getSearchBoard(BoardVO vo) {
		return BoardMapper.getSearchBoard(vo);
	}
	//수정
	@Override
	public int updateBoard(BoardVO vo) {
		return BoardMapper.updateBoard(vo);
	}
	
	//탈퇴
	@Override
	public int deleteBoard(BoardVO vo) {
		return BoardMapper.deleteBoard(vo);
	}
	
	//자유게시판 글쓰기
	@Override
	public int insertBoard(BoardVO vo) {
		return BoardMapper.insertBoard(vo);
	}

	
	//자랑하기 글쓰기
	@Override
	public int insertBoard2(BoardVO vo) {
		
		return BoardMapper.insertBoard2(vo);
	}
	
	//자유게시판 전체조회
	@Override
	public List<BoardVO> getSearchBoardCategiry1(BoardVO vo) {
	
		return BoardMapper.getSearchBoardCategiry1(vo);
	}
	
	//자랑하기 전체조회
	@Override
	public List<BoardVO> getSearchBoardCategiry2(BoardVO vo) {
	
		return BoardMapper.getSearchBoardCategiry2(vo);
	}
	


}
