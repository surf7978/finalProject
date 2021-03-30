package com.company.board.service;

import java.util.List;

public interface BoardService {
	public int insertBoard(BoardVO vo);	//화원탈퇴
	public BoardVO getBoard(BoardVO vo);	//단건조회
	public List<BoardVO> getSearchBoard(BoardVO vo);	//전체조회
	public int updateBoard(BoardVO vo);	//회원수정
	public int deleteBoard(BoardVO vo);	//화원탈퇴
}
