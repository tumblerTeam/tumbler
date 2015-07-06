package com.yc.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.entity.AdvertiseDistribution;
import com.yc.entity.Advertisement;
import com.yc.entity.Collection;
import com.yc.entity.CollectionType;
import com.yc.entity.Shop;
import com.yc.entity.ShopCommodity;
import com.yc.entity.user.AppUser;
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
	public Map<String, Object> getImgeWitch(String whichPage, Integer posID, HttpServletRequest request) throws ServletException, IOException {
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

}
