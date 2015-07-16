package com.yc.service;

import java.util.List;
import java.util.Map;

import com.yc.entity.ShopCommodity;

public interface IShopCommodityService extends IGenericService<ShopCommodity> {

	/***
	 * 通过商家ID查找该商家商品
	 * @param id 商家ID
	 * @return
	 */
	List<ShopCommodity> getAllByShop(Integer id);

	/***
	 * 通过boolean条件和商家ID查询该商家商品
	 * @param condition boolean条件
	 * @param isTrue boolean条件的值
	 * @param shopID 商家ID
	 * @return
	 */
	List<ShopCommodity> getAllByCondition(String condition, boolean isTrue, Integer shopID);

	/***
	 * 通过商品类别ID和page查询商家商品
	 * @param id 类别ID
	 * @param page page=brand 查询品牌商品 page=special 查询折扣商品
	 * @param one  起始位置
	 * @param last 结束位置
	 * @return
	 */
	List<ShopCommodity> getAllByShopCategoryID(Integer id, String page,int one ,int last);

	/***
	 * 通过 规格、价格区段、类别ID、品牌ID查询商品
	 * @param map specs %,xx,%@%,xx,%规格、  money xxx@xxx价格区间段、 id类别ID、 brand (xxx,xxx) 品牌ID
	 * @param page special 折扣商品查询  brand品牌商品查询
	 * @return
	 */
	List<ShopCommodity> getAllByParams(Map<String, Object> map, String page);

	/***
	 * 通过商品名称、商家ID查询商品
	 * @param commoName 商品名称
	 * @param shopID 商家ID
	 * @return
	 */
	List<ShopCommodity> getAllByNameAndShop(String commoName, Integer shopID);

	/***
	 * 通过商品货号、商家ID查询商品
	 * @param commItem 商品货号
	 * @param id 商家ID
	 * @return
	 */
	ShopCommodity getAllByCommItemAndShop(String commItem, Integer id);

	/***
	 * 通过商品规格查询商品的规格
	 * @param speces 商品规格
	 * @return
	 */
	List<String> getShopCommBySpeces(String speces);

	/***
	 * 通过商品商品名称、货号、商品编码
	 * @param map commoidtyName商品名称、commItem商品货号、commCode商品编码
	 * @return
	 */
	List<ShopCommodity> getAllByParamsForBlack(Map<String, Object> map);
	
	/***
	 * 通过商品折扣、类别ID查询商品
	 * @param CateId 如果CateId<=1查询所有商品,CateId>1查询类别下的商品
	 * @param flag 是否折扣
	 * @return
	 */
	List<ShopCommodity> getShopCommByCateAndIsspecial(Integer CateId, Boolean flag);

	/***
	 * 通过商品类别Id查询品牌商品
	 * @param id 类别ID id<=1 查询所有品牌商品 id>1 查询类别下的所有品牌商品
	 * @return
	 */
	List<ShopCommodity> getShopCommByCateAndBrand(Integer id);

	/***
	 * 通过品牌ID查询品牌商品
	 * @param id 品牌ID
	 * @return
	 */
	List<ShopCommodity> getShopCommByBrandId(Integer id);
	
	/***
	 * 通过商品名称或者商品类别名称或者品牌名称模糊查询商品，用于搜索栏
	 * @param content 商品名称 or 商品类别名称 or 品牌名称
	 * @return
	 */
	List<ShopCommodity> searchShopComm(String content);

	/**
	 * 通过名庄ID和显示个数查询名庄商品
	 * @param id 名庄ID
	 * @param i 显示个数
	 * @return
	 */
	List<ShopCommodity> getAllByFamousManorID(Integer id, int i);

	/**
	 * 通过店铺ID查询该商铺下所有名庄产品
	 * @param id  店铺ID
	 * @return
	 */
	List<ShopCommodity> getFamousCommodityByShop(Integer id);

	/***
	 * 通过 规格、价格区段、一级类别ID、品牌ID查询商品
	 * @param map specs %,xx,%@%,xx,%规格、  money xxx@xxx价格区间段、 id 一级类别ID、 brand (xxx,xxx) 品牌ID
	 * @param page special 折扣商品查询  brand品牌商品查询
	 * @return
	 */
	List<ShopCommodity> getAllByParamsForParent(Map<String, Object> map, String string);
	
	/**
	 * 通过 商品名称 %CommName%,类别名称查询CateName,店铺id
	 * @return
	 */
	List<ShopCommodity> getAllByCommNameAndCateName(String key,Integer id);

	/**
	 * 得到所有参加活动的商品
	 * @return
	 */
	List<ShopCommodity> getActivityCommodity();

	/**
	 * 通过commItem搜索商品
	 * @return
	 */
	List<ShopCommodity> getCommBycommItem(String commItem);

	/**
	 * 
	 * @param cname 商品名称
	 * @param bname 品牌名称
	 * @param category 类别名称
	 * @param shopId 店铺ID
	 * @return
	 */
	List<ShopCommodity> searchShopCommBrand(String cname, String category, Integer shopId);
	
}
