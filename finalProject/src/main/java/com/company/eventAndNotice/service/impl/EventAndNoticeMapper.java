package com.company.eventAndNotice.service.impl;

import java.util.List;

import com.company.eventAndNotice.service.EventAndNoticeVO;


public interface EventAndNoticeMapper {
	public int insertEventAndNotice1(EventAndNoticeVO vo);	// 이벤트 등록
	public int insertEventAndNotice2(EventAndNoticeVO vo);	// 공지사항 등록
	public EventAndNoticeVO getEventAndNotice1(EventAndNoticeVO vo);	//이벤트 단건조회
	public EventAndNoticeVO getEventAndNotice2(EventAndNoticeVO vo);	//공지사항 단건조회
	public List<EventAndNoticeVO> getSearchEventAndNotice(EventAndNoticeVO vo);
	public List<EventAndNoticeVO> getSearchEventAndNoticeSelect(EventAndNoticeVO vo);//이벤트전체조회
	public List<EventAndNoticeVO> getSearchEventAndNoticeSelect2(EventAndNoticeVO vo);//공지사항전체조회
	public int updateEventAndNotice1(EventAndNoticeVO vo);	//이벤트	
	public int updateEventAndNotice2(EventAndNoticeVO vo);	//공지사항
	public int deleteEventAndNotice(EventAndNoticeVO vo);
	public int getCount(EventAndNoticeVO vo);// 레코드 조회
}
