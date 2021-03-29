package com.company.board.service.impl;

import java.util.List;

import com.company.board.service.BoardVO;

public interface BoardMapper {
	public int insertBoard(BoardVO vo);
	public BoardVO getBoard(BoardVO vo);
	public List<BoardVO> getSearchBoard(BoardVO vo);
	public int updateBoard(BoardVO vo);
	public int deleteBoard(BoardVO vo);
}
