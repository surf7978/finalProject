package com.company.eventAndNotice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.eventAndNotice.service.EventAndNoticeService;
import com.company.eventAndNotice.service.EventAndNoticeVO;
import com.company.product.service.ProductVO;

@Service
public class EventAndNoticeServiceimpl implements EventAndNoticeService{
	
	@Autowired EventAndNoticeMapper EventAndNoticeMapper;
	//이벤트 등록
	@Override
	public int insertEventAndNotice1(EventAndNoticeVO vo) {
		return EventAndNoticeMapper.insertEventAndNotice1(vo);
	}
	//공지사항 등록
	@Override
	public int insertEventAndNotice2(EventAndNoticeVO vo) {
		return EventAndNoticeMapper.insertEventAndNotice2(vo);
	}
	//이벤트 단건조회
	@Override
	public EventAndNoticeVO getEventAndNotice1(EventAndNoticeVO vo) {
		return EventAndNoticeMapper.getEventAndNotice1(vo);
	}
	//공지사항 단건조회
	@Override
	public EventAndNoticeVO getEventAndNotice2(EventAndNoticeVO vo) {
		return EventAndNoticeMapper.getEventAndNotice2(vo);
	}
	
	//전체조회
	@Override
	public List<EventAndNoticeVO> getSearchEventAndNotice(EventAndNoticeVO vo) {
		// TODO Auto-generated method stub
		return EventAndNoticeMapper.getSearchEventAndNotice(vo);
	}
	@Override //이벤트 
	public List<EventAndNoticeVO> getSearchEventAndNoticeSelect(EventAndNoticeVO vo) {
		// TODO Auto-generated method stub
		return EventAndNoticeMapper.getSearchEventAndNoticeSelect(vo);
	}
	@Override //공지사항
	public List<EventAndNoticeVO> getSearchEventAndNoticeSelect2(EventAndNoticeVO vo) {
		// TODO Auto-generated method stub
		return EventAndNoticeMapper.getSearchEventAndNoticeSelect2(vo);
	}
	//공지사항 수정
	@Override
	public int updateEventAndNotice1(EventAndNoticeVO vo) {
		return EventAndNoticeMapper.updateEventAndNotice1(vo);
	}
	//이벤트 수정
	@Override
	public int updateEventAndNotice2(EventAndNoticeVO vo) {
		return EventAndNoticeMapper.updateEventAndNotice2(vo);
	}
	
	//탈퇴
	@Override
	public int deleteEventAndNotice(EventAndNoticeVO vo) {
		return EventAndNoticeMapper.deleteEventAndNotice(vo);
	}
	//레코드 건수
	@Override
	public int getCount(EventAndNoticeVO vo) {
		return EventAndNoticeMapper.getCount(vo);
	}


}
