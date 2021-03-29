package com.company.board.service.impl;

import java.util.List;

import com.company.board.service.BoardVO;

public interface BoardMapper {
	public int insertMember(BoardVO vo);
	public BoardVO getMember(BoardVO vo);
	public List<BoardVO> getSearchMember(BoardVO vo);
	public int updateMember(BoardVO vo);
	public int deleteMember(BoardVO vo);
}
