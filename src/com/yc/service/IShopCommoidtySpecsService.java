package com.yc.service;

import java.util.List;

import com.yc.entity.ShopCommoidtySpecs;

public interface IShopCommoidtySpecsService extends IGenericService<ShopCommoidtySpecs>{

	/***
	 * 通过商品ID和规格查询该商品规格
	 * @param id 商品ID
	 * @param guige 商品规格
	 * @return
	 */
	ShopCommoidtySpecs getSpecsByParam(Integer id, String guige);

	/***
	 * 通过商品ID查询该商品规格
	 * @param parseInt 商品ID
	 * @return
	 */
	List<ShopCommoidtySpecs> getSpecsByShopComm(int parseInt);

}
