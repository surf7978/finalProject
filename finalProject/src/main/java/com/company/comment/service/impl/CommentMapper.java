package com.company.comment.service.impl;

import java.util.List;

import com.company.comment.service.CommentVO;

public interface CommentMapper {
	public int insertMember(CommentVO vo);
	public CommentVO getMember(CommentVO vo);
	public List<CommentVO> getSearchMember(CommentVO vo);
	public int updateMember(CommentVO vo);
	public int deleteMember(CommentVO vo);
}
