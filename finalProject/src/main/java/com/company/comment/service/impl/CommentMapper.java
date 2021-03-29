package com.company.comment.service.impl;

import java.util.List;

import com.company.comment.service.CommentVO;

public interface CommentMapper {
	public int insertComment(CommentVO vo);
	public CommentVO getComment(CommentVO vo);
	public List<CommentVO> getSearchComment(CommentVO vo);
	public int updateComment(CommentVO vo);
	public int deleteComment(CommentVO vo);
}
