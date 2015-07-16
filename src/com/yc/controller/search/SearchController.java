package com.yc.controller.search;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Brand;
import com.yc.entity.FamousManor;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommodity;
import com.yc.entity.Specifications;
import com.yc.service.IBrandService;
import com.yc.service.IFamousManorService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommodityService;
import com.yc.service.ISpecificationsService;

//公告管理
@Controller
@RequestMapping("/search")
public class SearchController {

	private static final Logger LOG = Logger.getLogger(SearchController.class);

	@Autowired
	IShopCategoryService shopCategService;

	@Autowired
	IShopCommodityService shopCommService;
	
	@Autowired
	IFamousManorService famousManorService;
	
	@Autowired
	ISpecificationsService specificationsService;
	
	@Autowired
	IBrandService brandService;

	@RequestMapping(value = "result", method =RequestMethod.GET)
	public ModelAndView result(String brand, Integer cateid, Integer id, String famousid, String spec, String params,String orderByPice, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ShopCategory> list = shopCategService.getAllByParent();
		mode.put("categories", list);
		if (params == null) {
			params = new String();
			if (brand != null) {
				params = params +"," +brand;
			}
			if (famousid != null) {
				params = params + "," +famousid;
			}
			if (spec != null) {
				params = params + "," +spec;
			}
		}
		if(orderByPice != null){
			mode.put("orderByPice", orderByPice);
		}
		if (cateid != null && !cateid.equals("") && id == null) {
			if (cateid < 6) {
				return extCateLeft(cateid, request, mode,params,orderByPice);
			}
		}
		
		return extOther(cateid,id, params, mode,orderByPice);
	}

	@SuppressWarnings("unused")
	private ModelAndView extOther(Integer cateid,Integer id, String params, ModelMap mode, String orderByPice) {
		ShopCategory cate = shopCategService.findById(id);
		List<ShopCategory> shopcates = new ArrayList<ShopCategory>();
		String strs = "";
		mode.put("id", id);
		mode.put("cateid", cateid);
		mode.put("params", params);
		Map<String, Object> map = new HashMap<String, Object>();
		if (orderByPice == null) {
			map.put("orderByPice", null);
			map.put("orderByXiao", null);
		} else {
			if(orderByPice.split("-")[0].equals("orderByPice")){
				map.put("orderByPice", orderByPice.split("-")[1]);
			}
			if(orderByPice.split("-")[0].equals("orderByXiao")){
				map.put("orderByXiao", orderByPice.split("-")[1]);
			}
		}
		if (id == null) {
			map.put("cateid", cateid);
			map = getMap(params, map);
			List<ShopCommodity> lists = shopCommService.getAllByParamsForParent(map, new String());
			mode.put("list", lists);
		} else {
			map.put("cateid", id);
			map = getMap(params, map);
			List<ShopCommodity> lists = shopCommService.getAllByParams(map, new String());
			mode.put("list", lists);
		}
		if (cate != null) {
			if (cate.getParentLevel().getParentLevel().getCategoryID() == 1) {
				List<FamousManor> famousManors =  famousManorService.getAll();
				mode.put("famousManors", famousManors);
			}
			mode.put("brands", cate.getParentLevel().getParentLevel().getBrands());
			mode.put("specifications", cate.getParentLevel().getParentLevel().getSpecifications());
			shopcates.add(cate);
			while (cate.getParentLevel() != null) {
				cate = shopCategService.findById(cate.getParentLevel().getCategoryID());
				if (cate != null) {
					cate.getChildren();
					shopcates.add(cate);
				}
			}
			for (int i = shopcates.size() - 1; i >= 0; i--) {
				if (i == shopcates.size() - 1) {
					cate = shopcates.get(i);
				}
				strs = strs + shopcates.get(i).getCategoryID() + "-" + shopcates.get(i).getCategory() + "|";
			}
			mode.put("cate", cate);
			System.out.println("strs======="+strs);
			mode.put("nvabar", strs.substring(0, strs.length() - 1));
		}else{
			ShopCategory cateParp = shopCategService.findById(cateid);
			shopcates.add(cateParp);
			while (cateParp.getParentLevel() != null) {
				cateParp = shopCategService.findById(cateParp.getParentLevel().getCategoryID());
				if (cateParp != null) {
					shopcates.add(cateParp);
				}
			}
			for (int i = shopcates.size() - 1; i >= 0; i--) {
				if (i == shopcates.size() - 1) {
					cateParp = shopcates.get(i);
				}
				strs = strs + shopcates.get(i).getCategoryID() + "-" + shopcates.get(i).getCategory() + "|";
			}
			if (cateParp.getCategoryID() == 1) {
				List<FamousManor> famousManors =  famousManorService.getAll();
				mode.put("famousManors", famousManors);
			}
			mode.put("cate", cateParp);
			mode.put("nvabar", strs.substring(0, strs.length() - 1));
			mode.put("brands", cateParp.getBrands());
			mode.put("specifications", cateParp.getSpecifications());
		}
		shopcates = shopCategService.getAll();
		mode.put("shopCategories", shopcates);
		return new ModelAndView("search/result", mode);
	}

	private Map<String, Object> getMap(String params, Map<String, Object> map) {
		String brands = "(";
		String specs = "";
		String money = "";
		String alcoholicStrength = "";
		String particularYear = "";
		String famousids = "(";
		String[] param = params.split(",");
		for (int i = 1; i < param.length; i++) {
			if (param[i].split("-")[0].equals("brand")) {
				brands = brands + param[i].split("-")[1] + ",";
			} else if (param[i].split("-")[0].equals("famousid")) {
				famousids = famousids + param[i].split("-")[1] + ",";
			} else if (param[i].split("-")[0].equals("money")) {
				money = param[i].split("-")[1];
			} else if (param[i].split("-")[0].equals("alcoholicStrength")) {
				alcoholicStrength = param[i].split("-")[1];
			} else if (param[i].split("-")[0].equals("particularYear")) {
				particularYear = param[i].split("-")[1];
			} else {
				if (param[i].contains("颜色-")) {
					specs = specs + "%," + param[i] + "%" + "@";
				} else {
					specs = specs + "%," + param[i] + ",%" + "@";
				}
			}
		}
		if (brands.length() > 1) {
			brands = brands.substring(0, brands.length() - 1) + ")";
		}
		if (specs.length() > 0) {
			specs = specs.substring(0, specs.length() - 1);
		}
		if (famousids.length() > 1) {
			famousids = famousids.substring(0, famousids.length() - 1) + ")";
		}
		if (brands.trim().equals("(")) {
			map.put("brand", null);
		} else {
			map.put("brand", brands);
		}
		if (famousids.trim().equals("(")) {
			map.put("famousids", null);
		} else {
			map.put("famousids", famousids);
		}
		if (specs.trim().equals("")) {
			map.put("specs", null);
		} else {
			map.put("specs", specs);
		}
		if (money.trim().equals("")) {
			map.put("money", null);
		} else {
			map.put("money", money);
		}
		if (alcoholicStrength.trim().equals("")) {
			map.put("alcoholicStrength", null);
		} else {
			map.put("alcoholicStrength", alcoholicStrength);
		}
		if (particularYear.trim().equals("")) {
			map.put("particularYear", null);
		} else {
			map.put("particularYear", particularYear);
		}
		return map;
	}

	private ModelAndView extCateLeft(Integer cateid, HttpServletRequest request, ModelMap mode,String params, String orderByPice) {
		ShopCategory cate = shopCategService.findById(cateid);
		mode.put("brands", cate.getBrands());
		mode.put("params", params);
		Map<String, Object> map = new HashMap<String, Object>();
		if (cateid == null) {
			map.put("cateid", null);
		} else {
			map.put("cateid", cateid);
		}
		if (orderByPice == null) {
			map.put("orderByPice", null);
			map.put("orderByXiao", null);
		} else {
			if(orderByPice.split("-")[0].equals("orderByPice")){
				map.put("orderByPice", orderByPice.split("-")[1]);
			}
			if(orderByPice.split("-")[0].equals("orderByXiao")){
				map.put("orderByXiao", orderByPice.split("-")[1]);
			}
		}
		map = getMap(params, map);
		List<ShopCommodity> commodites = shopCommService.getAllByParamsForParent(map, new String());
		mode.put("list", commodites);
		mode.put("cateid", cateid);
		List<ShopCategory> shopcates = new ArrayList<ShopCategory>();
		mode.put("specifications", cate.getSpecifications());
		String strs = "";
		shopcates.add(cate);
		if (cate.getCategoryID() == 1) {
			List<FamousManor> famousManors =  famousManorService.getAll();
			mode.put("famousManors", famousManors);
		}
		while (cate.getParentLevel() != null) {
			cate = shopCategService.findById(cate.getParentLevel().getCategoryID());
			if (cate != null) {
				shopcates.add(cate);
			}
		}
		for (int i = shopcates.size() - 1; i >= 0; i--) {
			if (i == shopcates.size() - 1) {
				cate = shopcates.get(i);
			}
			strs = strs + shopcates.get(i).getCategoryID() + "-" + shopcates.get(i).getCategory() + "|";
		}
		shopcates = shopCategService.getAll();
		mode.put("shopCategories", shopcates);
		mode.put("cate", cate);
		mode.put("nvabar", strs.substring(0, strs.length() - 1));
		return new ModelAndView("search/result", mode);
	}
	
	//搜索栏
	@RequestMapping(value = "searchForName", method = RequestMethod.GET)
    public ModelAndView searchForName(String paramName,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		List<ShopCommodity> list = shopCommService.searchShopComm(paramName);
 		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("search/result", mode);
    }

}
