package com.yc.util;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.AdvertiseDistribution;
import com.yc.entity.Advertisement;
import com.yc.entity.CarCommodity;
import com.yc.entity.Collection;
import com.yc.entity.CollectionType;
import com.yc.entity.Shop;
import com.yc.entity.ShopCommImage;
import com.yc.entity.ShopCommodity;
import com.yc.entity.user.AppUser;
import com.yc.model.CarCommdityModel;
import com.yc.service.IAdvertisementDistributionService;
import com.yc.service.IAdvertisementService;
import com.yc.service.IBuyCarService;
import com.yc.service.ICarCommodityService;
import com.yc.service.ICollectionService;
import com.yc.service.IShopCommodityService;
import com.yc.service.IShopService;
import com.yc.tumbler.service.ServiceTools;

@Controller
@RequestMapping("/toJsonFmatUtil")
public class ToJsonFmatUtil {

	@Autowired
	IAdvertisementDistributionService adverDistributionService;

	@Autowired
	IAdvertisementService advertisementService;

	@Autowired
	IShopCommodityService shopCommService;

	@Autowired
	ICollectionService collectionService;

	@Autowired
	IShopService shopService;

	@Autowired
	ICarCommodityService carCommodityService;

	@Autowired
	IBuyCarService buyCarService;

	@Resource
	ServiceTools serviceTools;

	@RequestMapping(value = "weiPay", method = RequestMethod.GET)
	public ModelAndView weiPay(String appid,String timeStamp,String nonceStr,String packages,String sign, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		System.out.println("appid========="+appid);
		System.out.println("timeStamp========="+timeStamp);
		System.out.println("nonceStr========="+nonceStr);
		System.out.println("packages========="+packages);
		System.out.println("sign========="+sign);
		mode.put("appid", appid);
		mode.put("timeStamp", timeStamp);
		mode.put("nonceStr", nonceStr);
		mode.put("packages", packages);
		mode.put("sign", sign);
		return new ModelAndView("pay/wxpay",mode);
	}
	
	// 获得所选页面的广告位
	@RequestMapping(value = "getAdverPositions", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getAdverPositions(String whichPage, HttpServletRequest request) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<AdvertiseDistribution> adverDistributions = adverDistributionService.getAdvertiseDistributionsByWhichPage(whichPage);
		List<String> positions = new ArrayList<String>();
		for (int i = 0; i < adverDistributions.size(); i++) {
			String position = adverDistributions.get(i).getPosition();
			Integer size = advertisementService.getAdvertiseBywhichPageAndPostion(whichPage, position);
			if (adverDistributions.get(i).getNum() == -1) {
				positions.add(position);
			}

			else if (size < adverDistributions.get(i).getNum()) {
				positions.add(position);
			}
		}

		mode.put("success", "true");
		mode.put("list", positions);
		return mode;
	}

	// 获得广告位图片限制
	@RequestMapping(value = "getImgeWitch", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getImgeWitch(String whichPage, String posID, HttpServletRequest request) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		AdvertiseDistribution adverDistribution = adverDistributionService.findByWhichPageAndPosition(whichPage, posID);
		mode.put("success", "true");
		mode.put("lAndW", adverDistribution.getlAndW());
		return mode;
	}

	// 加入收藏
	@RequestMapping(value = "addCollection", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> addCollection(Integer commID, Integer shopID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		AppUser user = (AppUser) request.getSession().getAttribute("loginUser");
		if (user == null) {
			mode.put("success", "nouser");
		} else {
			ShopCommodity shopComm = null;
			Shop shop = null;
			int i;
			List<Collection> collections = null;
			if (commID != null) {
				shopComm = shopCommService.findById(commID);
				collections = collectionService.getAllByUser(user.getId());
				for (i = 0; i < collections.size(); i++) {
					if (collections.get(i).getShopCommodity() != null && collections.get(i).getShopCommodity().getCommCode() == commID) {
						mode.put("success", "existed");
						break;
					}
				}
				if (i >= collections.size()) {
					Collection collection = new Collection();
					collection.setShopCommodity(shopComm);
					collection.setUser(user);
					collectionService.save(collection);
					mode.put("success", "true");
				}
			}
			if (shopID != null) {
				collections = collectionService.getAllByUser(user.getId());
				shop = shopService.findById(shopID);
				for (i = 0; i < collections.size(); i++) {
					if (collections.get(i).getShop() != null && collections.get(i).getShop().getId() == shopID) {
						mode.put("success", "existed");
						break;
					}
				}
				if (i >= collections.size()) {
					Collection collection = new Collection();
					if (shop != null) {
						collection.setShop(shop);
						collection.setUser(user);
						collection.setCollectionType(CollectionType.shop);
						collectionService.save(collection);
						mode.put("success", "true");
					}
				}
			}
		}
		return mode;
	}

	/**
	 * 加入购物车
	 * 
	 * @param shopCommId
	 *            商品id
	 * @param userName
	 *            用户名
	 * @return 是否加入成功
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "addBuyCar", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> addBuyCar(Integer shopCommId, Integer buyAmount, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		AppUser user = (AppUser) request.getSession().getAttribute("loginUser");
		if (user == null) {
			mode.put("message", "nouser");
		} else {
			mode = serviceTools.addCarCommodity(buyAmount, shopCommId, mode, user);
		}
		return mode;
	}

	// 获得所选页面的广告
	@RequestMapping(value = "getAdvertisement", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getAdvertisement(String whichPage, HttpServletRequest request) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<Advertisement> advertisementList = advertisementService.getAdvertiseBywhichPage(whichPage);
		mode.put("advertisementList", advertisementList);
		return mode;
	}

	@RequestMapping(value = "getBuyCatNum", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getBuyCatNum(HttpServletRequest request) throws ServletException, IOException, ParseException {
		ModelMap mode = new ModelMap();
		HttpSession session = request.getSession();
		AppUser user = (AppUser) session.getAttribute("loginUser");
		List<CarCommdityModel> list = new ArrayList<CarCommdityModel>();
		if (user != null) {
			List<CarCommodity> carCommodityList=carCommodityService.getCarCommodityByUserName(user.getPhone());
			List<CarCommodity> handleCarCommodities=serviceTools.handleCarCommodity(carCommodityList, user.getPhone());
			for (int i = 0; i < handleCarCommodities.size(); i++) {
				CarCommdityModel carCommdity = new CarCommdityModel();
				carCommdity.setAmount(handleCarCommodities.get(i).getAmount());
				carCommdity.setCommoidtyName(handleCarCommodities.get(i).getShopCommodity().getCommoidtyName());
				carCommdity.setId(handleCarCommodities.get(i).getId());
				carCommdity.setPrice(handleCarCommodities.get(i).getPrice());
				carCommdity.setUnitPrice(handleCarCommodities.get(i).getUnitPrice()); 
				List<ShopCommImage> images = handleCarCommodities.get(i).getShopCommodity().getShopCommImages();
				System.out.println("images==========="+images.size());
				if(images != null && images.size()>0){
					for (int j = 0; j < images.size(); j++) {
						if(images.get(j) != null && images.get(j).getImagePath() != null){
							carCommdity.setImagePath(images.get(j).getImagePath());
						}
					}
				}
				list.add(carCommdity);
			}
			System.out.println("handleCarCommodities.size()========"+handleCarCommodities.size());
			mode.put("list", list);
			mode.put("num",handleCarCommodities.size());
			mode.put("success", "true");
			return mode;
		}else{
			mode.put("success", "true");
			mode.put("num", 0);
			return mode;
		}
	}
}
