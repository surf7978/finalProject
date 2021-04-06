package com.company.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.board.service.BoardService;
import com.company.board.service.BoardVO;

@Service
public class BoardServiceimpl implements BoardService{
	
	@Autowired BoardMapper BoardMapper;
	//등록
	@Override
	public int insertBoard(BoardVO vo) {
		return BoardMapper.insertBoard(vo);
	}
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
	@Override
	public int insertBoardCr4(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}


}
