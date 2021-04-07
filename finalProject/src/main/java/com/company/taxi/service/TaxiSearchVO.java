package com.company.taxi.service;

import lombok.Data;

@Data
public class TaxiSearchVO extends TaxiVO {
	String search;
	String searchValue;
	// paging
	Integer page = 1;
	Integer start = 1;
	Integer end = 10;
}
