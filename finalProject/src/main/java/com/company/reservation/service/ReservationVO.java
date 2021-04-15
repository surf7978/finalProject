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
	//결제
	String resultPrice;
}
