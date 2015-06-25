package com.yc.controller.user;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Address;
import com.yc.entity.BuyCar;
import com.yc.entity.CarCommodity;
import com.yc.entity.ShopCategory;
import com.yc.entity.user.AppUser;
import com.yc.service.IAddressService;
import com.yc.service.IAppUserService;
import com.yc.service.IBuyCarService;
import com.yc.service.ICarCommodityService;
import com.yc.service.IShopCategoryService;
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
	public String buyCommodity(Integer shopCommId, Integer buyAmount,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException{
		ModelMap mode = new ModelMap();
		AppUser user = (AppUser)request.getSession().getAttribute("loginUser");
		serviceTools.addCarCommodity(buyAmount, shopCommId, mode, user);
		return "redirect:/user/reCarCommodity";
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
	public ModelAndView orderGenerate(String ids,String shouhuoTime,String xunshufangshi,Float yunfei, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException{
		String[] carIds = ids.split(",");
		
		return null;
	}
	
	
//	//String[] CarIds,AppUser appuser,DeliveryAddress address,Delivery delivery
//	public Map<String, Object> SaveOrder() throws ServletException, IOException{
//		String[] CarIds=new String[]{"12","13","14"}; 
//		AppUser appuser=appUserService.findById(3);
//		System.out.println("===="+appuser.getPhone().toString());
//		System.out.println("===="+buyCarService.getBuyCarByUserName(appuser.getPhone().toString()));
//		DeliveryAddress address=deliveryAddressService.findById(1);
//		Delivery delivery=deliveryService.findById(1);
//		List<Commodity> commodities = new ArrayList<Commodity>();//存放所有的commodity集合
//		List<OrderForm> orderformList=new ArrayList<OrderForm>();//存放生成的orderform集合
// 		for (int i = 0; i < CarIds.length; i++) {
//			Commodity commodity=new Commodity();
//			int carId = Integer.parseInt(CarIds[i]);
//			CarCommodity carCommodity=carCommodityService.findById(carId);
//			commodity.setShopCommodity(carCommodity.getShopCommodity());
//			commodity.setShopcategory(carCommodity.getShopCommodity().getShopCategory());
//			commodity.setSeller(carCommodity.getShop());
//			commodity.setWeight(carCommodity.getShopCommodity().getProbablyWeight()*carCommodity.getAmount());
////			commodity.setCommSpec(carCommodity.getShopCommodity().getCommsPecs().getCommSpec());//添加规格信息 
//			commodity.setQuantity(carCommodity.getAmount());
//			commodity.setPrice(carCommodity.getUnitPrice());
//			commodity.setMoney(carCommodity.getPrice());
//			commodities.add(commodity);
//		}
//		while( commodities.size() > 0 ) {
//			List<Commodity> list = new ArrayList<Commodity>();//存放分组后的commodity集合
//			list.add(commodities.get(0));
//			int shopId = commodities.get(0).getSeller().getId();
//			commodities.remove(0);
//			for ( int i = 0; i < commodities.size(); i++ ) {
//				int id = commodities.get(i).getSeller().getId();
//				if ( shopId == id ) {
//					list.add(commodities.get(i));
//					commodities.remove(i);
//					i--;
//				}
//			}
//			
//			//订单存储操作
//			OrderForm orderform=new OrderForm();
//			orderform.setCommodities(list);
//			orderform.setOrderstatus(OrderStatus.valueOf("waitPayment"));
//			orderform.setDeliveryMoney(250f);//运费再议
//			orderform.setAddress(address);
//			orderform.setDelivery(delivery);
//			//积分
//			orderform.setOrderUser(appuser);
// 			orderFormService.save(orderform);
// 			orderformList.add(orderform);
// 			for (int i = 0; i < list.size(); i++) {
// 				list.get(i).setOrderNumber(orderform);
// 				commodityService.save(list.get(i));
//			}
// 			//删除下单商品
//		}//while
//		    for (int i = 0; i < CarIds.length; i++) {
//				String carId = CarIds[i];
//				carCommodityService.delete(Integer.parseInt(carId));
//			}
//		    //用户是否有购物车
//		    BuyCar buycar=buyCarService.getBuyCarByUserName(appuser.getPhone().toString());
//		    if(buycar!=null){
//		    	//如果购物车为空 删除购物车
//				List<CarCommodity> carcomms=buycar.getCarCommodities();
//				if(carcomms.size()==0||carcomms==null){
//					buyCarService.delete(buyCarService.getBuyCarByUserName(appuser.getPhone().toString()).getCatID());
//				}
//		    }
//		mode.put("orderformList",orderformList);
//		return null;
//	}

}
