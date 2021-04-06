package com.company.reservation.service;

import lombok.Data;

@Data
public class ReservationVO {
	String reservationNumber;
	String optionName;
	String reservationDate;
	String reservationState;
	String memberId;
	String deliveryNumber;
	String bisNumber;
	String name;
}
