package com.company.eventAndNotice.service.impl;

import java.util.List;

import com.company.eventAndNotice.service.EventAndNoticeVO;

public interface EventAndNoticeMapper {
	public int insertEventAndNotice(EventAndNoticeVO vo);
	public EventAndNoticeVO getEventAndNotice(EventAndNoticeVO vo);
	public List<EventAndNoticeVO> getSearchEventAndNotice(EventAndNoticeVO vo);
	public List<EventAndNoticeVO> getSearchEventAndNoticeSelect(EventAndNoticeVO vo);//이벤트 혹은 공지사항
	public int updateEventAndNotice(EventAndNoticeVO vo);
	public int deleteEventAndNotice(EventAndNoticeVO vo);
}
