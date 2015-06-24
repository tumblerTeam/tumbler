package com.yc.controller.user;

import java.io.IOException;
import java.text.ParseException;
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

import com.yc.entity.BuyCar;
import com.yc.entity.CarCommodity;
import com.yc.entity.ShopCategory;
import com.yc.entity.user.AppUser;
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
}
