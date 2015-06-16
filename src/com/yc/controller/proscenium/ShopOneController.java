package com.yc.controller.proscenium;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.service.IAppUserService;
import com.yc.service.IBrandService;
import com.yc.service.ICommodityService;
import com.yc.service.ICurrencyService;
import com.yc.service.IOrderFormService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommImageService;
import com.yc.service.IShopCommodityService;
import com.yc.service.IShopCommoidtySpecsService;
import com.yc.service.IShopReviewsService;
import com.yc.service.IShopService;
import com.yc.service.ISpecificationsService;

//前台
@Controller
@RequestMapping("/proscenium")
public class ShopOneController {

	@Autowired
	IShopService shopService;// 商店

	@Autowired
	IShopCommodityService shopCommService;// 商品
	
	@Autowired
	IShopCommoidtySpecsService commoidtySpecsService;
	
	@Autowired
	IShopReviewsService shopReviewsService;//评论

	@Autowired
	IShopCategoryService shopCategService;// 类别

	@Autowired
	ISpecificationsService specificationService;// 货品规格

	@Autowired
	IBrandService brandService;// 品牌
	
	@Autowired
	IShopCommImageService shopCommImageService;
	
	@Autowired
	IAppUserService userService;
	
//	@Autowired
//	ISurchargesService surchargesService;
	
//	@Autowired
//	IBuyCatService buyCatService;
	
	@Autowired
	ICurrencyService currencyService;
	
	@Autowired
	ICommodityService commodityService;
	
	@Autowired
	IOrderFormService orderFormService;
	
//	@Autowired
//	IAdvertisementService advertisementService;
//	
//	@Autowired
//	IAdvertisementDistributionService adverDistributionService;
	
}
