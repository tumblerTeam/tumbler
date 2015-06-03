package com.yc.service;

import com.yc.entity.Brand;

public interface IBrandService extends IGenericService<Brand> {

	/***
	 * 通过品牌名称查询品牌
	 * @param brandName
	 * @return
	 */
	Brand getBrandName(String brandName);

}
