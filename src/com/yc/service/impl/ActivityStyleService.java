package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.ActivityStyle;
import com.yc.service.IActivityStyleService;
@Component
public class ActivityStyleService extends GenericService<ActivityStyle> implements IActivityStyleService {

	@Autowired
	GenericDao<ActivityStyle> activityStyleDao;

	@Override
	GenericDao<ActivityStyle> getDao() {
		return activityStyleDao;
	}

}
