package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.CarCommodity;
import com.yc.service.ICarCommodityService;
@Component
public class CarCommodityService extends GenericService<CarCommodity> implements ICarCommodityService {

	@Autowired
	GenericDao<CarCommodity> carCommoidtyDao;

	@Override
	GenericDao<CarCommodity> getDao() {
		return carCommoidtyDao;
	}
}
