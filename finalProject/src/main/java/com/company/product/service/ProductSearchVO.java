package com.company.product.service;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class ProductSearchVO extends ProductVO {
	String search; //검색
	String searchValue; //검색값
	// paging
	Integer page = 1;  
	Integer start = 1;
	Integer end = 10;
	String[] categoryList;
}
