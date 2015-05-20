package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.AgriculturalsSort;
import com.yc.entity.Language;
import com.yc.service.IAgriculturalsSortService;

@Component
public class AgriculturalsSortService extends GenericService<AgriculturalsSort> implements IAgriculturalsSortService {

	@Autowired
	GenericDao<AgriculturalsSort> genericDao;
	
	@Override
	GenericDao<AgriculturalsSort> getDao() {
		return genericDao;
	}

	@Override
	public List<AgriculturalsSort> getSortByParent(Language chinese) {
		StringBuffer hql = new StringBuffer(" from AgriculturalsSort depart where depart.parentLevel.id is null and depart.language = '"+chinese+"'");
		return genericDao.find(hql.toString(), null, null);
	}

	@Override
	public List<AgriculturalsSort> getSortByParent() {
		StringBuffer hql = new StringBuffer(" from AgriculturalsSort depart where depart.parentLevel.id is null ");
		return genericDao.find(hql.toString(), null, null);
	}
	
	@Override
	public boolean deleteSort(AgriculturalsSort dep) {
		StringBuffer hql = new StringBuffer("DELETE FROM AgriculturalsSort WHERE id = "+dep.getId());
		genericDao.getEntityManager().getTransaction().begin();
		boolean isok = genericDao.getEntityManager().createNativeQuery(hql.toString(), AgriculturalsSort.class).executeUpdate()>0;
		genericDao.getEntityManager().getTransaction().commit();
		genericDao.getEntityManager().clear();
		return isok;
	}
}
