package com.yc.controller.user;

import java.io.IOException;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yc.entity.Address;
import com.yc.entity.Collection;
import com.yc.entity.OrderForm;
import com.yc.entity.OrderStatus;
import com.yc.entity.ReviewsRank;
import com.yc.entity.Shop;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommodity;
import com.yc.entity.ShopReviews;
import com.yc.entity.user.AppUser;
import com.yc.service.IAddressService;
import com.yc.service.IAppUserService;
import com.yc.service.ICollectionService;
import com.yc.service.ICommodityService;
import com.yc.service.IOrderFormService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommodityService;
import com.yc.service.IShopReviewsService;
import com.yc.tumbler.service.TumblerService;
import com.yc.util.ServiceException;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger LOG = Logger.getLogger(UserController.class);

	@Autowired
	IAppUserService userService;

	@Autowired
	IShopCategoryService categoryService;

	@Resource
	TumblerService tumblerService;

	@Autowired
	IOrderFormService orderFormService;

	@Autowired
	ICollectionService collectionService;
	
	@Autowired
	IShopReviewsService	shopReviewsService;
	
	@Autowired
	IShopCommodityService shopCommodityService;
	
	@Autowired
	ICommodityService commodityService;
	
	@Autowired
	IAddressService addressService;

	@RequestMapping(value = "login", method = { RequestMethod.POST, RequestMethod.GET })
	public String login(String page, RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("mobile");
		String pwd = KL(JM(KL(MD5(request.getParameter("password")))));
		HttpSession session = request.getSession();
		AppUser personnel = userService.getUser(name);
		if (personnel == null) {
			request.getSession().setAttribute("message", "用户不存在！！");
			return "redirect:/user/regist?page=" + page;
		} else {
			if (personnel.getPassword().equals(pwd)) {
				session.setAttribute("loginUser", personnel);
				session.removeAttribute("loginPage");
				if (page.equals("")) {
					return "redirect:/index";
				} else {
					if(page.contains("user/regist")){
						return "redirect:/index";
					}
					return "redirect:" + page;
				}
			} else {
				request.getSession().setAttribute("message", "密码不正确！！");
				return "redirect:/user/regist?page=" + page;
			}
		}
	}

	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		Object obj = request.getSession().getAttribute("loginPage");
		if (obj != null) {
			mode.put("page", obj.toString());
		} else {
			mode.put("page", request.getHeader("Referer"));
		}
		return new ModelAndView("user/register", mode);
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("loginUser");
		return "redirect:/index";
	}

	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String registing(String page, String phone, String password, String mobile_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		AppUser user = userService.getUser(phone);
		if(user ==  null){
			HttpSession session = request.getSession();
			Object session_code = session.getAttribute("mobile_code");
			 user = new AppUser();
			if (session_code != null) {
				String session_mobileCode = session_code.toString();
				if (session_mobileCode.equals(mobile_code.trim())) {
					user.setPhone(phone);
					user.setPassword(KL(MD5(password)));
					user = userService.save(user);
				}
			}
		}
		return "redirect:/user/login?mobile=" + user.getPhone() + "&password=" + user.getPassword() + "&page=" + page;
	}

	@RequestMapping(value = "personalCenter", method = RequestMethod.GET)
	public ModelAndView personalCenter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		AppUser user = (AppUser)request.getSession().getAttribute("loginUser");
		List<ShopCategory> list = categoryService.getAllByParent();
		OrderForm orderForm=orderFormService.searchNewst();
		List<Collection> collections=collectionService.searchPart();
	    mode.put("orderForm", orderForm);
	    mode.put("collections", collections);
		mode.put("categories", list);
		mode.put("user",user);
		return new ModelAndView("user/personalCenter", mode);
	}

	@RequestMapping(value = "binding", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String action = request.getParameter("action");
		ModelAndView mav = new ModelAndView();
		if ("register".equals(action)) {
			AppUser user = userService.findById(Integer.parseInt(request.getParameter("id")));
			// 注册
			String email = request.getParameter("email");
			tumblerService.processregister(email, user);// 发邮箱激活
			mav.addObject("text", "注册成功");
			mav.setViewName("user/register_success");
		} else if ("activate".equals(action)) {
			// 激活
			String email = request.getParameter("email");// 获取email
			String validateCode = request.getParameter("validateCode");// 激活码

			try {
				tumblerService.processActivate(email, validateCode);// 调用激活方法
				mav.setViewName("user/activate_success");
			} catch (ServiceException e) {
				request.setAttribute("message", e.getMessage());
				mav.setViewName("user/activate_failure");
			}
		}
		return mav;
	}

	// 订单
	@RequestMapping(value = "perscentBonuses", method = RequestMethod.GET)
	public ModelAndView perscentBonuses(String orderDate, String orderStatus, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ShopCategory> list = categoryService.getAllByParent();
		mode.put("categories", list);
		AppUser user = (AppUser) request.getSession().getAttribute("loginUser");
		Map<String, Object> map = new HashMap<String, Object>();
		if (orderDate.equals("") || orderDate.equals("-1")) {
			map.put("orderDate", null);
		} else {
			map.put("orderDate", orderDate);
		}
		if (orderStatus.equals("") || orderStatus.equals("-1")) {
			map.put("orderStatus", null);
		} else {
			map.put("orderStatus", orderStatus);
		}
		List<OrderForm> orders = orderFormService.getAllByParams(map, user.getId());
		mode.put("orderForms", orders);
		mode.put("orderDate", orderDate);
		mode.put("orderStatus", orderStatus);
		return new ModelAndView("user/perscentBonuses", mode);
	}

	// 所有收藏
	@RequestMapping(value = "collection", method = RequestMethod.GET)
	public ModelAndView getAllCollection(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		AppUser user = (AppUser) request.getSession().getAttribute("loginUser");
		List<Collection> collections = collectionService.getAllByUser(user.getId());
		List<ShopCategory> list = categoryService.getAllByParent();
		mode.put("categories", list);
		mode.put("collections", collections);
		mode.put("user", user);
		return new ModelAndView("user/collection", mode);
	}

	// 删除收藏
	@RequestMapping(value = "deleteCollection", method = RequestMethod.GET)
	public String deleteCollection(Integer collectionID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		collectionService.delete(collectionID);
		return "redirect:/user/collection";
	}
	// 跳转经典红酒
	@RequestMapping(value = "skipWinePage", method = RequestMethod.GET)
	public ModelAndView skipWinePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("user/wineRecommend", null);
	}
	// 跳转经典白酒
	@RequestMapping(value = "skipLiqueurPage", method = RequestMethod.GET)
	public ModelAndView skipLiqueurPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("user/liqueurRecommend", null);
	}
	// 跳转经典啤酒
	@RequestMapping(value = "skipBierPage", method = RequestMethod.GET)
	public ModelAndView skipBierPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("user/bierRecommend", null);
	}
	// 跳转经典洋酒
	@RequestMapping(value = "skipSpiritsPage", method = RequestMethod.GET)
	public ModelAndView skipSpiritsPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("user/spiritsRecommend", null);
	}
	// 跳转酒具和小菜
	@RequestMapping(value = "skipToolPage", method = RequestMethod.GET)
	public ModelAndView skipToolPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("user/wineTool", null);
	}
	
	// 点评
	@RequestMapping(value = "reviews", method = RequestMethod.POST)
	public String reviews(Integer orderFormID,Integer commCode, String reviewsRank,String businessreply, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopReviews reviews = shopReviewsService.getAllByOrderAndComm(orderFormID,commCode);
		OrderForm orderform = orderFormService.findById(orderFormID);
		ShopCommodity commodity = shopCommodityService.findById(commCode);
		AppUser user = (AppUser)request.getSession().getAttribute("loginUser");
		if(reviews == null){
			reviews = new ShopReviews();
			reviews.setReviews(businessreply);
			reviews.setReviewsRank(ReviewsRank.valueOf(reviewsRank));
			reviews.setReviewsdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			reviews.setReviewTime(new SimpleDateFormat("HH:mm:ss").format(new Date()));
			reviews.setOrderForm(orderform);
			reviews.setShopscommodity(commodity);
			reviews.setUser(user);
			shopReviewsService.save(reviews);
		}else{
			reviews.setAdditionalReviews(businessreply);
			shopReviewsService.update(reviews);
		}
		return "redirect:"+request.getHeader("Referer");
	}
	
	@RequestMapping(value = "myrReviews", method = RequestMethod.GET)
	public ModelAndView myrReviews( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<ShopCategory> list2 = categoryService.getAllByParent();
		mode.put("categories", list2);
		AppUser user =(AppUser)request.getSession().getAttribute("loginUser");
		List<ShopReviews> list = shopReviewsService.getReviewsByUser(user.getId());
		mode.put("list", list);
		return new ModelAndView("user/myrReviews",mode);
	}
	
	@RequestMapping(value = "comitComm", method = RequestMethod.GET)
	public String comitComm(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("id=-==========="+id);
		OrderForm orderform = orderFormService.findById(id);
		orderform.setOrderstatus(OrderStatus.completionTransaction);
		orderFormService.update(orderform);
		return "redirect:/user/perscentBonuses?orderDate=-1&orderStatus=-1";
	}
	
	@RequestMapping(value = "quxiao", method = RequestMethod.GET)
	public String quxiao(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderForm orderform = orderFormService.findById(id);
		for (int i = 0; i < orderform.getCommodities().size(); i++) {
			commodityService.delete(orderform.getCommodities().get(i).getCommodityID());
		}
		orderFormService.delete(id);
		return "redirect:/user/perscentBonuses?orderDate=-1&orderStatus=-1";
	}
	
	@RequestMapping(value = "wuliu", method = RequestMethod.GET)
	public ModelAndView wuliu( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		return new ModelAndView("user/wuliu");
	}
	
	//新增收货地址：
	@RequestMapping("addNewAddress")
	public String addNewAddress(HttpServletRequest req){
		String shopCommId = req.getParameter("shopCommId");
		String buyAmount = req.getParameter("buyAmount");
		ModelMap mode = new ModelMap();
		AppUser user = (AppUser)req.getSession().getAttribute("loginUser");
		String toName = req.getParameter("toName");
		String toEmail = req.getParameter("toEmail");
		String street = req.getParameter("street");
		String phone = req.getParameter("phone");
		String province = req.getParameter("province");
		String city = req.getParameter("city");
		String area = req.getParameter("area");
		String defaults = req.getParameter("default");
		Address address = new Address();
		address.setToEmail(toEmail);
		address.setToName(toName);
		address.setOther(street);
		address.setPhone(phone);
		address.setProvience(province);
		address.setCity(city);
		address.setDistrict(area);
		//设置默认地址
		if (defaults!=null) {
			List<Address> addresses = addressService.getAll();
			for (int i = 0; i < addresses.size(); i++) {
				if (addresses.get(i).getTheDefault()) {
					addresses.get(i).setTheDefault(false);
				}
			}
			address.setTheDefault(true);
		}else {
			address.setTheDefault(false);
		}
		address.setUser(user);
		addressService.save(address);
		List<Address> addresses = addressService.getAll();
		mode.put("addresses", addresses);
		return "redirect:buyCommodity?shopCommId="+shopCommId+"&buyAmount="+buyAmount;
	}
		
	// MD5加码。32位
	public static String MD5(String inStr) {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}
		char[] charArray = inStr.toCharArray();
		byte[] byteArray = new byte[charArray.length];

		for (int i = 0; i < charArray.length; i++)
			byteArray[i] = (byte) charArray[i];

		byte[] md5Bytes = md5.digest(byteArray);

		StringBuffer hexValue = new StringBuffer();

		for (int i = 0; i < md5Bytes.length; i++) {
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16)
				hexValue.append("0");
			hexValue.append(Integer.toHexString(val));
		}

		return hexValue.toString();
	}

	// 可逆的加密算法
	public static String KL(String inStr) {
		// String s = new String(inStr);
		char[] a = inStr.toCharArray();
		for (int i = 0; i < a.length; i++) {
			a[i] = (char) (a[i] ^ 't');
		}
		String s = new String(a);
		return s;
	}

	// 加密后解密
	public static String JM(String inStr) {
		char[] a = inStr.toCharArray();
		for (int i = 0; i < a.length; i++) {
			a[i] = (char) (a[i] ^ 't');
		}
		String k = new String(a);
		return k;
	}
}
