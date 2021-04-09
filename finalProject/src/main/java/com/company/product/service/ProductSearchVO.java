package com.company.product.service;

import lombok.Data;

@Data
public class ProductSearchVO extends ProductVO {
	String search;
	String searchValue;
	// paging
	Integer page = 1;  
	Integer start = 1;
	Integer end = 10;
	String[] categoryList;
}
