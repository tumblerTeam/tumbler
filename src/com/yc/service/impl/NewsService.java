package com.yc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Language;
import com.yc.entity.News;
import com.yc.service.INewsService;

@Component
public class NewsService extends GenericService<News> implements INewsService {

	@Autowired
	GenericDao<News> newsDao;
	
	@Override
	GenericDao<News> getDao() {
		return newsDao;
	}

	@Override
	public List<News> getNewsByLangage(Language chinese) {
		return newsDao.getBy("language", chinese);
	}

}
