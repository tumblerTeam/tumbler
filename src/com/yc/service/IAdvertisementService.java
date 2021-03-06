package com.yc.service;

import java.util.List;

import com.yc.entity.Advertisement;

public interface IAdvertisementService extends IGenericService<Advertisement>{

	public Integer getAdvertiseBywhichPageAndPostion(String whichPage, String position);
	
	public List<Advertisement> getAdvertiseBywhichPageAndPostions(String whichPage, String position);

	public List<Advertisement> getAdvertiseBywhichPage(String whichPage);
}
