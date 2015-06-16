package com.yc.controller.management;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

import com.yc.entity.AdvertiseDistribution;
import com.yc.entity.Advertisement;
import com.yc.entity.AnnounType;
import com.yc.entity.News;
import com.yc.service.IAdvertisementDistributionService;
import com.yc.service.IAdvertisementService;
import com.yc.service.INewsService;

//公告管理
@Controller
@RequestMapping("/management")
public class AnnounManageController {

	private static final Logger LOG = Logger.getLogger(AnnounManageController.class);

	@Autowired
	INewsService newsService;

	@Autowired
	IAdvertisementDistributionService distributionService;
	
	@Autowired
	IAdvertisementService advertisementService;

	/**
	 * 查看所有公告
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "news", method = RequestMethod.GET)
	public ModelAndView news(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<News> list = newsService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/news", mode);
	}

	/**
	 * 查看公告详情
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "getNews", method = RequestMethod.GET)
	public ModelAndView getNews(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		News news = newsService.findById(id);
		ModelMap mode = new ModelMap();
		mode.put("notice", news);
		return new ModelAndView("management/getNews", mode);
	}

	/**
	 * 删除公告
	 * 
	 * @param id
	 *            公告ID
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "deleteNews", method = RequestMethod.GET)
	public String deleteNews(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		newsService.delete(id);
		return "redirect:/management/news";
	}

	@RequestMapping(value = "addNews", method = RequestMethod.GET)
	public ModelAndView addNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("management/addNews");
	}

	@RequestMapping(value = "addNews", method = RequestMethod.POST)
	public String addNew(String isThrough, String type, String contentNews, String activityUrl, String activityTitle, String title, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		News news = null;
		if (type.equals("news")) {
			if (!contentNews.equals("输入内容…")) {
				news = new News();
				news.setContent(contentNews);
				news.setTitle(title);
				news.setAnnounType(AnnounType.valueOf(type));
				news.setIsThrough(Boolean.valueOf(isThrough));
				news.setNewsDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			}
		} else {
			news = new News();
			news.setTitle(activityTitle);
			news.setActivityUrl(activityUrl);
			news.setAnnounType(AnnounType.valueOf(type));
			news.setIsThrough(Boolean.valueOf(isThrough));
			news.setNewsDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		}
		newsService.save(news);
		return "redirect:/management/news";
	}

	@RequestMapping(value = "updateNews", method = RequestMethod.GET)
	public ModelAndView updateNews(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		News news = newsService.findById(id);
		ModelMap model = new ModelMap();
		model.put("news", news);
		model.put("page", "update");
		return new ModelAndView("management/addNews", model);
	}

	@RequestMapping(value = "updateNews", method = RequestMethod.POST)
	public String updateNewsPost(String isThrough, Integer noticeId, String type, String contentNews, String activityUrl, String activityTitle, String title, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		News news = newsService.findById(noticeId);
		if (news != null) {
			if (type.equals("news")) {
				if (!contentNews.equals("")) {
					news.setContent(contentNews);
					news.setTitle(title);
					news.setAnnounType(AnnounType.valueOf(type));
					news.setIsThrough(Boolean.valueOf(isThrough));
				}
			} else {
				news.setTitle(activityTitle);
				news.setActivityUrl(activityUrl);
				news.setAnnounType(AnnounType.valueOf(type));
				news.setIsThrough(Boolean.valueOf(isThrough));
			}
			newsService.update(news);
		}
		return "redirect:/management/news";
	}

	// 广告
	@RequestMapping(value = "advertiseDistribution", method = RequestMethod.GET)
	public ModelAndView advertiseDistribution(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<AdvertiseDistribution> list = distributionService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/advertiseDistribution", mode);
	}

	@RequestMapping(value = "addAdverDis", method = RequestMethod.GET)
	public ModelAndView addAdverDis(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("management/addAdverDis");
	}

	@RequestMapping(value = "addAdverDis", method = RequestMethod.POST)
	public String addNew(String whichPage, Integer position, String lAndW, Integer num, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdvertiseDistribution news = new AdvertiseDistribution();
		news.setNum(num);
		news.setPosition(position);
		news.setWhichPage(whichPage);
		news.setWhichPage(whichPage);
		news.setlAndW(lAndW);
		distributionService.save(news);
		return "redirect:/management/advertiseDistribution";
	}
	
	@RequestMapping(value = "updateAdverDis", method = RequestMethod.GET)
	public ModelAndView updateAdverDis(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdvertiseDistribution news = distributionService.findById(id);
		ModelMap model = new ModelMap();
		model.put("adverDis", news);
		model.put("page", "update");
		return new ModelAndView("management/addAdverDis", model);
	}
	
	@RequestMapping(value = "updateAdverDis", method = RequestMethod.POST)
	public String addNew(Integer adverDisId, String whichPage, Integer position, String lAndW, Integer num, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdvertiseDistribution news = distributionService.findById(adverDisId);
		if(news != null){
			news.setNum(num);
			news.setPosition(position);
			news.setWhichPage(whichPage);
			news.setWhichPage(whichPage);
			news.setlAndW(lAndW);
			distributionService.update(news);
		}
		return "redirect:/management/advertiseDistribution";
	}
	
	@RequestMapping(value = "deleteAdverDis", method = RequestMethod.GET)
	public String deleteAdverDis(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		distributionService.delete(id);
		return "redirect:/management/advertiseDistribution";
	}
	
	@RequestMapping(value = "advertisement", method = RequestMethod.GET)
	public ModelAndView advertisement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<Advertisement> advertisements = advertisementService.getAll();
		mode.put("adverlist", advertisements);
		return new ModelAndView("management/advertisement", mode);
	}
}
