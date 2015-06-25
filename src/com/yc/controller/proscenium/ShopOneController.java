package com.yc.controller.proscenium;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.Address;
import com.yc.entity.Brand;
import com.yc.entity.Currency;
import com.yc.entity.FamousManor;
import com.yc.entity.OrderForm;
import com.yc.entity.OrderStatus;
import com.yc.entity.Shop;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommImage;
import com.yc.entity.ShopCommodity;
import com.yc.entity.ShopCommoditySpecs;
import com.yc.entity.ShopReviews;
import com.yc.entity.ShopType;
import com.yc.entity.user.AppUser;
import com.yc.service.IAddressService;
import com.yc.service.IAdvertisementDistributionService;
import com.yc.service.IAdvertisementService;
import com.yc.service.IAppUserService;
import com.yc.service.IBrandService;
import com.yc.service.IBuyCarService;
import com.yc.service.ICarCommodityService;
import com.yc.service.ICommodityService;
import com.yc.service.ICurrencyService;
import com.yc.service.IFamousManorService;
import com.yc.service.IOrderFormService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommImageService;
import com.yc.service.IShopCommodityService;
import com.yc.service.IShopCommoidtySpecsService;
import com.yc.service.IShopReviewsService;
import com.yc.service.IShopService;
import com.yc.service.ISpecificationsService;

//前台
@Controller
@RequestMapping("/proscenium")
public class ShopOneController {

	@Autowired
	IShopService shopService;// 商店

	@Autowired
	IShopCommodityService shopCommService;// 商品

	@Autowired
	IShopCommoidtySpecsService commoidtySpecsService;

	@Autowired
	IShopReviewsService shopReviewsService;// 评论

	@Autowired
	IShopCategoryService shopCategService;// 类别
	
	@Autowired
	ISpecificationsService specificationService;// 货品规格

	@Autowired
	IBrandService brandService;// 品牌

	@Autowired
	IShopReviewsService reviewsService; //评论
	
	@Autowired
	IAddressService addressService; //地址
	
	@Autowired
	IShopCommImageService shopCommImageService;

	@Autowired
	IAppUserService userService;

	@Autowired
	ICurrencyService currencyService;

	@Autowired
	ICommodityService commodityService;

	@Autowired
	IShopCommodityService shopCommodityService;
	
	@Autowired
	IOrderFormService orderFormService;
	
	@Autowired
	IAdvertisementService advertisementService;
	
	@Autowired
	IAdvertisementDistributionService adverDistributionService;
	
	@Autowired
	IFamousManorService famousManorService; //名庄
	
	@Autowired
	ICarCommodityService carCommodityService;

	@Autowired
	IBuyCarService buyCarService;
	
	//免费开店
	@RequestMapping("openShop")
	public ModelAndView openShop(){
		return new ModelAndView("setupShop/openShop");
	}
	//开个人店
	@RequestMapping("open_geren")
	public String open_geren(){
		return "setupShop/open_geren";
	}
	//开企业店
	@RequestMapping("open_qiye")
	public String open_qiye(){
		return "setupShop/open_qiye";
	}
		
	// 发布商品list添加
	@RequestMapping("releaseCommoidty")
	public ModelAndView releaseCommoidty(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//AppUser user = (AppUser) request.getSession().getAttribute("appUser");
		ModelMap mode = new ModelMap();
		//1.红酒
		List<ShopCategory> list = shopCategService.getAllByParentLevel(1);
		mode.put("shopCategories", list);
		//后期改
		List<ShopCategory> listtemp = new ArrayList<ShopCategory>();
		List<ShopCategory> list2 = new ArrayList<ShopCategory>();
		for (int i = 1; i < list.size(); i++) {
			listtemp = shopCategService.getAllByParentLevel(list.get(i).getCategoryID());
			list2.addAll(listtemp);
		}
		mode.put("list2", list2);
		//设置表shopcategory的每个类型（红酒、啤酒等）的第一个字段category为“品牌”
		mode.put("listBrand", shopCategService.getAllByParentLevel(list.get(0).getCategoryID()));
		//显示所有名庄
		List<FamousManor> famousManors = famousManorService.getAll();
		mode.put("famousManors", famousManors);
		Shop shop = shopService.getShopByUser(1);//user.getId(),现在设为1
		List<Currency> currencyList = currencyService.getAll();
		System.out.println("LIST的大小为："+list.size());
		mode.put("shop", shop);
		mode.put("currencylist", currencyList);
		return new ModelAndView("setupShop/releaseCommoidty", mode);
	}
	//保存商品+编辑商品
	@RequestMapping("saveCommodity")
	public String saveCommodity(@RequestParam MultipartFile [] myfile,HttpServletRequest req , HttpServletResponse resp) throws IOException{
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		
		//是否已经开店判断
		if (req.getSession().getAttribute("shop")!=null) {
			String commoidtyName = req.getParameter("commoidtyName");
			String commItem = req.getParameter("commItem");
			/**
			 * 得到该商品的商品分类categoryID
			 * 下面对应表shopCommodity与表shopCategory关系
			 */
			Integer categoryid = Integer.parseInt(req.getParameter("categoryid"));
			Integer stock = Integer.valueOf(req.getParameter("stock"));
			float unitPrice = Float.valueOf(req.getParameter("unitPrice"));
			float probablyWeight = Float.valueOf(req.getParameter("probablyWeight"));
			//是否上架
			Boolean shelves = Boolean.valueOf(req.getParameter("shelves").toString());
			//是否精品
			Boolean iscChoice = Boolean.valueOf(req.getParameter("iscChoice").toString());
			//是否团购
			Boolean auction = Boolean.valueOf(req.getParameter("auction").toString());
			//是否折扣
			Boolean isSpecial = Boolean.valueOf(req.getParameter("isSpecial").toString());
			//打几折
			float special = 10;
			if (req.getParameter("special")!=null) {
				special = Float.valueOf(req.getParameter("special"));
			}
			//品牌名称
			String brandName = req.getParameter("brandName");
			ShopCommodity commodity = null;
			String edit = req.getParameter("edit");
			if (edit.equals("1")) { //如果是编辑商品
				Integer commId = Integer.parseInt(req.getParameter("commId"));
				commodity = shopCommodityService.findById(commId);
			}else { //如果是保存新商品
				commodity = new ShopCommodity();
			}
			commodity.setCommoidtyName(commoidtyName);
			commodity.setCommItem(commItem);
			commodity.setStock(stock);
			commodity.setUnitPrice(unitPrice);
			commodity.setProbablyWeight(probablyWeight);
			commodity.setShelves(shelves);
			commodity.setIscChoice(iscChoice);
			commodity.setAuction(auction);
			commodity.setIsSpecial(isSpecial);
			commodity.setSpecial(special);
			ShopCategory shopCategory = shopCategService.findById(categoryid);
			commodity.setShopCategory(shopCategory);
			Brand brand = brandService.getBrandName(brandName);
			commodity.setBrand(brand);
			/**设置商品所属店面：setBelongTo
			 * commodity.setBelongTo(belongTo);
			 */
			//设置所属店面shop
			commodity.setBelongTo(shop);
			
			/**
			 * 编辑商品：
			 */
			shopCommodityService.save(commodity);	
			String endType = "";
			if (myfile!=null&&myfile.length>0) {
				for (int i = 0; i < myfile.length; i++) {
					ShopCommImage commImage = new ShopCommImage();
					MultipartFile file = myfile[i];
	            	//利用时间解决文件覆盖问题：
	            	Long fname = System.currentTimeMillis();
					saveFileOfCommImage(fname,commodity,req ,file);
	    			String name2 = file.getOriginalFilename();
	    			// 得到要上传文件的后缀名
	    			endType = name2.substring(name2.lastIndexOf("."),name2.length());
	    			System.out.println("得到的EndTYPE是：：：：：："+endType);
	            	String pathStr = "D:/tumbler/images/"+commodity.getCommItem()+"/";
	            	File path = new File(pathStr).getCanonicalFile();
					commImage.setImagePath(path.toString()+"/"+fname+endType);
					commImage.setShopCommoidty(commodity);
					shopCommImageService.save(commImage);
				}
			}
			return "success";
		}else{
			return "failure";
		}
	}
	//保存文件：
	private boolean saveFileOfCommImage(Long fname ,ShopCommodity commodity ,HttpServletRequest req, MultipartFile file) {  
		String endType = "";
        // 判断文件是否为空  
        if (!file.isEmpty()) {  
            try {
//	                // 文件保存路径  
//	                String filePath = req.getSession().getServletContext().getRealPath("/") + ""  
//	                        + file.getOriginalFilename();
    			String name2 = file.getOriginalFilename();
    			// 得到要上传文件的后缀名
    			endType = name2.substring(name2.lastIndexOf("."),name2.length());
            	String pathStr = "D:/tumbler/images/"+commodity.getCommItem()+"/";
            	File path = new File(pathStr).getCanonicalFile();
            	if (!path.exists() || path.isFile()) {
        			path.mkdir();
        		}
                // 转存文件  
                System.out.println("文件的保存路径："+path);
				file.transferTo(new File(path,fname+endType));
                return true;
            } catch (Exception e) {  
                e.printStackTrace();  
            }
        }  
        return false;  
    }
	//出售中的商品+仓库中的商品
	@RequestMapping("chushou")
	public ModelAndView chushou(HttpServletRequest req, HttpServletResponse resp){
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		
		ModelMap mode = new ModelMap();
		//若flag为1表示出售中的商品，若flag为0表示仓库
		String flag = req.getParameter("flag");
		List<ShopCommodity> commodities = null;
		if (flag.equals("1")) {
			//通过是否上架（shelves）和商家ID查询出售中的商品
			commodities = shopCommodityService.getAllByCondition("shelves", true, shop.getId());
		}else if (flag.equals("0")) {
			commodities = shopCommodityService.getAllByCondition("shelves", false, shop.getId());
		}
		mode.put("commodities", commodities);
		return new ModelAndView("setupShop/chushou",mode);
	}
	
	//编辑商品：
	@RequestMapping("editCommoidty")
	public ModelAndView editCommoidty(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		Integer commid = Integer.parseInt(req.getParameter("commid"));
		ShopCommodity commodity = shopCommodityService.findById(commid);
		//1.红酒
		List<ShopCategory> list = shopCategService.getAllByParentLevel(1);
		mode.put("shopCategories", list);
		//后期改
		List<ShopCategory> listtemp = new ArrayList<ShopCategory>();
		List<ShopCategory> list2 = new ArrayList<ShopCategory>();
		for (int i = 1; i < list.size(); i++) {
			listtemp = shopCategService.getAllByParentLevel(list.get(i).getCategoryID());
			list2.addAll(listtemp);
		}
		mode.put("list2", list2);
		mode.addAttribute("commodity", commodity);
		//设置表shopcategory的每个类型（红酒、啤酒等）的第一个字段category为“品牌”
		mode.put("listBrand", shopCategService.getAllByParentLevel(list.get(0).getCategoryID()));
		//显示所有名庄
		List<FamousManor> famousManors = famousManorService.getAll();
		mode.put("famousManors", famousManors);
		return new ModelAndView("setupShop/editCommoidty",mode);
	}
	
	//删除商品图片：
	@RequestMapping("delShopCommImage")
	@ResponseBody
	public Map<String, Object> delShopCommImage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		System.out.println("已经加载到。。。。delShopImage");
		Integer imgId = Integer.valueOf(req.getParameter("imgId"));
//		resp.setContentType("text/html;charset=UTF-8");
//		resp.getWriter().write("删除成功！");
		shopCommImageService.delete(imgId);
		mode.put("success", "删除成功");
		return mode;
	}
	//批量删除商品 multiDelComm
	@RequestMapping("multiDelComm")
	public String multiDelComm(HttpServletRequest req , HttpServletResponse resp) throws IOException{
		String name[] = req.getParameterValues("checkbox");
		System.out.println("NAME的大小是：：：：：："+name.length);
		for (String i : name) {
			int id = Integer.parseInt(i);
			System.out.println("已经得到了id:"+id);
			ShopCommodity commodity = shopCommodityService.findById(id);
			List<ShopCommImage> commImages = commodity.getShopCommImages();
			for (int j = 0; j < commImages.size(); j++) {
				shopCommImageService.delete(commImages.get(j).getImageID());
			}
			shopCommodityService.delete(id);
		}
		return "success";
	}
	//商品下架
	@RequestMapping("downComm")
	public String downComm(HttpServletRequest req , HttpServletResponse resp){
		Integer commId = Integer.parseInt(req.getParameter("commId"));
		ShopCommodity shopCommodity = shopCommodityService.findById(commId);
		shopCommodity.setShelves(false);
		shopCommodityService.update(shopCommodity);
		return "success";
	}
	//批量商品下架
	@RequestMapping("multiDownComm")
	public String multiDownComm(HttpServletRequest req , HttpServletResponse resp){
		String name[] = req.getParameterValues("checkbox");
		for (String i : name) {
			int id = Integer.parseInt(i);
			ShopCommodity shopCommodity = shopCommodityService.findById(id);
			shopCommodity.setShelves(false);
			shopCommodityService.update(shopCommodity);
		}
		return "success";
	}
	//出售中的商品搜索栏：map commoidtyName商品名称、commItem商品货号、commCode商品编码
	@RequestMapping("searchCommName")
	public ModelAndView searchCommName(HttpServletRequest req , HttpServletResponse resp){
		ModelMap mode = new ModelMap();
		Map<String, Object> map = new HashMap<String, Object>();
		String commoidtyName = req.getParameter("commoidtyName");
		String commItem = req.getParameter("commItem");
		Integer commCode = 0;
		if (req.getParameter("commCode")!=null&&!req.getParameter("commCode").equals("")) {
			commCode = Integer.parseInt(req.getParameter("commCode"));
		}
		map.put("commoidtyName", commoidtyName);
		map.put("commItem", commItem);
		map.put("commCode", commCode);
		List<ShopCommodity> commodities = shopCommodityService.getAllByParamsForBlack(map);
		mode.put("commodities", commodities);
		return new ModelAndView("setupShop/chushou",mode);
	}
	//出售中的商品搜索栏：map commoidtyName商品名称、commItem商品货号、commCode商品编码
	@RequestMapping("searchCommNameCateBrand")
	public ModelAndView searchCommNameCateBrand(HttpServletRequest req , HttpServletResponse resp){
		ModelMap mode = new ModelMap();
		String name = req.getParameter("name");
		List<ShopCommodity> commodities = shopCommodityService.searchShopComm(name);
		mode.put("commodities", commodities);
		return new ModelAndView("setupShop/chushou",mode);
	}
	//已卖出的商品
	@RequestMapping("soldComm")
	public ModelAndView soldComm(HttpServletRequest req , HttpServletResponse resp){
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		ModelMap mode = new ModelMap();
		//1.查询3个月之内的订单
		List<OrderForm> order3Month = orderFormService.getShopOrderByShop(shop.getId());
		mode.put("order3Month", order3Month);
		System.out.println("三个月以内的订单数量："+order3Month.size()); 
		//2.查询等待买家付款订单
		List<OrderForm> waitPayment = orderFormService.getAllByOrderStatus("waitPayment");	
		mode.put("waitPayment", waitPayment);
		//3.查询等待卖家发货订单
		List<OrderForm> waitDelivery = orderFormService.getAllByOrderStatus("waitDelivery");	
		mode.put("waitDelivery", waitDelivery);
		//4.查询已发货订单
		List<OrderForm> transitGoods = orderFormService.getAllByOrderStatus("transitGoods");	
		mode.put("transitGoods", transitGoods);
		//5.查询退款中订单
		List<OrderForm> refundOrderForm = orderFormService.getAllByOrderStatus("refundOrderForm");	
		mode.put("refundOrderForm", refundOrderForm);
		//6.查询退款成功订单
		List<OrderForm> refundSuccess = orderFormService.getAllByOrderStatus("refundSuccess");	
		mode.put("refundSuccess", refundSuccess);
		//7.查询成功订单
		List<OrderForm> completionTransaction = orderFormService.getAllByOrderStatus("completionTransaction");	
		mode.put("completionTransaction", completionTransaction);
		//8.查询关闭订单
		List<OrderForm> closeTransaction = orderFormService.getAllByOrderStatus("closeTransaction");	
		mode.put("closeTransaction", closeTransaction);
		return new ModelAndView("setupShop/soldComm",mode);
	}
	//已卖出的商品的商品搜索栏：
	@RequestMapping("searchAlrdyComm")
	public ModelAndView searchAlrdyComm(HttpServletRequest req , HttpServletResponse resp) throws ParseException{
		ModelMap mode = new ModelMap();
		Map<String, Object> map = new HashMap<String,Object>();
		String commName = req.getParameter("commName");
		String firstDate = req.getParameter("firstDate");
		String lastDate = req.getParameter("lastDate");
		String uname = req.getParameter("uname");
		String orderStatusFrom = req.getParameter("orderStatusFrom");
		Integer orderId = Integer.valueOf(req.getParameter("orderId"));
		map.put("nameOfGoods", commName);
		map.put("uname", uname);
		map.put("orderId", orderId);
		map.put("orderStatusFrom", orderStatusFrom);
		map.put("paymentDateLeft", firstDate);
		map.put("paymentDateRight", lastDate);
		List<OrderForm> searchOrders = orderFormService.getShopOrderByParam(map,1);
		mode.put("searchOrders", searchOrders);
		return new ModelAndView("setupShop/searchOrders",mode);
	}
	//批量发货
	@RequestMapping("multiDelivery")
	public ModelAndView multiDelivery(HttpServletRequest req , HttpServletResponse resp) throws ParseException{
		ModelMap mode = new ModelMap();
		String names[] = req.getParameterValues("checkbox");
		List<OrderForm> orderForms = new ArrayList<OrderForm>();
		for (String i : names) {
			Integer id = Integer.parseInt(i);
			orderForms.add(orderFormService.findById(id));
		}
		System.out.println("订单共：：：：："+orderForms.size()+":::"+orderForms.get(0).getCommodities().size());
		mode.put("orderForms", orderForms);
		mode.put("checkboxs", names);
		return new ModelAndView("setupShop/deliveryComm",mode);
	}
	//发货
	@RequestMapping("deliveryComm")
	public ModelAndView deliveryComm(HttpServletRequest req , HttpServletResponse resp) throws ParseException{
		ModelMap mode = new ModelMap();
		Integer orderFormID = Integer.parseInt(req.getParameter("orderFormID"));
		String packageCode = req.getParameter("packageCode");
		String totalWeight = req.getParameter("totalWeight");
		String grossWeight = req.getParameter("grossWeight");
		String transportFee = req.getParameter("transportFee");
		//创建日期：
		Date date = new Date();
		OrderForm orderForm = orderFormService.findById(orderFormID);
		orderForm.setOrderstatus(OrderStatus.transitGoods);
		orderFormService.update(orderForm);
		return new ModelAndView("setupShop/deliveryComm",mode);
	}
	//评价管理
	@RequestMapping("evaluationManage")
	public ModelAndView evaluationManage(HttpServletRequest req){
		ModelMap mode = new ModelMap();
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		//得到来自买家的评论
		List<ShopReviews> reviews = reviewsService.getReviewsByShop(shop.getId());
		mode.put("reviews", reviews);
		//得到来自卖家的评论
		if (shop.getUser()!=null) {
			List<ShopReviews> reviews2 = reviewsService.getReviewsByUser(shop.getUser().getId());
			mode.put("reviews2", reviews2);
		}
		//得到一周
		Integer []oneWeek = reviewsService.getReviewsByDate(1, 0, shop.getId());
		mode.put("oneWeek", oneWeek);
		//得到1个月
		Integer []oneMonth = reviewsService.getReviewsByDate(0, 1, shop.getId());
		mode.put("oneMonth", oneMonth);
		//得到6个月
		Integer []sixMonth = reviewsService.getReviewsByDate(0, 6, shop.getId());
		mode.put("sixMonth", sixMonth);
		//得到1年
		Integer []twelveMonth = reviewsService.getReviewsByDate(0, 12, shop.getId());
		mode.put("twelveMonth", twelveMonth);
		//得到全部
		Integer []allMonth = reviewsService.getReviewsByDate(0, -1, shop.getId());
		mode.put("allMonth", allMonth);
		return new ModelAndView("setupShop/evaluationManage",mode);
	}
	
	//退款管理
	@RequestMapping("refund")
	public ModelAndView refund(HttpServletRequest req) throws ParseException{
		ModelMap mode = new ModelMap();
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		//我收到的退款申请
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("orderStatusRefunding", "refundOrderForm");
		map.put("orderStatusRefundSuccess", "refundSuccess");
		map.put("orderStatusRefundfail", "refundFailed");
		List<OrderForm> orderFormsOfShop = orderFormService.getAllRefundByStatus(map , shop.getId());
		mode.put("orderFormsOfShop", orderFormsOfShop);
		//我申请的退款
		if (shop.getUser()!=null) {
			List<OrderForm> orderFormsOfUser = orderFormService.getAllRefundByStatusUID(map , shop.getUser().getId());
			mode.put("orderFormsOfUser", orderFormsOfUser);			
		}
		return new ModelAndView("setupShop/refund", mode);
	}
	
	//搜索退款
	@RequestMapping("searchRefund")
	public ModelAndView searchRefund(HttpServletRequest req) throws ParseException{
		ModelMap mode = new ModelMap();
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		
		Integer orderFormID = Integer.parseInt(req.getParameter("orderFormID")); 
		String nameOfGoods = req.getParameter("nameOfGoods");
		String orderStatusFrom = req.getParameter("orderStatusFrom");
		String paymentDateLeft = req.getParameter("paymentDateLeft");
		String paymentDateRight = req.getParameter("paymentDateRight");
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("orderFormID", orderFormID);
		map.put("nameOfGoods", nameOfGoods);
		map.put("orderStatusFrom", orderStatusFrom);
		map.put("paymentDateLeft", paymentDateLeft);
		map.put("paymentDateRight", paymentDateRight);
		List<OrderForm> orderForms = orderFormService.getShopOrderByParam(map, shop.getId());
		mode.put("orderForms", orderForms);
		return new ModelAndView("setupShop/searchRefund",mode);		
	}
	
	//账号管理界面
	@RequestMapping("accountManage")
	public ModelAndView accountManage(HttpServletRequest req){
		ModelMap mode = new ModelMap();
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		mode.put("shop", shop);
		List<Address> addresses = addressService.getAll();
		mode.put("addresses", addresses);
		return new ModelAndView("setupShop/accountManage",mode);
	}
	//保存账号信息
	@RequestMapping("saveAccount")
	public ModelAndView saveAccount(HttpServletRequest req){
		ModelMap mode = new ModelMap();
		Integer shopId = Integer.parseInt(req.getParameter("shopId"));
		String userName = req.getParameter("userName");
		String shopName = req.getParameter("shopName");
		String sex = req.getParameter("sex");
		String birthday = req.getParameter("birthday");
		String province = req.getParameter("province");
		String city = req.getParameter("city");
		String area = req.getParameter("area");
		Shop shop = shopService.findById(shopId);
		shop.getUser().setUserName(userName);
		shop.setShopName(shopName);
		shop.setSex(sex);
		shop.setBirthday(birthday);
		shop.setAddress(province+" "+city+" "+area);
		shopService.update(shop);
		List<Address> addresses = addressService.getAll();
		mode.put("addresses", addresses);
		return new ModelAndView("setupShop/accountManage",mode);
	}
	//新增收货地址：
	@RequestMapping("saveAddress")
	public ModelAndView saveAddress(HttpServletRequest req){
		ModelMap mode = new ModelMap();
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		mode.put("shop", shop);
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
		address.setStreet(street);
		address.setPhone(phone);
		address.setProvience(province);
		address.setCity(city);
		address.setDistrict(area);
		if (defaults!=null) {
			address.setTheDefault(true);
		}else {
			address.setTheDefault(false);
		}
		address.setUser(shop.getUser());
		addressService.save(address);
		List<Address> addresses = addressService.getAll();
		mode.put("addresses", addresses);
		
		return new ModelAndView("redirect:accountManage",mode);
	}
	//修改一条收货信息
	@RequestMapping("modAddress")
	public ModelAndView modAddress(HttpServletRequest req){
		ModelMap mode = new ModelMap();
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		mode.put("shop", shop);
		Integer aid = Integer.parseInt(req.getParameter("aid"));
		Address address = addressService.findById(aid);
		String toName = req.getParameter("toName");
		String toEmail = req.getParameter("toEmail");
		String street = req.getParameter("street");
		String phone = req.getParameter("phone");
		String province = req.getParameter("province");
		String city = req.getParameter("city");
		String area = req.getParameter("area");
		String defaults = req.getParameter("default");
		address.setToEmail(toEmail);
		address.setToName(toName);
		address.setStreet(street);
		address.setPhone(phone);
		address.setProvience(province);
		address.setCity(city);
		address.setDistrict(area);
		if (defaults!=null) {
			address.setTheDefault(true);
		}else {
			address.setTheDefault(false);
		}
		address.setUser(shop.getUser());
		addressService.save(address);
		List<Address> addresses = addressService.getAll();
		mode.put("addresses", addresses);
		return new ModelAndView("redirect:accountManage",mode);
	}
	//删除一条收货地址信息
	@RequestMapping("delAddress")
	public ModelAndView delAddress(HttpServletRequest req){
		ModelMap mode = new ModelMap();
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		mode.put("shop", shop);
		Integer aid = Integer.parseInt(req.getParameter("aid"));
		addressService.delete(aid);
		List<Address> addresses = addressService.getAll();
		mode.put("addresses", addresses);
		return new ModelAndView("redirect:accountManage",mode);
	}
	//1.填写个人开店个人信息
	@RequestMapping("setupPeronShop")
	public String setupPeronShop(@RequestParam MultipartFile [] myfile ,HttpServletRequest req , HttpServletResponse resp) throws IOException{
		System.out.println("已经加载到setupPersonShop！");
		String name = req.getParameter("name");
		String sex = req.getParameter("sex"); 
		String birthday = req.getParameter("birthday"); 
		String province = req.getParameter("province"); 
		String city = req.getParameter("city"); 
		String area = req.getParameter("area"); 
		String juridicalCard = req.getParameter("juridicalCard"); 
		String idCard = req.getParameter("idCard"); 
		Shop shop = new Shop();
		shop.setPrivatePerson(name);
		shop.setSex(sex);
		shop.setBirthday(birthday);
		shop.setAddress(province+" "+city +" "+area);
		shop.setJuridicalCard(juridicalCard);
		shop.setIdCard(idCard);
		shop.setShopType(ShopType.individual);
		String pathStr = "D:/tumbler/images/"+shop.getIdCard()+"/";
		File path = new File(pathStr).getCanonicalFile();
		shop.setIdCardUrl(path+"/shenfenzheng"+".jpg");
		shop.setTaxRegUrl(path+"/shuiwudengji"+".jpg");
		shop.setFoodCriLisUrl(path+"/shipinliutongxuke"+".jpg");
		shopService.save(shop);
		req.getSession().setAttribute("shop", shop);
		//判断file数组不能为空并且长度大于0  
        if(myfile!=null&&myfile.length>0){  
            //循环获取file数组中得文件  
            for(int i = 0;i<myfile.length;i++){  
                MultipartFile file = myfile[i];  
                //保存文件  
                saveFile(i,shop,req ,file);  
            }
        }
		
		return "success";
	}
	//保存文件：
	private boolean saveFile(int i ,Shop shop ,HttpServletRequest req, MultipartFile file) {  
		String endType = "";
        // 判断文件是否为空  
        if (!file.isEmpty()) {  
            try {
//                // 文件保存路径  
//                String filePath = req.getSession().getServletContext().getRealPath("/") + ""  
//                        + file.getOriginalFilename();
    			String name2 = file.getOriginalFilename();
    			// 得到要上传文件的后缀名
    			endType = name2.substring(name2.lastIndexOf("."),name2.length());
            	String pathStr = "D:/tumbler/images/"+shop.getIdCard()+"/";
            	File path = new File(pathStr).getCanonicalFile();
            	if (!path.exists() || path.isFile()) {
        			path.mkdir();
        		}
                // 转存文件  
                System.out.println("文件的保存路径："+path);
                
            	if (i == 0) {
					file.transferTo(new File(path,"shenfenzheng"+endType));
					System.out.println("存储数据库0:"+path+"shenfenzheng"+endType);
				}if (i == 1) {
					file.transferTo(new File(path,"shuiwudengji"+endType));
					System.out.println("存储数据库1:"+path+"shuiwudengji"+endType);
				}if (i == 2) {
					file.transferTo(new File(path,"shipinliutongxuke"+endType));
					System.out.println("存储数据库2:"+path+"shipinliutongxuke"+endType);
				}
                return true;
            } catch (Exception e) {  
                e.printStackTrace();  
            }
        }  
        return false;  
    }
	
	//2.填写企业开店信息
	@RequestMapping("setupCompanyShop")
	public String setupCompanyShop(@RequestParam MultipartFile [] myfile ,HttpServletRequest req , HttpServletResponse resp) throws IOException{
		System.out.println("已经加载到setupPersonShop！");
		String cname = req.getParameter("cname");
		String province = req.getParameter("province");
		String city = req.getParameter("city");
		String area = req.getParameter("area");
		String idCard = req.getParameter("idCard");
		Shop shop = new Shop();
		shop.setComName(cname);
		shop.setAddress(province+" "+city+" "+area);
		shop.setIdCard(idCard);
		String pathStr = "D:/tumbler/images/"+shop.getIdCard()+"/";
		File path = new File(pathStr).getCanonicalFile();
		shop.setIdCardUrl(path+"/shenfenzheng"+".jpg");
		shop.setBusinesslisUrl(path+"/yingyezhizhao"+".jpg");
		shop.setAuthorizeUrl(path+"/shouquanweituo"+".jpg");
		shop.setFoodCriLisUrl(path+"/shipinliutong"+".jpg");
		shop.setTaxRegUrl(path+"/shuiwudengji"+".jpg");
		shop.setProRunPermitCardUrl(path+"/shengchanjingyingxuke"+".jpg");
		shop.setQsIdentityUrl(path+"/guojiaQSrenzheng"+".jpg");
		shop.setAlcoholMultiPermitUrl(path+"/zizhiqujiuleipifa"+".jpg");
		shop.setAlcoholSellContractUrl(path+"/jiuleijingxiaohetong"+".jpg");
		shop.setSellAuthorizeUrl(path+"/jingxiaoshouquan"+".jpg");
		shop.setAlcoholRunPermitUrl(path+"/jiuleijingyingxuke"+".jpg");
		shop.setRetailRecordRegUrl(path+"/lingshoubeiandengji"+".jpg");
		shop.setShopType(ShopType.company);
		shopService.save(shop);
		req.getSession().setAttribute("shop", shop);
		if(myfile!=null&&myfile.length>0){  
            //循环获取file数组中得文件  
            for(int i = 0;i<myfile.length;i++){  
                MultipartFile file = myfile[i];  
                //保存文件  
                saveComFile(i,shop,req ,file);  
            }
        }
		return "success";
	}
	//保存商家文件：
	private boolean saveComFile(int i ,Shop shop ,HttpServletRequest req, MultipartFile file) {  
		String endType = "";
	    // 判断文件是否为空  
	    if (!file.isEmpty()) {  
	        try {
	//	                // 文件保存路径  
	//	                String filePath = req.getSession().getServletContext().getRealPath("/") + ""  
	//	                        + file.getOriginalFilename();
				String name2 = file.getOriginalFilename();
				// 得到要上传文件的后缀名
				endType = name2.substring(name2.lastIndexOf("."),name2.length());
	        	String pathStr = "D:/tumbler/images/"+shop.getIdCard()+"/";
	        	File path = new File(pathStr).getCanonicalFile();
	        	if (!path.exists() || path.isFile()) {
	    			path.mkdir();
	    		}
	            // 转存文件  
	            System.out.println("文件的保存路径："+path);
	            
	        	if (i == 0) {
					file.transferTo(new File(path,"shenfenzheng"+endType));
				}if (i == 1) {
					file.transferTo(new File(path,"yingyezhizhao"+endType));
				}if (i == 2) {
					file.transferTo(new File(path,"shouquanweituo"+endType));
				}if (i == 3) {
					file.transferTo(new File(path,"shipinliutongxuke"+endType));
				}if (i == 4) {
					file.transferTo(new File(path,"shuiwudengji"+endType));
				}if (i == 5) {
					file.transferTo(new File(path,"shengchanjingyingxuke"+endType));
				}if (i == 6) {
					file.transferTo(new File(path,"guojiaQSrenzheng"+endType));
				}if (i == 7) {
					file.transferTo(new File(path,"zizhiqujiuleipifa"+endType));
				}if (i == 8) {
					file.transferTo(new File(path,"jiuleijingxiaohetong"+endType));
				}if (i == 9) {
					file.transferTo(new File(path,"jingxiaoshouquan"+endType));
				}if (i == 10) {
					file.transferTo(new File(path,"jiuleijingyingxuke"+endType));
				}if (i == 11) {
					file.transferTo(new File(path,"lingshoubeiandengji"+endType));
				}
	            return true;
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }
	    }  
	    return false;  
	}
	//得到类型2：
	@RequestMapping(value = "getClass2", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getClass2(HttpServletRequest req){
		Integer num = Integer.parseInt(req.getParameter("num"));
		System.out.println("已经加载到。。。"+num);
		ModelMap mode = new ModelMap();
		List<ShopCategory> categories = shopCategService.getAllByParentLevel(num);
		mode.put("categories", categories);
		return mode;			
	}
//		//得到类别2：红葡萄酒。。
//		@RequestMapping("getClass2")
//		@ResponseBody
//		public void getClass2(HttpServletRequest req,HttpServletResponse resp) throws IOException{
//			String classses = req.getParameter("classes");
//			resp.setContentType("application/json;charset=UTF-8");
//			List<ShopCategory> shopCategories = shopCategService.getAllByParentLevel(Integer.parseInt(classses));
//			JSONArray json = JSONArray.fromObject(shopCategories);
//			resp.setCharacterEncoding("UTF-8");
//			System.out.println("商品种类共："+shopCategories.size()+"变成json格式为：：：：：：：：：：：：");
//			resp.getWriter().write(json.toString());
//		}
		
		
//	//6.上传税务登记：
//	@RequestMapping("uploadTaxRegCard")
//	public ModelAndView uploadTaxRegCard(@RequestParam MultipartFile fileField,HttpServletRequest req , HttpServletResponse resp) throws IOException{
//		System.out.println("已经加载到uploadTaxRegCard！");
//		//得到appuser之后再利用：
////		AppUser appuser = (AppUser)req.getSession().getAttribute("appuser");
////		String appuname = appuser.getUserName();
//		String endType = "";
//		// root是得到本项目在服务器的路径：“D:\tomcat\apache-tomcat-7.0.52\webapps\tumbler\”
////		String root = req.getSession().getServletContext().getRealPath("/");
//		String root = "D:/";
//		// getCanonicalFile()方法是返回路径名的规范形式。
//		File uploadDir = new File(root, "tumbler/images")
//				.getCanonicalFile();
//		if (!uploadDir.exists() || uploadDir.isFile()) {
//			uploadDir.mkdir();
//		}
//		// 如果选择了上传的文件
//		if (!fileField.isEmpty()) {
//			String name1 = fileField.getName();
//			String name2 = fileField.getOriginalFilename();
//			String type = fileField.getContentType();
//			long length = fileField.getSize();
//			// 得到要上传文件的后缀名
//			endType = name2.substring(name2.lastIndexOf("."),name2.length());	
//			System.out.println(name1);
//			System.out.println(name2);
//			System.out.println(type);
//			System.out.println(endType);
//			System.out.println("文件大小：" + length + " 字节");
//			// 处理小文件：
//			// myfile.transferTo(new File(uploadDir, name2));
//			// 处理大文件：
//			InputStream is = fileField.getInputStream();
//			//得到appuser之后再利用：appuname
//			FileOutputStream fos = new FileOutputStream(new File(uploadDir,
//					1 + endType));
//			byte[] b = new byte[1024];
//			int len = 0;
//			while ((len = is.read(b)) > 0) {
//				fos.write(b, 0, len);
//			}
//			resp.setContentType("text/html;charset=UTF-8");
//			resp.getWriter().write("上传成功~！");
//			fos.flush();
//			fos.close();
//			is.close();
//		}
//		return new ModelAndView();
//	}
	//填写开店信息：
	
	//得到所有商品类别表
	private ModelMap getShopCategory(ModelMap mode) {
		List<ShopCategory> list = shopCategService.getAll();
		mode.put("shopCategories", list);
		return mode;
	}

	// 购物Item
	@RequestMapping(value = "shopItem", method = RequestMethod.GET)
	public ModelAndView shopItem(Integer commID, Integer category, Integer shopID, String commoName, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		ShopCategory cate = shopCategService.findById(category);
		List<ShopReviews> reviewslist = shopReviewsService.getAllBycommCode(commID);
		mode.put("reviewslist", reviewslist);
		List<ShopCategory> shopcates = new ArrayList<ShopCategory>();
		shopcates.add(cate);
		mode.put("specifications", cate.getSpecifications());
		String strs = "";
		while (cate.getParentLevel() != null) {
			cate = shopCategService.findById(cate.getParentLevel().getCategoryID());
			if (cate != null) {
				shopcates.add(cate);
			}
		}
		for (int i = shopcates.size() - 1; i >= 0; i--) {
			strs = strs + shopcates.get(i).getCategoryID() + "-" + shopcates.get(i).getCategory() + "|";
		}
		List<ShopCategory> shopcategories = shopCategService.getAll();
		mode.put("shopCategories", shopcategories);
		mode.put("nvabar", strs.substring(0, strs.length() - 1));
		ShopCommodity shopCommoidty = shopCommService.findById(commID);
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		List<String> specStrs = null;
		mode.put("shopCommoidty", shopCommoidty);
		ShopCommoditySpecs shopSpecs = shopCommoidty.getCommsPecs();
		if (shopSpecs != null) {
			String spec = shopSpecs.getCommSpec();
			String[] specs = spec.split(",");
			if (specs.length > 0) {
				for (int i = 0; i < specs.length; i++) {
					if (!specs[i].equals("")) {
						if (map.containsKey(specs[i].split("-")[0])) {
							specStrs = map.get(specs[i].split("-")[0]);
							if (!specStrs.contains(specs[i].split("-")[1])) {
								specStrs.add(specs[i].split("-")[1]);
							}
						} else {
							specStrs = new ArrayList<String>();
							specStrs.add(specs[i].split("-")[1]);
							map.put(specs[i].split("-")[0], specStrs);
						}
					}
				}
			}
		}
		List<ShopCategory> list = shopCategService.getAllByParent();
		mode.put("categories", list);
		mode.put("map", map);
		AppUser user = (AppUser) request.getSession().getAttribute("loginUser");
		mode.put("user", user);
		return new ModelAndView("reception/shopItem", mode);
	}

}
