package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Activity;
import com.yc.service.IActivityService;
@Component
public class ActivityService extends GenericService<Activity> implements IActivityService {
    
	@Autowired
	GenericDao<Activity> ActivityDao;

	@Override
	GenericDao<Activity> getDao() {
		return ActivityDao;
	}

}
