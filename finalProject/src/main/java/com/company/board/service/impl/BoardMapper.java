
package com.company.board.service.impl;

import java.util.List;

import com.company.board.service.BoardVO;

public interface BoardMapper {
	public int insertBoard(BoardVO vo);
	public BoardVO getBoard(BoardVO vo);
	public List<BoardVO> getSearchBoard(BoardVO vo);
	public int updateBoard(BoardVO vo);
	public int deleteBoard(BoardVO vo);
	//카테고리별 리스트 출력
	public List<BoardVO> getSearchBoardCategiry1(BoardVO vo);	
	public List<BoardVO> getSearchBoardCategiry2(BoardVO vo);	
	public int insertBoard2(BoardVO vo);	
}

