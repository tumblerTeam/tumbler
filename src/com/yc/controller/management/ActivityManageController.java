package com.yc.controller.management;

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
		style.setActivityStyle(activityStyle);
		activityStyleService.update(style);
		return "redirect:/management/activityStyle";
	}
	
	@RequestMapping(value = "addActivityStyle", method = RequestMethod.POST)
	public String addActivityStyle(String activityStyle, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActivityStyle style = new ActivityStyle();
		style.setActivityStyle(activityStyle);
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
		if(!style.isOpenOrClose()){
			List<ShopCommodity> list = style.getCommodities();
			if (list != null && list.size()>0) {
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i) != null) {
						list.get(i).setActivity(null);
						shopCommodityService.update(list.get(i));
					}
				}
			}
			style.setOpenOrClose(false); 
			activityService.update(style);
		}
		return "redirect:/management/activity";
	}
	
	@RequestMapping(value = "activityShopCommodity", method = RequestMethod.GET)
	public ModelAndView activityShopCommodity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ShopCommodity> list = shopCommodityService.getActivityCommodity();
		return null;
	}
}
