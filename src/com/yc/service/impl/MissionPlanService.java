package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.MissionPlan;
import com.yc.entity.ShopCommImage;
import com.yc.service.IMissionPlanService;
import com.yc.service.IShopCommImageService;

@Component
public class MissionPlanService extends GenericService<MissionPlan> implements IMissionPlanService {

	@Autowired
	GenericDao<MissionPlan> missionPlanDao;
	
	@Override
	GenericDao<MissionPlan> getDao() {
		return missionPlanDao;
	}

}
