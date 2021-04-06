package com.company.cafe.service;

import lombok.Data;

@Data
public class CafeSearchVO extends CafeVO{
	// paging
		Integer page = 1;
		Integer start = 1;
		Integer end = 10;
}
