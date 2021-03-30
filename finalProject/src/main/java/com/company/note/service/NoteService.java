package com.company.note.service;

import java.util.List;

public interface NoteService {
	public int insertNote(NoteVO vo);	//화원탈퇴
	public NoteVO getNote(NoteVO vo);	//단건조회
	public List<NoteVO> getSearchNote(NoteVO vo);	//전체조회
	public int updateNote(NoteVO vo);	//회원수정
	public int deleteNote(NoteVO vo);	//화원탈퇴
}
