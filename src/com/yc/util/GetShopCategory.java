package com.yc.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.AdvertiseDistribution;
import com.yc.entity.AdvertisementPage;
import com.yc.entity.CarCommoidty;
import com.yc.entity.Collection;
import com.yc.entity.ShopCategory;
import com.yc.entity.Specifications;
import com.yc.entity.user.DepartAndPositions;
import com.yc.entity.user.Personnel;
import com.yc.entity.user.Positions;
import com.yc.service.IAdvertisementDistributionService;
import com.yc.service.IAdvertisementService;
import com.yc.service.ICarCommoidtyService;
import com.yc.service.ICollectionService;
import com.yc.service.ICommodityService;
import com.yc.service.IDepartAndPositionsService;
import com.yc.service.IPersonnelService;
import com.yc.service.IShopCategoryService;
import com.yc.service.ISpecificationsService;

@Controller
@RequestMapping("/getShopCategory")
public class GetShopCategory {
	
	@Autowired
	IShopCategoryService shopCategService;//类别
	
	
	@Autowired
	ICarCommoidtyService carCommoidtyService;
	
	@Autowired
	IDepartAndPositionsService departAndPositionsService;
	
	@Autowired
	IPersonnelService personnelService;
	
	@Autowired
	ICollectionService collectionService;
	
	@Autowired
	IAdvertisementService advertisementService;
	
	@Autowired
    ICommodityService commodityService;
	
	@Autowired
	IAdvertisementDistributionService adverDistributionService;
	
	@Autowired
	ISpecificationsService specificationsService;
	
	@RequestMapping(value = "shopCategoryAll", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getShopCategoryAll() throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		mode = getShopCategory(mode);
		return mode;
	}
	
    private ModelMap getShopCategory(ModelMap mode){
		List<ShopCategory> list = shopCategService.getAll();
		mode.put("shopCategories", list);
		mode.put("success", "true");
		return mode;
	}
    
    @RequestMapping(value = "getPositions", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getPositions(Integer depID, HttpServletRequest request) throws ServletException, IOException {
    	ModelMap mode = new ModelMap();
        List<DepartAndPositions> list =	departAndPositionsService.getDepByDepID(depID);
        List<Positions> positions = new ArrayList<Positions>();
        for (DepartAndPositions depAndPos : list) {
        	positions.add(depAndPos.getPositions());
		}
    	mode.put("success", "true");
    	mode.put("list", positions);
    	return mode;
    }
   
  	@RequestMapping(value = "getSpacesByCateID", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getSpacesByCateID(Integer id, HttpServletRequest request) throws ServletException, IOException {
  		ModelMap mode = new ModelMap();
  		List<Specifications> list =  specificationsService.getAllByShopCateg(id);
  		mode.put("spec", list);
  		System.out.println("size==========="+list.size());
  		return mode;
  	}
}
