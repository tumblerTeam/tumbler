package com.yc.controller.management;

import java.io.File;
import java.io.IOException;
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

import com.yc.entity.Activity;
import com.yc.entity.ActivityStyle;
import com.yc.entity.ShopCommodity;
import com.yc.service.IActivityService;
import com.yc.service.IActivityStyleService;
import com.yc.service.IShopCommodityService;

//公告管理
@Controller
@RequestMapping("/management")
public class ActivityManageController {
	
	private static final Logger LOG = Logger.getLogger(ActivityManageController.class);
	
	@Autowired
	IActivityStyleService activityStyleService;
	
	@Autowired
	IActivityService activityService;
	
	@Autowired
	IShopCommodityService shopCommodityService;
	
	/**
	 * 活动方式
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "activityStyle", method = RequestMethod.GET)
	public ModelAndView activityStyle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ActivityStyle> activityStyles = activityStyleService.getAll();
		mode.put("activityStyles", activityStyles);
		return new ModelAndView("management/ActivityStyle", mode);
	}
	
	@RequestMapping(value = "addActivityStyle", method = RequestMethod.GET)
	public ModelAndView addActivityStyle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("management/addActivityStyle");
	}
	
	@RequestMapping(value = "updateStyle", method = RequestMethod.GET)
	public ModelAndView updateStyle(Integer id,String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActivityStyle style = activityStyleService.findById(id);
		ModelMap mode = new ModelMap();
		mode.put("style", style);
		mode.put("page", page);
		return new ModelAndView("management/addActivityStyle",mode);
	}
	
	@RequestMapping(value = "updateActivityStyle", method = RequestMethod.POST)
	public String updateActivityStyle(Integer activityStyleId,String activityStyle, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActivityStyle style = activityStyleService.findById(activityStyleId);
		style.setActivityType(activityStyle);
		activityStyleService.update(style);
		return "redirect:/management/activityStyle";
	}
	
	@RequestMapping(value = "addActivityStyle", method = RequestMethod.POST)
	public String addActivityStyle(String activityStyle, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActivityStyle style = new ActivityStyle();
		style.setActivityType(activityStyle);
		style = activityStyleService.save(style);
		return "redirect:/management/activityStyle";
	}
	
	@RequestMapping(value = "deleteStyle", method = RequestMethod.GET)
	public String deleteStyle(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActivityStyle style = activityStyleService.findById(id);
		List<Activity> list = style.getActivitys();
		if (list != null && list.size()>0) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i) != null) {
					activityService.delete(list.get(i).getActivityId());
				}
			}
		}
		activityStyleService.delete(style.getActivityStyleId());
		return "redirect:/management/activityStyle";
	}
	
	//活动
	@RequestMapping(value = "activity", method = RequestMethod.GET)
	public ModelAndView activity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<Activity> activitys = activityService.getAll();
		mode.put("activitys", activitys);
		return new ModelAndView("management/activity", mode);
	}
	
	@RequestMapping(value = "addActivity", method = RequestMethod.GET)
	public ModelAndView addActivity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ActivityStyle> activityStyles = activityStyleService.getAll();
		mode.put("activityStyles", activityStyles);
		return new ModelAndView("management/addActivity",mode);
	}
	
	@RequestMapping(value = "updateActivity", method = RequestMethod.GET)
	public ModelAndView updateActivity(Integer activityId,String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Activity style = activityService.findById(activityId);
		ModelMap mode = new ModelMap();
		List<ActivityStyle> activityStyles = activityStyleService.getAll();
		mode.put("activityStyles", activityStyles);
		mode.put("activity", style);
		mode.put("page", page);
		return new ModelAndView("management/addActivity",mode);
	}

	@RequestMapping(value = "updateActivity", method = RequestMethod.POST)
	public String updateActivitys(Integer activityId, Integer activityStyleId, String activityName,String startDate,String endDate,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActivityStyle style = activityStyleService.findById(activityStyleId);
		Activity activity = activityService.findById(activityId);
		activity.setActivityStyle(style);
		activity.setActivityName(activityName);
		activity.setEndDate(endDate);
		activity.setStartDate(startDate);
		activity = activityService.update(activity);
		return "redirect:/management/activity";
	}
	
	@RequestMapping(value = "addActivity", method = RequestMethod.POST)
	public String addActivity(Integer activityStyleId, String activityName,String startDate,String endDate,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActivityStyle style = activityStyleService.findById(activityStyleId);
		Activity activity = new Activity();
		activity.setActivityStyle(style);
		activity.setActivityName(activityName);
		activity.setEndDate(endDate);
		activity.setStartDate(startDate);
		activity = activityService.save(activity);
		return "redirect:/management/activity";
	}
	
	@RequestMapping(value = "deleteActivity", method = RequestMethod.GET)
	public String deleteActivity(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Activity style = activityService.findById(id);
		List<ShopCommodity> list = style.getCommodities();
		if (list != null && list.size()>0) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i) != null) {
					list.get(i).setActivity(null);
					shopCommodityService.update(list.get(i));
				}
			}
		}
		activityService.delete(style.getActivityId());
		return "redirect:/management/activity";
	}
	
	@RequestMapping(value = "manageActivity", method = RequestMethod.GET)
	public String manageActivity(Integer activityId,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Activity style = activityService.findById(activityId);
		if(style.getIsOpenOrClose()){
			style.setIsOpenOrClose(false); 
			activityService.update(style);
		}else{
			style.setIsOpenOrClose(true); 
			activityService.update(style);
		}
		return "redirect:/management/activity";
	}
	
	@RequestMapping(value = "activityShopCommodity", method = RequestMethod.GET)
	public ModelAndView activityShopCommodity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Activity> list = activityService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/activityShopCommodity",mode);
	}
	
	@RequestMapping(value = "addActivityShopComm", method = RequestMethod.GET)
	public ModelAndView addActivityShopComm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Activity> list = activityService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("activitys", list);
		return new ModelAndView("management/addActivityShopComm",mode);
	}
	
	@RequestMapping(value = "addCommActivity", method = RequestMethod.POST)
	public String addCommActivity(Integer activityId,Integer commID,String link,@RequestParam("actityImage") MultipartFile actityImage,Integer activityAmount, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = actityImage.getOriginalFilename();
		String pathDir = "../images/activityImage/";
		ShopCommodity shopCommodity = shopCommodityService.findById(commID);
		Activity activity = activityService.findById(activityId);
		List<ShopCommodity> list = activity.getCommodities();
		if (!name.equals("") && shopCommodity != null && activity != null) {
			String logoRealPathDir = request.getSession().getServletContext().getRealPath(pathDir);
			File file1 = new File(logoRealPathDir,pathDir).getCanonicalFile();
			if (!file1.exists())
				file1.mkdirs();
			File file = new File(logoRealPathDir, name).getCanonicalFile();
			if (file.getParentFile() == null)
				file.mkdirs();
			actityImage.transferTo(file);
			shopCommodity.setActivity(activity);
			shopCommodity.setActityImage(pathDir+name);
			shopCommodity.setLink(link);
			shopCommodity.setActivityAmount(activityAmount);
			shopCommodity = shopCommodityService.update(shopCommodity);
			list.add(shopCommodity);
			activity.setCommodities(list);
			activityService.update(activity);
		}
		return "redirect:/management/activityShopCommodity";
	}
	
	@RequestMapping(value = "updateCommActivity", method = RequestMethod.GET)
	public ModelAndView updateCommActivityForGet(String page,Integer commCode,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Activity> list = activityService.getAll();
		ModelMap mode = new ModelMap();
		ShopCommodity shopcommodity =  shopCommodityService.findById(commCode);
		mode.put("activitys", list);
		mode.put("shopcommodity", shopcommodity);
		mode.put("page", page);
		return new ModelAndView("management/addActivityShopComm",mode);
	}
	
	@RequestMapping(value = "updateCommActivity", method = RequestMethod.POST)
	public String updateCommActivity(Integer commCode, Integer activityId,Integer commID,String link,@RequestParam("actityImage") MultipartFile actityImage,Integer activityAmount, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCommodity commodity = null;
		if(commCode != commID){
			commodity = shopCommodityService.findById(commCode); //旧的
			Activity activity = commodity.getActivity();
			commodity.setActivity(null);
			shopCommodityService.update(commodity);
		    List<ShopCommodity> list = activity.getCommodities();
		    for (int i = 0; i < list.size(); i++) {
		    	if(list.get(i).getCommCode() == commCode){
		    		list.remove(list.get(i));
		    	}
			}
		    activity.setCommodities(list);
		    activityService.update(activity);
		}
		String name = actityImage.getOriginalFilename();
		String pathDir = "../images/activityImage/";
		ShopCommodity shopCommodity = shopCommodityService.findById(commID);
		Activity activity = activityService.findById(activityId);
		List<ShopCommodity> list = activity.getCommodities();
		if (shopCommodity != null && activity != null) {
			if(name.equals("") && commodity != null){
				shopCommodity.setActityImage(commodity.getActityImage());
			}
			if(!name.equals("")){
				String logoRealPathDir = request.getSession().getServletContext().getRealPath(pathDir);
				File file1 = new File(logoRealPathDir);
				if (!file1.exists())
					file1.mkdirs();
				File file = new File(logoRealPathDir, name);
				if (file.getParentFile() == null)
					file.mkdirs();
				actityImage.transferTo(file);
				shopCommodity.setActityImage(pathDir+name);
			}
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getCommCode() == shopCommodity.getCommCode()){
					System.out.println("list.get(i)==="+list.get(i));
					System.out.println("shopCommodity==="+shopCommodity);
					System.out.println("size========"+list.size());
					shopCommodity.setActivity(null);
					shopCommodityService.update(shopCommodity);
					list.remove(list.get(i));
					System.out.println("list.get(0)"+list);
					System.out.println("list.get(i)"+list);
					System.out.println("size========"+list.size());
					activity.setCommodities(list);
				    activityService.update(activity);
				}
			}
			shopCommodity.setActivity(activity);
			shopCommodity.setLink(link);
			shopCommodity.setActivityAmount(activityAmount);
			commodity = shopCommodityService.update(shopCommodity);
			System.out.println("size========"+list);
			list.add(commodity);
			System.out.println("size========"+list);
			activity.setCommodities(list);
			activityService.update(activity);
		}
		
		return "redirect:/management/activityShopCommodity";
	}
	
	@RequestMapping(value = "deleteActitiy", method = RequestMethod.GET)
	public String deleteActitiy(Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCommodity shopCommodity = shopCommodityService.findById(id);
		Activity activity = shopCommodity.getActivity();
		shopCommodity.setActivity(null);
		shopCommodityService.update(shopCommodity);
	    List<ShopCommodity> list = activity.getCommodities();
	    for (int i = 0; i < list.size(); i++) {
	    	if(list.get(i).getCommCode() == id){
	    		list.remove(list.get(i));
	    	}
		}
	    activity.setCommodities(list);
	    activityService.update(activity);
		return "redirect:/management/activityShopCommodity";
	}
	
}
