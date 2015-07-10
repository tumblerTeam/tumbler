package com.yc.controller.init;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Repository;

import com.yc.entity.ShopCategory;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.User;
import com.yc.service.IPersonnelService;
import com.yc.service.IShopCategoryService;

@SuppressWarnings("rawtypes")
@Repository
public class InitDate implements ApplicationListener{
	
	@Resource
	IShopCategoryService categoryService;
	
	@Autowired
	IPersonnelService personnelService;
	
	@Override
	public void onApplicationEvent(ApplicationEvent arg0) {
		initArticleCategory();
	}

	private void initArticleCategory() {
		Personnel  nat = personnelService.findById(1);
		if (nat==null) {
			nat = new Personnel();
			nat.setUserName("管理员");
			nat.setLoginName("admin");
			nat.setPassword("000000");
			nat.setForbidden(false);
			personnelService.save(nat);
		}
		List<ShopCategory> categories = categoryService.getAllByParent();
		if (categories==null || categories.size()==0) {
			ShopCategory cate1 = new ShopCategory();
			cate1.setCategory("红酒");
			cate1.setIsForbidden(false);
			categoryService.save(cate1);
			ShopCategory cate2 = new ShopCategory();
			cate2.setCategory("白酒");
			cate2.setIsForbidden(false);
			categoryService.save(cate2);
			ShopCategory cate3 = new ShopCategory();
			cate3.setCategory("啤酒");
			cate3.setIsForbidden(false);
			categoryService.save(cate3);
			ShopCategory cate4 = new ShopCategory();
			cate4.setCategory("洋酒");
			cate4.setIsForbidden(false);
			categoryService.save(cate4);
			ShopCategory cate5 = new ShopCategory();
			cate5.setCategory("小食品");
			cate5.setIsForbidden(false);
			categoryService.save(cate5);
		}
	}

}
