package com.company.note.service.impl;

import java.util.List;

import com.company.note.service.NoteVO;

public interface NoteMapper {
	public int insertNote(NoteVO vo);
	public NoteVO getNote(NoteVO vo);
	public List<NoteVO> getSearchNote(NoteVO vo);
	public int updateNote(NoteVO vo);
	public int deleteNote(NoteVO vo);
}
