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

import com.yc.entity.ShopCategory;
import com.yc.service.IBrandService;
import com.yc.service.IShopCategoryService;

@Controller
@RequestMapping("/")
public class OtherController {
	
	@Autowired
	IBrandService brandService;

	@Autowired
	IShopCategoryService categoryService;
	
    @RequestMapping(value = "brand", method = RequestMethod.GET)
    public ModelAndView bander(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<ShopCategory> list = categoryService.getAllByParent();
    	ModelMap mode = new ModelMap();
    	mode.put("categories", list);
    	return new ModelAndView("reception/brand",mode);
    }
}
