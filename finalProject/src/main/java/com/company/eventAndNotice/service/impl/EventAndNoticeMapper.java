package com.company.eventAndNotice.service.impl;

import java.util.List;

import com.company.eventAndNotice.service.EventAndNoticeVO;

public interface EventAndNoticeMapper {
	public int insertEventAndNotice1(EventAndNoticeVO vo);	// 이벤트 등록
	public int insertEventAndNotice2(EventAndNoticeVO vo);	// 공지사항 등록
	public EventAndNoticeVO getEventAndNotice(EventAndNoticeVO vo);
	public List<EventAndNoticeVO> getSearchEventAndNotice(EventAndNoticeVO vo);
	public List<EventAndNoticeVO> getSearchEventAndNoticeSelect(EventAndNoticeVO vo);//이벤트
	public List<EventAndNoticeVO> getSearchEventAndNoticeSelect2(EventAndNoticeVO vo);//공지사항
	public int updateEventAndNotice(EventAndNoticeVO vo);
	public int deleteEventAndNotice(EventAndNoticeVO vo);
}
