package com.company.reservation.service;

import lombok.Data;

@Data
public class ReservationVO {
	String reservationNumber;
	String optionName;
	String reservationDate;
	String reservationState;
	String memberId;
	String pndNumber;
	String bisNumber;
	String name;
	String reservationTime;
	String businessNumber;
	String reviewNumber;
	
	//결제
	String resultPrice;
	
	//paging과 관련된 값만 더 추가
	Integer page = 1;
	//null 체크하려면integer이 편함
	int start1 = 1;
	int end1 = 10;
}
