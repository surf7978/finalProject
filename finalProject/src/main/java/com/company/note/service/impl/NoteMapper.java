package com.company.note.service.impl;

import java.util.List;

import com.company.note.service.NoteVO;

public interface NoteMapper {
	public int insertMember(NoteVO vo);
	public NoteVO getMember(NoteVO vo);
	public List<NoteVO> getSearchMember(NoteVO vo);
	public int updateMember(NoteVO vo);
	public int deleteMember(NoteVO vo);
}
