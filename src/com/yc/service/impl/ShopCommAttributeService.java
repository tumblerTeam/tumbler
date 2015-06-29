package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.ShopCommImage;
import com.yc.entity.ShopCommodityAttribute;
import com.yc.service.IShopCommAttributeService;
import com.yc.service.IShopCommImageService;

@Component
public class ShopCommAttributeService extends GenericService<ShopCommodityAttribute> implements IShopCommAttributeService {

	@Autowired
	GenericDao<ShopCommodityAttribute> shopCommAttributeDao;
	@Override
	GenericDao<ShopCommodityAttribute> getDao() {
		return shopCommAttributeDao;
	}

}
