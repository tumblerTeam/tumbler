package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.service.IPackageService;
import com.yc.entity.Package;;

@Component
public class PackageService extends GenericService<Package> implements IPackageService {

	@Autowired
	GenericDao<Package> packageDao;
	
	@Override
	GenericDao<Package> getDao() {
		return packageDao;
	}

}
