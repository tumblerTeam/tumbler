package com.yc.controller.proscenium;

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

import com.yc.entity.AnnounType;
import com.yc.entity.News;
import com.yc.entity.ShopCategory;
import com.yc.service.INewsService;
import com.yc.service.IShopCategoryService;

//前台
@Controller
@RequestMapping("/proscenium")
public class ShopTwoController {

	@Autowired
	INewsService newService;
	
	@Autowired
	IShopCategoryService categoryService;
	/**
	 * 获取公告或新闻
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "getNews", method = RequestMethod.GET)
    public ModelAndView getNews(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		ModelMap mode=new ModelMap();
 		List<ShopCategory> list = categoryService.getAllByParent();
		mode.put("categories", list);
 		List<News> newList=null;
 		String sign=null;
 		if(id==1){
 			 newList=newService.getNewsByAnnounType(AnnounType.valueOf("activity"));
 			 sign="促销活动";
 		}else if(id==2){
 			newList=newService.getNewsByAnnounType(AnnounType.valueOf("news"));
 			 sign="最新公告";
 		}
 		System.out.println("sign==="+sign);
 		System.out.println("newList==="+newList.size());
 		mode.put("sign", sign);
 		mode.put("newList", newList);
 		return new ModelAndView("reception/news",mode);
    }
	
	/**
	 * 获取公告详情
	 * @param newId
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "getNewDetails", method = RequestMethod.GET)
    public ModelAndView getNewDetails(Integer newId,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode=new ModelMap();
		List<ShopCategory> list = categoryService.getAllByParent();
		mode.put("categories", list);
		News newDe=newService.findById(newId);
		List<News> newList=newService.getNewsByAnnounType(AnnounType.valueOf("news"));
		mode.put("newDe", newDe);
		mode.put("newList", newList);
		return new ModelAndView("reception/newDetails",mode);
	}
}
