package com.yc.controller.famousManor;

import java.io.IOException;
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

import com.yc.controller.user.UserController;
import com.yc.entity.FamousManor;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommodity;
import com.yc.service.IFamousManorService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommodityService;

@Controller
@RequestMapping("/famousManor")
public class FamousManorController {
	
	private static final Logger LOG = Logger.getLogger(UserController.class);
	
	@Autowired
	IFamousManorService famousManorService;
	
	@Autowired
	IShopCategoryService categoryService;
	
	@Autowired
	IShopCommodityService shopCommoidtyService;
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ShopCategory> list = categoryService.getAllByParent();
		List<FamousManor> famousManors = famousManorService.getAll();
		Map<String, List<ShopCommodity>> map = new HashMap<String, List<ShopCommodity>>();
		for (int i = 0; i < famousManors.size(); i++) {
			FamousManor famousManor = famousManors.get(i);
			if (famousManor != null) {
				List<ShopCommodity> commoidty = shopCommoidtyService.getAllByFamousManorID(famousManor.getId(),9); 
				map.put(famousManor.getId()+"<|>"+famousManor.getLogoPath()+"<|>"+famousManor.getDescribes(), commoidty);
			}
		}
		mode.put("categories", list);
		mode.put("maps", map);
		return new ModelAndView("famousManor/index",mode);
	}
}
