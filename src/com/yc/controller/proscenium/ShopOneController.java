package com.yc.controller.proscenium;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommodity;
import com.yc.entity.ShopCommoditySpecs;
import com.yc.entity.ShopReviews;
import com.yc.entity.user.AppUser;
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
	IShopReviewsService shopReviewsService;// 评论

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

	@Autowired
	ICurrencyService currencyService;

	@Autowired
	ICommodityService commodityService;

	@Autowired
	IOrderFormService orderFormService;

	// 购物Item
	@RequestMapping(value = "shopItem", method = RequestMethod.GET)
	public ModelAndView shopItem(Integer commID, Integer category, Integer shopID, String commoName, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		ShopCategory cate = shopCategService.findById(category);
		List<ShopReviews> reviewslist = shopReviewsService.getAllBycommCode(commID);
		mode.put("reviewslist", reviewslist);
		List<ShopCategory> shopcates = new ArrayList<ShopCategory>();
		shopcates.add(cate);
		mode.put("specifications", cate.getSpecifications());
		String strs = "";
		while (cate.getParentLevel() != null) {
			cate = shopCategService.findById(cate.getParentLevel().getCategoryID());
			if (cate != null) {
				shopcates.add(cate);
			}
		}
		for (int i = shopcates.size() - 1; i >= 0; i--) {
			strs = strs + shopcates.get(i).getCategoryID() + "-" + shopcates.get(i).getCategory() + "|";
		}
		List<ShopCategory> shopcategories = shopCategService.getAll();
		mode.put("shopCategories", shopcategories);
		mode.put("nvabar", strs.substring(0, strs.length() - 1));
		ShopCommodity shopCommoidty = shopCommService.findById(commID);
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		List<String> specStrs = null;
		mode.put("shopCommoidty", shopCommoidty);
		ShopCommoditySpecs shopSpecs = shopCommoidty.getCommsPecs();
		if (shopSpecs != null) {
			String spec = shopSpecs.getCommSpec();
			String[] specs = spec.split(",");
			if (specs.length > 0) {
				for (int i = 0; i < specs.length; i++) {
					if (!specs[i].equals("")) {
						if (map.containsKey(specs[i].split("-")[0])) {
							specStrs = map.get(specs[i].split("-")[0]);
							if (!specStrs.contains(specs[i].split("-")[1])) {
								specStrs.add(specs[i].split("-")[1]);
							}
						} else {
							specStrs = new ArrayList<String>();
							specStrs.add(specs[i].split("-")[1]);
							map.put(specs[i].split("-")[0], specStrs);
						}
					}
				}
			}
		}
		List<ShopCategory> list = shopCategService.getAllByParent();
    	mode.put("categories", list);
		mode.put("map", map);
		AppUser user = (AppUser) request.getSession().getAttribute("loginUser");
		mode.put("user", user);
		return new ModelAndView("reception/shopItem", mode);
	}
}
