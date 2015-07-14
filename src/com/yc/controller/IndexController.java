
package com.yc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.FamousManor;
import com.yc.entity.News;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommodity;
import com.yc.service.IFamousManorService;
import com.yc.service.INewsService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommodityService;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	IShopCategoryService categoryService;
	
	@Autowired
	INewsService newService;
	
	@Autowired
	IFamousManorService famousManorService;
	
	@Autowired
	IShopCommodityService shopCommoidtyService;
	
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<ShopCategory> list = categoryService.getAllByParent();
    	System.out.println("list========="+list.size());
    	List<News> news = newService.getNewsByIsThrough(true);
    	//改，以后 top 8
    	List<FamousManor> famouss =  famousManorService.getAll();
    	List<ShopCommodity> hongjiu = shopCommoidtyService.getAllByShopCategoryID(1, new String(), 0, 6);
    	List<ShopCommodity> baijiu = shopCommoidtyService.getAllByShopCategoryID(2, new String(), 0, 6);
    	List<ShopCommodity> pijiu = shopCommoidtyService.getAllByShopCategoryID(3, new String(), 0, 6);
    	List<ShopCommodity> yangjiu = shopCommoidtyService.getAllByShopCategoryID(4, new String(), 0, 6);
    	ModelMap mode = new ModelMap();
    	mode.put("categories", list);
    	mode.put("hongjiu", hongjiu);
    	mode.put("baijiu", baijiu);
    	mode.put("pijiu", pijiu);
    	mode.put("yangjiu", yangjiu);
    	mode.put("newsList", news);
    	mode.put("famouss", famouss);
        return new ModelAndView("index",mode);
    }

 	@RequestMapping(value = "login", method = RequestMethod.GET)
    public ModelAndView homePage(String page,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		return new ModelAndView("personnel/login");
    }
}
