package com.yc.service;

import java.util.List;

import com.yc.entity.Language;
import com.yc.entity.News;

public interface INewsService extends IGenericService<News> {

	List<News> getNewsByLangage(Language chinese);

}
