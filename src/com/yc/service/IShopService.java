package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.Shop;

public interface IShopService extends IGenericService<Shop> {

	/***
	 * 通过用户ID查询商家店面
	 * @param id 用户ID
	 * @return
	 */
	Shop getShopByUser(Integer id);

	/***
	 * 通过商家名称、法人名字、商家电话查询商家
	 * @param map shopName like 商家名称, juridicalPerson like 法人名字, phone 商家电话
	 * @return
	 */
	List<Shop> getShopByParam(Map<String, Object> map);

	/***
	 * 查询所有允许开店的商家
	 * @param b 已经开店或者正申请开店
	 * @return
	 */
	List<Shop> getShopForManage(boolean b);

	/**
	 * 通过Boolean查询开通或者关闭名庄权限的商家
	 * @param b  Boolean 值
	 * @return
	 */
	List<Shop> getShopManorByBool(boolean b);
	
	/**
	 * 通过idCard查询商家是否存在
	 * @param idcard String
	 * @return shop
	 */
	Shop getShoByIdCard(String idcard);

}
