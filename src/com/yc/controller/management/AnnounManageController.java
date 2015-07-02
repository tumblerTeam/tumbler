package com.yc.controller.management;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.AdvertiseDistribution;
import com.yc.entity.Advertisement;
import com.yc.entity.AnnounType;
import com.yc.entity.News;
import com.yc.entity.ShopCommodity;
import com.yc.service.IAdvertisementDistributionService;
import com.yc.service.IAdvertisementService;
import com.yc.service.INewsService;
import com.yc.service.IShopCommodityService;

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
	
	@Autowired
	IShopCommodityService shopCommodityService;

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
	

	@RequestMapping(value = "deleteAdvertisement", method = RequestMethod.GET)
	public String deleteAdvertisement(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Advertisement advertisement = advertisementService.findById(id);
		if (advertisement != null) {
			ShopCommodity commodity = advertisement.getCommodity();
			if(commodity != null){
				commodity.setActityImage(null);
				commodity.setAdvertisement(null);
				shopCommodityService.update(commodity);
			}
		}
		advertisementService.delete(id);
		return "redirect:/management/advertisement";
	}
	
	@RequestMapping(value = "showAddAdvertisement", method = RequestMethod.GET)
	public ModelAndView showAddAdvertisement(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();		
		List<String> list = distributionService.getDistinctWhichPage();	
		mode.put("list", list);
		mode.put("method", "add");
		
		return new ModelAndView("management/addAdvertisement", mode);
	}
	
	@RequestMapping(value = "showUpdateAdvertisement", method = RequestMethod.GET)
	public ModelAndView showUpdateAdvertisement(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();		
		Advertisement advertisement = advertisementService.findById(id);
		List<String> list = distributionService.getDistinctWhichPage();
		mode.put("list", list);
		mode.put("method", "update");
		mode.put("advertisement", advertisement);
		return new ModelAndView("management/addAdvertisement", mode);
	}
	
	@RequestMapping(value = "addAdvertisement", method = RequestMethod.POST)
	public String addAdvertisement(@RequestParam("imagePath") MultipartFile imagePath,Integer commID, String link, Float expenditure, Float income, 
			String startDate, Integer during, String whichPage, Integer position,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCommodity shopCommodity = shopCommodityService.findById(commID);
			AdvertiseDistribution advertiseDistribution = distributionService.findByWhichPageAndPosition(whichPage,position);	
			if(advertiseDistribution != null){
				List<Advertisement> advertisements = advertiseDistribution.getAdvertisementList();
				if(advertisements.size()<=advertiseDistribution.getNum()){
					String name = imagePath.getOriginalFilename();
					String pathDir = "content/static/img/advertiseImage/";
					if (!name.equals("")) {
						String logoRealPathDir = request.getSession().getServletContext().getRealPath(pathDir);
						File file1 = new File(logoRealPathDir);
						if (!file1.exists())
							file1.mkdirs();
						File file = new File(logoRealPathDir, name);
						if (file.getParentFile() == null)
							file.mkdirs();
						imagePath.transferTo(file);
						Advertisement advertisement = new Advertisement();
						if ( expenditure != null ) {
							advertisement.setExpenditure(expenditure);
						}
						if ( income != null ) {
							advertisement.setIncome(income);
						}
						if ( during != null ) {
							advertisement.setDuring(during);
						}
						advertisement.setLink(link);		
						advertisement.setStartDate(startDate);		
						advertisement.setImagePath(pathDir+name);	
						advertisement.setAdverDistribution(advertiseDistribution);
						advertisement = advertisementService.save(advertisement);
						if(shopCommodity != null){
							shopCommodity.setAdvertisement(advertisement);
							shopCommodity = shopCommodityService.update(shopCommodity);
							advertisement.setCommodity(shopCommodity);
						}
						advertisements.add(advertisement);
					}
				}
				advertiseDistribution.setAdvertisementList(advertisements);
				distributionService.update(advertiseDistribution);
			}
		return "redirect:/management/advertisement";
	}
	
	@RequestMapping(value = "updateAdvertisement", method = RequestMethod.POST)
	public String updateAdvertisement(@RequestParam("imagePath") MultipartFile imagePath,Integer id,Integer commID, String link, Float expenditure, Float income, 
			String startDate, Integer during, String whichPage, Integer position,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdvertiseDistribution advertiseDistribution = distributionService.findByWhichPageAndPosition(whichPage,position);	
		System.out.println("advertiseDistribution======="+advertiseDistribution);
		if(advertiseDistribution != null){
			List<Advertisement> advertisements = advertiseDistribution.getAdvertisementList();
			if(advertisements.size()<=advertiseDistribution.getNum()){
				String name = imagePath.getOriginalFilename();
				String pathDir = "content/static/img/advertiseImage/";
				Advertisement advertisement = advertisementService.findById(id);
				if (!name.equals("")) {
					if(advertisement != null){
						String logoRealPathDir = request.getSession().getServletContext().getRealPath(pathDir);
						File file1 = new File(logoRealPathDir);
						if (!file1.exists())
							file1.mkdirs();
						File file = new File(logoRealPathDir, name);
						if (file.getParentFile() == null)
							file.mkdirs();
						imagePath.transferTo(file);
						advertisement.setImagePath(pathDir+name);
					}
				}
				System.out.println("commID==========="+commID);
				if(commID != null && !commID.equals("")){
					ShopCommodity shopCommodity = shopCommodityService.findById(commID);
					shopCommodity.setAdvertisement(advertisement);
					ShopCommodity commodity =	shopCommodityService.update(shopCommodity);
					advertisement.setCommodity(commodity); 
				}else{
					if(advertisement.getCommodity() != null){
						ShopCommodity shopCommodity = advertisement.getCommodity();
						shopCommodity.setAdvertisement(null);
						shopCommodity = shopCommodityService.update(shopCommodity);
						advertisement.setCommodity(null);
					}
				}
				if ( expenditure != null ) {
					advertisement.setExpenditure(expenditure);
				}
				if ( income != null ) {
					advertisement.setIncome(income);
				}
				if ( during != null ) {
					advertisement.setDuring(during);
				}
				advertisement.setLink(link);		
				advertisement.setStartDate(startDate);		
				advertisement.setAdverDistribution(advertiseDistribution);
				advertisement = advertisementService.update(advertisement);
			}
			distributionService.update(advertiseDistribution);
		}
		return "redirect:/management/advertisement";

	}
}
