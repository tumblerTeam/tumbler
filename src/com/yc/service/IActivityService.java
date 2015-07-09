package com.yc.service;

import java.util.List;

import com.yc.entity.Activity;

public interface IActivityService extends IGenericService<Activity> {

	/**
	 * 通过活动是否开关查询活动
	 * @param b 是否开启活动
	 * @return
	 */
	List<Activity> getAllByOpenOrClose(boolean b);

}
