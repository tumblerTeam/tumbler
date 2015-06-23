package com.yc.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.yc.entity.Collection;
import com.yc.entity.CollectionType;
import com.yc.entity.Shop;
import com.yc.entity.ShopCommodity;
import com.yc.entity.user.AppUser;
import com.yc.service.IAdvertisementDistributionService;
import com.yc.service.IAdvertisementService;
import com.yc.service.ICollectionService;
import com.yc.service.IShopCommodityService;
import com.yc.service.IShopService;

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

	// 获得所选页面的广告位
	@RequestMapping(value = "getAdverPositions", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getAdverPositions(String whichPage, HttpServletRequest request) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<AdvertiseDistribution> adverDistributions = adverDistributionService.getAdvertiseDistributionsByWhichPage(whichPage);
		List<Integer> positions = new ArrayList<Integer>();
		for (int i = 0; i < adverDistributions.size(); i++) {
			int position = adverDistributions.get(i).getPosition();
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
	public Map<String, Object> addCollection(Integer commID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		AppUser user = (AppUser) request.getSession().getAttribute("loginUser");
		if (user == null) {
			mode.put("success", "nouser");
		} else {
			ShopCommodity shopComm = shopCommService.findById(commID);
			Shop shop = null;
			List<Collection> collections = collectionService.getAll();
			int i;
			for (i = 0; i < collections.size(); i++) {
				if (collections.get(i).getShopCommoidty().getCommCode() == commID) {
					mode.put("success", "existed");
					break;
				}else{
					 shop = shopService.findById(commID);
					if (shop != null) {
						if (collections.get(i).getShop().getId() == commID) {
							mode.put("success", "existed");
							break;
						}
					}
				}
			}
			if (i >= collections.size()) {
				Collection collection = new Collection();
				if (shopComm != null) {
					collection.setShopCommoidty(shopComm);
					collection.setUser(user);
					collectionService.save(collection);
					mode.put("success", "true");
				}
				if(shop != null){
					collection.setShop(shop);
					collection.setUser(user);
					collection.setCollectionType(CollectionType.shop);
					collectionService.save(collection);
					mode.put("success", "true");
				}
			}
		}
		return mode;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "buyCat", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> buyCat(Integer commID, Integer buyAmount, Float fare, HttpServletRequest request) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
//		HttpSession session = request.getSession();
//		AppUser user = (AppUser) session.getAttribute("loginUser");
//		ShopCommodity comm = shopCommService.findById(commID);
//		if (comm != null) {
//			CarCommoidty carcomm = new CarCommoidty();
//			carcomm.setCommCode(comm.getCommCode());
//			carcomm.setCommoidtyName(comm.getCommoidtyName());
//			carcomm.setCommItem(comm.getCommItem());
//			carcomm.setSupplier(comm.getSupplier());
//			carcomm.setProportion(comm.getProportion());
//			carcomm.setUnitPrice(comm.getUnitPrice());
//			carcomm.setStock(comm.getStock());
//			carcomm.setProbablyWeight(comm.getProbablyWeight());
//			carcomm.setShelves(comm.getShelves());
//			carcomm.setIsSpecial(comm.getIsSpecial());
//			carcomm.setSpecial(comm.getSpecial());
//			carcomm.setCurrency(comm.getCurrency());
//			carcomm.setIscChoice(comm.getIscChoice());
//			carcomm.setAuction(comm.getAuction());
//			carcomm.setCarCategory(comm.getShopCategory());
//			carcomm.setBrand(comm.getBrand());
//			carcomm.setCarbelongTo(comm.getBelongTo());
//			carcomm.setDescribes(comm.getDescribes());
//			carcomm.setFare(fare);
//			carcomm = carCommoidtyService.save(carcomm);
//			if (user == null) {
//				BuyCarSession buyCat = new BuyCarSession();
//				buyCat.setBuyAmount(buyAmount);
//				buyCat.setShopCommoidty(carcomm);
//				buyCat.setSpecs(params + ",");
//				List<BuyCarSession> list = (List<BuyCarSession>) session.getAttribute("buyCates");
//				if (list != null) {
//					for (BuyCarSession buyCatSession : list) {
//						boolean isok = true;
//						if (buyCatSession.getShopCommoidty().getCommoidtyName().equals(carcomm.getCommoidtyName())) {
//							String[] buycat1 = buyCatSession.getSpecs().split(",");
//							String[] guige = new String[buycat1.length];
//							String[] buycat2 = params.split(",");
//							for (int i = 0; i < buycat1.length; i++) {
//								for (int j = 0; j < buycat2.length; j++) {
//									if (buycat1[i].equals(buycat2[j])) {
//										guige[i] = "t";
//									}
//								}
//								if (guige[i] == null || guige[i].equals("")) {
//									guige[i] = "f";
//								}
//							}
//							for (int i = 0; i < guige.length; i++) {
//								if (guige[i].equals("f")) {
//									isok = false;
//								}
//							}
//						} else {
//							isok = false;
//						}
//						if (isok) {
//							buyCat.setBuyAmount(buyCatSession.getBuyAmount() + buyAmount);
//						}
//					}
//					list.add(buyCat);
//				} else {
//					list = new ArrayList<BuyCarSession>();
//					list.add(buyCat);
//				}
//				session.setAttribute("buyCates", list);
//			} else {
//				System.out.println("  carcomm ==" + carcomm);
//				BuyCar cat = new BuyCar();
//				cat.setBuyAmount(buyAmount);
//				cat.setCatUser(user);
//				cat.setShopCommoidty(carcomm);
//				cat.setSpecs(params + ",");
//				List<BuyCar> list = buyCarService.getBuyCatByUser(user.getId());
//				boolean bool = true;
//				if (list != null && list.size() > 0) {
//					for (BuyCat buyCat : list) {
//						boolean isok = true;
//						if (buyCat.getShopCommoidty().getCommoidtyName().equals(carcomm.getCommoidtyName())) {
//							String[] buycat1 = buyCat.getSpecs().split(",");
//							String[] guige = new String[buycat1.length];
//							String[] buycat2 = params.split(",");
//							for (int i = 0; i < buycat1.length; i++) {
//								for (int j = 0; j < buycat2.length; j++) {
//									if (buycat1[i].equals(buycat2[j])) {
//										guige[i] = "t";
//									}
//								}
//								if (guige[i] == null || guige[i].equals("")) {
//									guige[i] = "f";
//								}
//							}
//							for (int i = 0; i < guige.length; i++) {
//								if (guige[i].equals("f")) {
//									isok = false;
//								}
//							}
//						} else {
//							isok = false;
//						}
//						if (isok) {
//							buyCat.setBuyAmount(buyCat.getBuyAmount() + buyAmount);
//							buyCatService.update(buyCat);
//							bool = false;
//						}
//					}
//					if (bool) {
//						buyCatService.save(cat);
//					}
//				} else {
//					buyCatService.save(cat);
//				}
//			}
//		}
		mode.put("success", "true");
		return mode;
	}
}
