package com.yc.controller.user;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Address;
import com.yc.entity.BuyCar;
import com.yc.entity.CarCommodity;
import com.yc.entity.Commodity;
import com.yc.entity.Delivery;
import com.yc.entity.DeliveryAddress;
import com.yc.entity.OrderForm;
import com.yc.entity.OrderStatus;
import com.yc.entity.Shop;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommodity;
import com.yc.entity.user.AppUser;
import com.yc.service.IAddressService;
import com.yc.service.IAppUserService;
import com.yc.service.IBuyCarService;
import com.yc.service.ICarCommodityService;
import com.yc.service.ICommodityService;
import com.yc.service.IDeliveryAddressService;
import com.yc.service.IDeliveryService;
import com.yc.service.IOrderFormService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommodityService;
import com.yc.tumbler.service.ServiceTools;

@Controller
@RequestMapping("/user")
public class BuyCarController {

	@Resource
	ServiceTools serviceTools;
	
	@Autowired
	ICarCommodityService carCommodityService;
	
	@Autowired
	IAppUserService userService;
	
	@Autowired
	IShopCategoryService categoryService;
	
	@Autowired
	IBuyCarService buyCarService;
	
	@Autowired
	IAddressService addressService;
	
	@Autowired
	IDeliveryAddressService deliveryAddressService;
	
	@Autowired
	IShopCommodityService shopCommodityService;
	
	@Autowired
	IDeliveryService deliveryService;
	
	@Autowired
	ICommodityService commodityService;
	
	@Autowired
	IOrderFormService orderFormService;
	
	/**
	 * 刷新购物车方法
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping(value = "reCarCommodity", method = RequestMethod.GET)
	public ModelAndView reCarCommodity(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException{
		ModelMap mode = new ModelMap();
		List<ShopCategory> list = categoryService.getAllByParent();
		mode.put("categories", list);
		AppUser user = (AppUser) request.getSession().getAttribute("loginUser");
		List<CarCommodity> carCommodityList=carCommodityService.getCarCommodityByUserName(user.getPhone());
		List<CarCommodity> handleCarCommodities=serviceTools.handleCarCommodity(carCommodityList, user.getPhone());
		mode.put("list",handleCarCommodities);
		return new ModelAndView("user/myCar",mode);
	}
	
	/**
	 * 立刻购买
	 * @param shopCommId
	 * @param buyAmount
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping(value = "buyCommodity", method = RequestMethod.GET)
	public ModelAndView buyCommodity(Integer shopCommId, Integer buyAmount,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException{
		ModelMap mode = new ModelMap();
		AppUser user = (AppUser)request.getSession().getAttribute("loginUser");
		BuyCar buyCar = buyCarService.getBuyCarByUserName(user.getPhone());
		if(buyCar == null){
			buyCar = new BuyCar();
			buyCar.setAppUser(user);
			buyCar = buyCarService.save(buyCar);
		}
		List<CarCommodity> carCommodityList = new ArrayList<CarCommodity>();
		ShopCommodity shopCommodity = shopCommodityService.findById(shopCommId);
		if(shopCommodity != null){
			CarCommodity carCommodity = carCommodityService.getCarCommodityByShopCommId(shopCommId, user.getPhone());
			if (carCommodity != null) {
				if (shopCommodity.getCommCode() == carCommodity.getShopCommodity().getCommCode()) {
					if (shopCommodity.getIsSpecial()) {
						carCommodity.setUnitPrice(shopCommodity.getUnitPrice() * shopCommodity.getSpecial());
					} else {
						carCommodity.setUnitPrice(shopCommodity.getUnitPrice());
					}
					carCommodity.setAmount(buyAmount + carCommodity.getAmount());
					carCommodity.setPrice(carCommodity.getUnitPrice() * carCommodity.getAmount());
					carCommodity.setBuyCar(buyCar);
					carCommodity = carCommodityService.update(carCommodity);
					carCommodityList.add(carCommodity);
					mode.put("vars", carCommodity.getId()+",");
					List<CarCommodity> list = buyCar.getCarCommodities();
					list.add(carCommodity);
					buyCar.setCarCommodities(list);
					buyCarService.update(buyCar);
					mode.put("message", "existed");
				}
			} else {
				Shop shop = shopCommodity.getBelongTo();
				ShopCategory shopCate = shopCommodity.getShopCategory();
				carCommodity = new CarCommodity();
				carCommodity.setShopCommodity(shopCommodity);
				carCommodity.setShop(shop);
				carCommodity.setCarCategory(shopCate);
				carCommodity.setAmount(buyAmount);
				if (shopCommodity.getIsSpecial()) {
					carCommodity.setUnitPrice(shopCommodity.getUnitPrice() * shopCommodity.getSpecial());
				} else {
					carCommodity.setUnitPrice(shopCommodity.getUnitPrice());
				}
				carCommodity.setPrice(carCommodity.getUnitPrice() * carCommodity.getAmount());
				carCommodity.setBuyCar(buyCar);
				carCommodity = carCommodityService.save(carCommodity);
				carCommodityList.add(carCommodity);
				mode.put("vars", carCommodity.getId()+",");
				List<CarCommodity> list = buyCar.getCarCommodities();
				if (list != null) {
					list.add(carCommodity);
					buyCar.setCarCommodities(list);
				} else {
					list = new ArrayList<CarCommodity>();
					list.add(carCommodity);
					buyCar.setCarCommodities(list);
				}
				buyCarService.update(buyCar);
			}
		}
		List<CarCommodity> handleCarCommodities=serviceTools.handleCarCommodity(carCommodityList, user.getPhone());
		mode.put("list",handleCarCommodities);
		List<Address> addresses = addressService.getAllByUser(user.getId());
		mode.put("addresses", addresses);
		return new ModelAndView("user/orderConfirm",mode);
	}

	// 删除购物车产品
	@RequestMapping(value = "deleteShopCar", method = RequestMethod.GET)
	public String deleteShopCar(Integer id, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		CarCommodity carCommodity = carCommodityService.findById(id);
		if (carCommodity != null) {
			BuyCar car =carCommodity.getBuyCar();
			if (car != null) {
				car.getCarCommodities().remove(carCommodity);
				carCommodityService.delete(id);
			}
			if(car.getCarCommodities().size() ==0 ){
				buyCarService.delete(car.getCatID());
			}
		}
		return "redirect:/user/reCarCommodity";
	}
	
	@RequestMapping(value = "orderConfirm", method = RequestMethod.POST)
	public ModelAndView orderConfirm(String params,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException{
		ModelMap mode = new ModelMap();
		AppUser user = (AppUser)request.getSession().getAttribute("loginUser");
		List<ShopCategory> list = categoryService.getAllByParent();
		mode.put("categories", list);
		String var = "";
		if(!params.equals("")){
			String[] param = params.split(",");
			List<CarCommodity> carCommodityList = new ArrayList<CarCommodity>();
			for (int i = 0; i < param.length; i++) {
				if(!param[i].equals("")){
					CarCommodity carCommodity = carCommodityService.findById(Integer.parseInt(param[i].split("-")[0]));
					if(carCommodity != null){
						carCommodity.setAmount(Integer.parseInt(param[i].split("-")[1]));
						carCommodity.setPrice(Integer.parseInt(param[i].split("-")[1])*carCommodity.getUnitPrice());
						carCommodity = carCommodityService.update(carCommodity);
						carCommodityList.add(carCommodity);
						var = var + param[i].split("-")[0] +",";
					}
				}
			}
			List<CarCommodity> handleCarCommodities=serviceTools.handleCarCommodity(carCommodityList, user.getPhone());
			System.out.println("handleCarCommodities  === "+handleCarCommodities.size());
			mode.put("list",handleCarCommodities);
			List<Address> addresses = addressService.getAllByUser(user.getId());
			mode.put("addresses", addresses);
			mode.put("vars", var);
			return new ModelAndView("user/orderConfirm",mode);
		}
		List<CarCommodity> carCommodityList=carCommodityService.getCarCommodityByUserName(user.getPhone());
		List<CarCommodity> handleCarCommodities=serviceTools.handleCarCommodity(carCommodityList, user.getPhone());
		mode.put("list",handleCarCommodities);
		return new ModelAndView("user/myCar",mode);
	}
	
	/**
	 * 生成订单
	 * @param ids 购物车商品IDs
	 * @param shouhuoTime 收货时间
	 * @param xunshufangshi 运输方式
	 * @param yunfei 运费
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping(value = "orderGenerate", method = RequestMethod.POST)
	public ModelAndView orderGenerate(Integer mudidi, String ids,String shouhuoTime,String xunshufangshi,Float yunfei, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException{
		if(mudidi != -1){
			String[] carIds = ids.split(",");
			ModelMap mode = new ModelMap();
			AppUser user = (AppUser)request.getSession().getAttribute("loginUser");
			DeliveryAddress delivery = new DeliveryAddress();
			Address address = addressService.findById(mudidi);
			BeanUtils.copyProperties(address, delivery);
			delivery.setId(null);
//			delivery = deliveryAddressService.save(delivery);
			Delivery delivery2 = new Delivery();
			delivery2.setAddress(delivery);
			delivery2.setDeliveryName(xunshufangshi);
			delivery2.setEndorse(shouhuoTime);
			delivery2.setDeliveryMoney(yunfei);
//			delivery2 = deliveryService.save(delivery2);
			saveOrder(carIds, user, delivery2, mode);
		}
		return null;
	}
	
	private ModelMap saveOrder(String[] CarIds,AppUser appuser,Delivery delivery,ModelMap mode) throws ServletException, IOException{
		List<Commodity> commodities = new ArrayList<Commodity>();//存放所有的commodity集合
		List<OrderForm> orderformList=new ArrayList<OrderForm>();//存放生成的orderform集合
 		for (int i = 0; i < CarIds.length; i++) {
 			if(!CarIds[i].equals("")){
 				Commodity commodity=new Commodity();
 				int carId = Integer.parseInt(CarIds[i]);
 				CarCommodity carCommodity=carCommodityService.findById(carId);
 				commodity.setShopCommodity(carCommodity.getShopCommodity());
 				commodity.setShopcategory(carCommodity.getShopCommodity().getShopCategory());
 				commodity.setSeller(carCommodity.getShop());
 				commodity.setWeight(carCommodity.getShopCommodity().getProbablyWeight()*carCommodity.getAmount());
 				commodity.setCommSpec(carCommodity.getShopCommodity().getCommsPecs().getCommSpec());//添加规格信息 
 				commodity.setQuantity(carCommodity.getAmount());
 				commodity.setPrice(carCommodity.getUnitPrice());
 				commodity.setMoney(carCommodity.getPrice());
 				commodities.add(commodity);
 			}
		}
		while( commodities.size() > 0 ) {
			float total = 0f;
			List<Commodity> list = new ArrayList<Commodity>();//存放分组后的commodity集合
			list.add(commodities.get(0));
			total = total + commodities.get(0).getMoney();
			int shopId = commodities.get(0).getSeller().getId();
			commodities.remove(0);
			for ( int i = 0; i < commodities.size(); i++ ) {
				int id = commodities.get(i).getSeller().getId();
				if ( shopId == id ) {
					total = total + commodities.get(i).getMoney();
					list.add(commodities.get(i));
					commodities.remove(i);
					i--;
				}
			}
			//订单存储操作
			OrderForm orderform=new OrderForm();
			orderform.setCommodities(list);
			orderform.setTotalPrice(total);
			orderform.setOrderstatus(OrderStatus.waitPayment);
			orderform.setDelivery(delivery);
			orderform.setChangeStatusDate(new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss").format(new Date()));
			orderform.setOrderDate(new SimpleDateFormat("yyyy-MM-dd")
					.format(new Date()));
			orderform.setOrderTime(new SimpleDateFormat("HH:mm:ss")
					.format(new Date()));
			orderform.setOrderstatus(OrderStatus.waitDelivery);
			orderform.setOrderUser(appuser);
			orderform.setPaymentDate(new SimpleDateFormat("yyyy-MM-dd")
					.format(new Date()));
			orderform.setPaymentTime(new SimpleDateFormat("HH:mm:ss")
					.format(new Date()));
 			orderformList.add(orderform);
 			//积分
 			Integer jifen = 0;
 			for (int i = 0; i < list.size(); i++) {
 				list.get(i).setOrderNumber(orderform);
 				Commodity comm = commodityService.save(list.get(i));
 				if(comm != null){
 					jifen = jifen + comm.getMoney().intValue();
 				}
			}
 			jifen  = (jifen/100);
 			if(jifen.intValue()>0){
 				appuser.setPoints(appuser.getPoints()+jifen);
 				userService.update(appuser);
 			}
 			//删除下单商品
		}//while
		    for (int i = 0; i < CarIds.length; i++) {
				String carId = CarIds[i];
				carCommodityService.delete(Integer.parseInt(carId));
			}
		    //用户是否有购物车
		    BuyCar buycar=buyCarService.getBuyCarByUserName(appuser.getPhone().toString());
		    if(buycar!=null){
		    	//如果购物车为空 删除购物车
				List<CarCommodity> carcomms=buycar.getCarCommodities();
				if(carcomms.size()==0||carcomms==null){
					buyCarService.delete(buyCarService.getBuyCarByUserName(appuser.getPhone().toString()).getCatID());
				}
		    }
		mode.put("orderformList",orderformList);
		return mode;
	}

}
