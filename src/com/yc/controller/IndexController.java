
package com.yc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.AgriculturalsSort;
import com.yc.entity.Language;
import com.yc.entity.News;
import com.yc.entity.Products;
import com.yc.service.IAgriculturalsSortService;
import com.yc.service.INewsService;
import com.yc.service.IProductsService;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	IAgriculturalsSortService sortService;
	
	@Autowired
	INewsService newsService;
	
	@Autowired
	IProductsService productsService;
	
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Object language = request.getSession().getAttribute("language");
    	if (language == null) {
    		language = "Chinese";
			request.getSession().setAttribute("language", "Chinese");
		}
    	List<AgriculturalsSort> list = sortService.getSortByParent(Language.valueOf(language.toString()));
    	List<News> news = newsService.getNewsByLangage(Language.valueOf(language.toString()));
    	List<AgriculturalsSort> brands = new ArrayList<AgriculturalsSort>();
    	for (int i = 0; i < list.size(); i++) {
    		if (list.get(i).getParentLevel() == null) {
				Set<AgriculturalsSort> chile = list.get(i).getChildren();
				Iterator<AgriculturalsSort> set = chile.iterator();
				while(set.hasNext()){
					brands.add(set.next());
				}
			}
		}
    	ModelMap mode = new ModelMap();
    	mode.put("list", list);
    	mode.put("news", news);
    	mode.put("brands", brands);
        return new ModelAndView("index", mode);
    }

 	@RequestMapping(value = "login", method = RequestMethod.GET)
    public ModelAndView homePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		return new ModelAndView("login", null);
    }
 	
 	@RequestMapping(value = "getXiLie", method = RequestMethod.GET)
    public ModelAndView getXiLie(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		AgriculturalsSort agriculturals = sortService.findById(id);
 		ModelMap mode = new ModelMap();
 		mode.put("agriculturals", agriculturals);
 		Object language = request.getSession().getAttribute("language");
    	if (language == null) {
    		language = "Chinese";
			request.getSession().setAttribute("language", "Chinese");
		}
    	List<AgriculturalsSort> list = sortService.getSortByParent(Language.valueOf(language.toString()));
    	List<News> news = newsService.getNewsByLangage(Language.valueOf(language.toString()));
    	List<AgriculturalsSort> brands = new ArrayList<AgriculturalsSort>();
    	for (int i = 0; i < list.size(); i++) {
    		if (list.get(i).getParentLevel() == null) {
				Set<AgriculturalsSort> chile = list.get(i).getChildren();
				Iterator<AgriculturalsSort> set = chile.iterator();
				while(set.hasNext()){
					brands.add(set.next());
				}
			}
		}
    	mode.put("list", list);
    	mode.put("news", news);
    	mode.put("brands", brands);
 		return new ModelAndView("getXiLie",mode);
 	}
 	
 	@RequestMapping(value = "getProduct", method = RequestMethod.GET)
    public ModelAndView getProduct(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		ModelMap mode = new ModelMap();
 		Products products = productsService.findById(id);
 		mode.put("products", products);
 		Object language = request.getSession().getAttribute("language");
    	if (language == null) {
    		language = "Chinese";
			request.getSession().setAttribute("language", "Chinese");
		}
    	List<AgriculturalsSort> list = sortService.getSortByParent(Language.valueOf(language.toString()));
    	List<News> news = newsService.getNewsByLangage(Language.valueOf(language.toString()));
    	List<AgriculturalsSort> brands = new ArrayList<AgriculturalsSort>();
    	for (int i = 0; i < list.size(); i++) {
    		if (list.get(i).getParentLevel() == null) {
				Set<AgriculturalsSort> chile = list.get(i).getChildren();
				Iterator<AgriculturalsSort> set = chile.iterator();
				while(set.hasNext()){
					brands.add(set.next());
				}
			}
		}
    	mode.put("list", list);
    	mode.put("news", news);
    	mode.put("brands", brands);
    	return new ModelAndView("getProduct",mode);
 	}
 	
 	@RequestMapping(value = "getLanguage", method = RequestMethod.GET)
    public String getLanguage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		Object language = request.getSession().getAttribute("language");
 		if (language == null) {
			return "redirect:/index";
		}else{
			if (language.toString().equals("Chinese")) {
				request.getSession().removeAttribute("language");
				request.getSession().setAttribute("language", "Uighur");
			}else{
				request.getSession().removeAttribute("language");
				request.getSession().setAttribute("language", "Chinese");
			}
			return "redirect:/index";
		}
 	}
 	
}
