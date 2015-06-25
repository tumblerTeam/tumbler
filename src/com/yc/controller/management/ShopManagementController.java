package com.yc.controller.management;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.yc.entity.Blacklist;
import com.yc.entity.BlacklistType;
import com.yc.entity.Shop;
import com.yc.entity.ShopCommodity;
import com.yc.entity.user.AppUser;
import com.yc.service.IAppUserService;
import com.yc.service.IBlacklistService;
import com.yc.service.IShopCommodityService;
import com.yc.service.IShopService;

//商家管理
@Controller
@RequestMapping("/management")
public class ShopManagementController {

	private static final Logger LOG = Logger.getLogger(ShopManagementController.class);
	
	@Autowired
	IShopService shopService;
	
	@Autowired
	IBlacklistService blacklistService;
	
	@Autowired
	IShopCommodityService shopCommoidtyService;
	
	@Autowired
	IAppUserService userService;
	
	/**
	 * 后台登录首页
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("management/index");
	}
	
	/***
	 * 入驻商家管理，查询所有入驻商家
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "settledMerchants", method = RequestMethod.GET)
	public ModelAndView settledMerchants(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Shop> list = shopService.getShopForManage(true);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/settledMerchants",mode);
	}
	
	/**
	 * 入驻商家添加黑名单 GET
	 * @param id 商家ID
	 * @param mathed 方法 add or update
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "addBlack", method = RequestMethod.GET)
	public ModelAndView addBlack(Integer id, String mathed, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		if (mathed.equals("add")) {
			if (!id.equals("")) {
				mode.put("id", id);
				mode.put("mathed", "add");
				mode.put("page", "shop");
				return new ModelAndView("management/addBlack", mode);
			} else {
				Map<String, Object> map = new HashMap<String, Object>();
				List<Shop> list = shopService.getShopByParam(map);
				mode.put("list", list);
				return new ModelAndView("management/settledMerchants", mode);
			}
		} else {
			Blacklist blacklist = blacklistService.findById(id);
			mode.put("blacklist", blacklist);
			mode.put("mathed", "update");
			mode.put("page", "shop");
			return new ModelAndView("management/addBlack", mode);
		}
	}
	
	/**
	 * 商家黑名单添加
	 * @param id 商家ID
	 * @param reasons 原因
	 * @param mathed 方法 add or update
	 * @param page 页面 shop or orther
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "addBlacklistForShop", method = RequestMethod.POST)
	public String addBlacklistForShop(Integer id, String reasons, String mathed, String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (mathed.equals("add")) {
			if (page.equals("shop")) {
				Shop shop = shopService.findById(id);
				if (shop != null) {
					Blacklist black = new Blacklist();
					black.setReasons(reasons);
					black.setBlacklistType(BlacklistType.stores);
					black.setShop(shop);
					black.setAddDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
					black = blacklistService.save(black);
					shop.setBlacklist(black);
					shopService.update(shop);
				}
			} else {
				ShopCommodity commoidty = shopCommoidtyService.findById(id);
				if (commoidty != null) {
					Blacklist black = new Blacklist();
					black.setReasons(reasons);
					black.setBlacklistType(BlacklistType.goods);
					black.setCommoidty(commoidty);
					black.setAddDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
					black = blacklistService.save(black);
					commoidty.setBlacklist(black);
					shopCommoidtyService.update(commoidty);
				}
			}
		} else {
			Blacklist blacks = blacklistService.findById(id);
			blacks.setReasons(reasons);
			blacklistService.update(blacks);
		}
		return "redirect:/management/settledMerchants";
	}
	/**
	 * 申请入驻商家
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "applyForEntry", method = RequestMethod.GET)
	public ModelAndView applyForEntry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Shop> list = shopService.getShopForManage(false);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/applyForEntry",mode);
	}
	/**
	 * 通过用户ID查询用户
	 * @param id 用户ID
	 * @param isPermit boolean 同意开店
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "updateIsPermit", method = RequestMethod.GET)
	public String updateIsPermit(Integer id, String isPermit, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AppUser user = userService.findById(id);
		if (user.getShop() != null) {
			Shop shop = user.getShop();
			shop.setIsPermit(Boolean.valueOf(isPermit));
			shop = shopService.update(shop);
			user.setShop(shop);
			userService.update(user);
		}
		return "redirect:/management/applyForEntry";
	}
	/**
	 * 通过黑名单类型查看店家黑名单
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "blacklistStores", method = RequestMethod.GET)
	public ModelAndView blacklist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Blacklist> list = blacklistService.getBlacklistByBlacklistType(BlacklistType.stores);
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/blacklistStores", mode);
	}
	/**
	 * 删除黑名单
	 * @param id 黑名单ID
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "deleteBlack", method = RequestMethod.GET)
	public String deleteBlack(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Blacklist blacklist = blacklistService.findById(id);
		if (blacklist.getBlacklistType() == BlacklistType.stores) {
			Shop shop = blacklist.getShop();
			if (shop != null) {
				shop.setBlacklist(null);
				shopService.update(shop);
			}
			blacklistService.delete(blacklist.getId());
			return "redirect:/management/blacklistStores";
		} else {
			ShopCommodity commoid = blacklist.getCommoidty();
			if (commoid != null) {
				commoid.setBlacklist(null);
				shopCommoidtyService.update(commoid);
			}
			blacklistService.delete(blacklist.getId());
			return "redirect:/management/blacklistGoods";
		}
	}
}
