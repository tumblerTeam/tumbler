package com.yc.service;

import java.util.List;

import com.yc.entity.AgriculturalsSort;
import com.yc.entity.Language;

public interface IAgriculturalsSortService extends IGenericService<AgriculturalsSort> {

	List<AgriculturalsSort> getSortByParent(Language chinese);

	boolean deleteSort(AgriculturalsSort dep);

	List<AgriculturalsSort> getSortByParent();

}
