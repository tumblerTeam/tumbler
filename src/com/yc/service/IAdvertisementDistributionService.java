package com.yc.service;

import java.util.List;

import com.yc.entity.AdvertiseDistribution;

public interface IAdvertisementDistributionService extends IGenericService<AdvertiseDistribution>{

	/**
	 * 根据广告页得到所有广告位置分布
	 * @param whichPage 广告页面
	 * @return
	 */
	public List<AdvertiseDistribution> getAdvertiseDistributionsByWhichPage(String whichPage);
	
	/**
	 * 通过广告页面和广告位置查询该广告
	 * @param whichPage 广告页面
	 * @param position  广告位置
	 * @return
	 */
	public AdvertiseDistribution findByWhichPageAndPosition(String whichPage, String position);
	
	/**
	 * 得到所有广告页，AJAX用
	 * @return
	 */
	public List<String> getDistinctWhichPage();

}
