package com.yc.controller.proscenium;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.yc.entity.AdvState;
import com.yc.entity.Brand;
import com.yc.entity.Currency;
import com.yc.entity.FamousManor;
import com.yc.entity.MissionPlan;
import com.yc.entity.OrderForm;
import com.yc.entity.OrderStatus;
import com.yc.entity.ReviewsRank;
import com.yc.entity.Shop;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommImage;
import com.yc.entity.ShopCommodity;
import com.yc.entity.ShopCommodityAttribute;
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
import com.yc.service.IMissionPlanService;
import com.yc.service.IOrderFormService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommAttributeService;
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
	IShopCommAttributeService shopCommAttributeService; //商品属性
	
	@Autowired
	IMissionPlanService missionPlanService; //消息
	
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
	//开企业店
	@RequestMapping("missionPlan")
	public String missionPlan(){
		
		return "setupShop/missionPlan";
	}
	
	//发布商品主分类界面
	@RequestMapping("publishComm")
	public String publishComm(){
		return "setupShop/publishComm";
	}
	
	// 发布商品
	@RequestMapping("releaseCommoidty")
	public ModelAndView releaseCommoidty(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//AppUser user = (AppUser) request.getSession().getAttribute("appUser");
		ModelMap mode = new ModelMap();
		Integer cateOne = 1;
		if (request.getParameter("cateOne")!=null&&!request.getParameter("cateOne").equals("")) {
			cateOne = Integer.parseInt(request.getParameter("cateOne"));
		}
		//1.葡萄酒;2.白酒;3.啤酒;4,洋酒;5.小食品
		List<ShopCategory> list = shopCategService.getAllByParentLevel(cateOne);
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
		request.getSession().setAttribute("shop", shop);
		mode.put("currencylist", currencyList);
		return new ModelAndView("setupShop/releaseCommoidty", mode);
	}
	
	//保存商品+编辑商品
	@RequestMapping("saveCommodity")
	public String saveCommodity(@RequestParam MultipartFile [] myfile,ShopCommodityAttribute commAttribute ,HttpServletRequest req , HttpServletResponse resp) throws IOException{
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		
		//是否已经开店判断
		if (req.getSession().getAttribute("shop")!=null) {
			String commoidtyName = req.getParameter("commoidtyName");
			String commItem = req.getParameter("commItem");
			System.out.println("得到商品属性：：：：储藏方式："+commAttribute.getStockWay());
			//商品单位：
			String commUnit = req.getParameter("commUnit"); 
			Integer perBoxnum = 0;
			if (!req.getParameter("perBoxnum").equals("")) {
				perBoxnum = Integer.parseInt(req.getParameter("perBoxnum"));
			}
			/**
			 * 得到该商品的商品分类categoryID
			 * 下面对应表shopCommodity与表shopCategory关系
			 */
			Integer categoryid = Integer.parseInt(req.getParameter("categoryid"));
			System.out.println("得到商品种类是：：：："+categoryid);
			Integer stock = 0;
			float unitPrice = 0f;
			float probablyWeight = 0f;
			if (!req.getParameter("stock").equals("")) {
				stock = Integer.valueOf(req.getParameter("stock"));
			}if (!req.getParameter("unitPrice").equals("")) {
				unitPrice = Float.valueOf(req.getParameter("unitPrice"));
			}if (!req.getParameter("probablyWeight").equals("")) {
				probablyWeight = Float.valueOf(req.getParameter("probablyWeight"));
			}
			//是否上架
			Boolean shelves = Boolean.valueOf(req.getParameter("shelves").toString());
			//是否精品
			Boolean iscChoice = Boolean.valueOf(req.getParameter("iscChoice").toString());
			//是否团购
			Boolean auction = Boolean.valueOf(req.getParameter("auction").toString());
			//是否折扣
			Boolean isSpecial = Boolean.valueOf(req.getParameter("isSpecial").toString());
			//品牌名称
			String brandName = req.getParameter("brandName");
			//设置名庄
			Integer manorId = 0;	
			if (!req.getParameter("famousManorId").equals("")&&req.getParameter("famousManorId")!=null) {
				manorId = Integer.parseInt(req.getParameter("famousManorId"));
			}		
			//打几折
			float special = 10;
			System.out.println(req.getParameter("special")+":"+req.getParameter("special").equals(""));
			if (!req.getParameter("special").equals("")) {
				special = Float.valueOf(req.getParameter("special"));
			}
			ShopCommodity commodity = null;
			String edit = req.getParameter("edit");
			if (edit.equals("1")) { //如果是编辑商品
				Integer commId = Integer.parseInt(req.getParameter("commid"));
				commodity = shopCommodityService.findById(commId);
			}else { //如果是保存新商品
				commodity = new ShopCommodity();
			}
			//保存商品属性：
			shopCommAttributeService.save(commAttribute);
			
			//设置商品的属性：
			commodity.setCommAttribute(commAttribute);
			
			//设置规格属性：
			ShopCommoditySpecs commoditySpecs = null;
			//得到商品规格对象
			if (edit.equals("1")) { //如果是编辑商品
				commoditySpecs = commoidtySpecsService.findById(commodity.getCommsPecs().getId());
			}else { //如果是保存新商品
				commoditySpecs = new ShopCommoditySpecs();
			}
			String commSpec = "";
			for (int i = 0; i < shop.getShopCat().getSpecifications().size(); i++) {
				String commSpecName = "";
				int flag = i+1;
				commSpecName = req.getParameter("commspecName"+flag);
				System.out.println("得到规格是：：：：："+commSpecName);
				String commSpecValue = req.getParameter(commSpecName);
				System.out.println("得到规格值是：："+commSpecValue);
				commSpec =commSpec+commSpecName+"-"+commSpecValue +",";
				System.out.println("得到最终规格：：：："+commSpec);
			}
			//设置规格字段：
			commoditySpecs.setCommSpec(commSpec);
			//保存规格对象：
			if (edit.equals("1")) { //如果是编辑商品
				commoidtySpecsService.update(commoditySpecs);				
			}else { //如果是保存新商品
				commoidtySpecsService.save(commoditySpecs);
			}			
			commodity.setCommoidtyName(commoidtyName);
			commodity.setCommItem(commItem);
			commodity.setStock(stock);
			commodity.setUnitPrice(unitPrice);
			commodity.setCommUnit(commUnit);
			commodity.setPerBoxnum(perBoxnum);
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
			//设置名庄：
			FamousManor manor = famousManorService.findById(manorId);
			commodity.setFamousManor(manor);
			commodity.setCommsPecs(commoditySpecs);
			/**设置商品所属店面：setBelongTo
			 * commodity.setBelongTo(belongTo);
			 */
			//设置所属店面shop
			commodity.setBelongTo(shop);
			//保存商品，更新规格，规格关联商品
			if (edit.equals("1")) { //如果是编辑商品
				shopCommodityService.update(commodity);	
				/**
				 * 设置商品链接开始：proscenium/shopItem?commID=10&category=122&shopID=1&commoName=1111
				 */
				ShopCommodity comm = shopCommodityService.
						getAllByCommItemAndShop(commodity.getCommItem(), shop.getId());
				//得到商品ID commID
				Integer commID = comm.getCommCode();
				//得到类别ID category
				Integer category = comm.getShopCategory().getCategoryID();
				//得到店铺ID shopID
				Integer shopID = shop.getId();
				//得到商品名称 commoName
				String commoName = comm.getCommoidtyName();
				//设置商品链接：
				String link = "proscenium/shopItem?commID="+commID+"&category="+category+"&shopID="+shopID+"&commoName="+commoName;
				comm.setLink(link);
				//重新保存商品：为了更新商品链接link
				shopCommodityService.update(comm);
				/**
				 * 设置商品链接结束
				 */
				//更新商品规格
				commoditySpecs.setShopCommSpecs(commodity);
				commoidtySpecsService.update(commoditySpecs);
				//更新商品属性
				commAttribute.setShopCommodity(commodity);
				shopCommAttributeService.update(commAttribute);
			}else { //如果是保存新商品
				shopCommodityService.save(commodity);
				/**
				 * 设置商品链接开始：proscenium/shopItem?commID=10&category=122&shopID=1&commoName=1111
				 */
				ShopCommodity comm = shopCommodityService.
						getAllByCommItemAndShop(commodity.getCommItem(), shop.getId());
				//得到商品ID commID
				Integer commID = comm.getCommCode();
				//得到类别ID category
				Integer category = comm.getShopCategory().getCategoryID();
				//得到店铺ID shopID
				Integer shopID = shop.getId();
				//得到商品名称 commoName
				String commoName = comm.getCommoidtyName();
				//设置商品链接：
				String link = "proscenium/shopItem?commID="+commID+"&category="+category+"&shopID="+shopID+"&commoName="+commoName;
				comm.setLink(link);
				//重新保存商品：为了更新商品链接link
				shopCommodityService.update(comm);
				/**
				 * 设置商品链接结束
				 */
				//保存商品规格
				commoditySpecs.setShopCommSpecs(commodity);
				commoidtySpecsService.update(commoditySpecs);
				//保存商品属性
				commAttribute.setShopCommodity(commodity);
				shopCommAttributeService.save(commAttribute);
			}
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
	    			// root是得到本项目在服务器的路径：“D:\tomcat\apache-tomcat-7.0.52\webapps\tourGonglue\”
	    			String root = req.getSession().getServletContext().getRealPath("/");
	    			// getCanonicalFile()方法是返回路径名的规范形式。
	    			File uploadDir = new File(root, "goodsImg/")
	    					.getCanonicalFile();
	    			if (!uploadDir.exists() || uploadDir.isFile()) {
	    				uploadDir.mkdir();
	    			}
	    			
					commImage.setImagePath("goodsImg/"+fname+endType);
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
            	// root是得到本项目在服务器的路径：“D:\tomcat\apache-tomcat-7.0.52\webapps\tourGonglue\”
    			String root = req.getSession().getServletContext().getRealPath("/");
    			// getCanonicalFile()方法是返回路径名的规范形式。
    			File uploadDir = new File(root, "goodsImg/")
    					.getCanonicalFile();
    			if (!uploadDir.exists() || uploadDir.isFile()) {
    				uploadDir.mkdir();
    			}
    			
    			String name2 = file.getOriginalFilename();
    			// 得到要上传文件的后缀名
    			endType = name2.substring(name2.lastIndexOf("."),name2.length());
                // 转存文件  
                System.out.println("文件的保存路径："+uploadDir);
				file.transferTo(new File(uploadDir,fname+endType));
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
			//flag==1,表示显示上架的商品 
			mode.put("flag", "1");
		}else if (flag.equals("0")) {
			commodities = shopCommodityService.getAllByCondition("shelves", false, shop.getId());
			//flag==0,表示显示下架的商品 
			mode.put("flag", "0");
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
		//1.葡萄酒
		List<ShopCategory> list = shopCategService.getAllByParentLevel(commodity.getShopCategory().getParentLevel().getParentLevel().getCategoryID());
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
		//显示该商品的规格：
		
		//得到商品圖片列表信息：
		List<ShopCommImage> commImagesAll = shopCommImageService.getAll();
		List<ShopCommImage> commImages = new ArrayList<ShopCommImage>();
		for (int i = 0; i < commImagesAll.size(); i++) {
			if (commImagesAll.get(i).getShopCommoidty().getCommCode()==commid) {
				commImages.add(commImagesAll.get(i));
			}
		}
		mode.put("commImages", commImages);
		return new ModelAndView("setupShop/editCommoidty",mode);
	}
	
	//删除商品图片：
	@RequestMapping("delShopCommImage")
	@ResponseBody
	public ModelAndView delShopCommImage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		
		System.out.println("已经加载到。。。。delShopImage");
		Integer imgId = Integer.valueOf(req.getParameter("imgId"));
		shopCommImageService.delete(imgId);
		
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
		//得到商品圖片列表信息：
		List<ShopCommImage> commImagesAll = shopCommImageService.getAll();
		List<ShopCommImage> commImages = new ArrayList<ShopCommImage>();
		for (int i = 0; i < commImagesAll.size(); i++) {
			if (commImagesAll.get(i).getShopCommoidty().getCommCode()==commid) {
				commImages.add(commImagesAll.get(i));
			}
		}
		mode.put("commImages", commImages);
		
		return new ModelAndView("setupShop/editCommoidty",mode);
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
	public ModelAndView downComm(HttpServletRequest req , HttpServletResponse resp){
		Integer commId = Integer.parseInt(req.getParameter("commId"));
		ShopCommodity shopCommodity = shopCommodityService.findById(commId);
		shopCommodity.setShelves(false);
		shopCommodityService.update(shopCommodity);
		
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		
		ModelMap mode = new ModelMap();
		List<ShopCommodity> commodities = null;
		commodities = shopCommodityService.getAllByCondition("shelves", true, shop.getId());
		//flag==1,表示显示上架的商品 
		mode.put("flag", "1");
		mode.put("commodities", commodities);
		return new ModelAndView("setupShop/chushou",mode);
	}
	
	//商品上架
	@RequestMapping("upComm")
	public ModelAndView upComm(HttpServletRequest req , HttpServletResponse resp){
		Integer commId = Integer.parseInt(req.getParameter("commId"));
		ShopCommodity shopCommodity = shopCommodityService.findById(commId);
		shopCommodity.setShelves(true);
		shopCommodityService.update(shopCommodity);
		
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		
		ModelMap mode = new ModelMap();
		List<ShopCommodity> commodities = null;
		commodities = shopCommodityService.getAllByCondition("shelves", false, shop.getId());
		//flag==0,表示显示下架的商品 
		mode.put("flag", "0");
		mode.put("commodities", commodities);
		return new ModelAndView("setupShop/chushou",mode);
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
		map.put("ApplicationForRefund", "ApplicationForRefund");
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
		address.setUser(shop.getUser());
		addressService.save(address);
		List<Address> addresses = addressService.getAll();
		mode.put("addresses", addresses);
		
		return new ModelAndView("redirect:accountManage",mode);
	}
	
	//传递到修改收货信息页面
	@RequestMapping("modAddress")
	public ModelAndView modAddress(HttpServletRequest req){
		ModelMap mode = new ModelMap();
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		Integer aid = Integer.parseInt(req.getParameter("aid"));
		Address address = addressService.findById(aid);
		mode.put("shop", shop);
		mode.put("address", address);
		return new ModelAndView("setupShop/modAddress",mode);
	}
	
	//修改一条收货信息
	@RequestMapping("modAddressInfo")
	public ModelAndView modAddressInfo(HttpServletRequest req){
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
	
	//设为默认地址
	@RequestMapping("setDefaultAddress")
	public ModelAndView setDefaultAddress(HttpServletRequest req){
		ModelMap mode = new ModelMap();
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		mode.put("shop", shop);
		//消除默认地址
		List<Address> allAddress = addressService.getAll();
		for (int i = 0; i < allAddress.size(); i++) {
			if (allAddress.get(i).getTheDefault()) {
				allAddress.get(i).setTheDefault(false);
			}
		}
		Integer aid = Integer.parseInt(req.getParameter("aid"));
		Address address = addressService.findById(aid);
		address.setTheDefault(true);
		List<Address> addresses = addressService.getAll();
		mode.put("addresses", addresses);
		return new ModelAndView("redirect:accountManage",mode);
	}
	
	//商家评论用户：
	@RequestMapping("evaluteUser")
	public ModelAndView evaluteUser(HttpServletRequest req){
		System.out.println("阿迪萨斯大师大大四大四大大大说的是倒萨");
		ModelMap mode = new ModelMap();
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		mode.put("shop", shop);
		Integer userId = Integer.parseInt(req.getParameter("userId"));
		Integer orderFormID = Integer.parseInt(req.getParameter("orderFormID"));
		OrderForm orderForm = orderFormService.findById(orderFormID);
		System.out.println("进入商家评论：：："+orderForm!=null);
		if(orderForm != null){
			Integer commCode = Integer.parseInt(req.getParameter("commCode"));
			String reviewsRank = req.getParameter("reviewsRank");
			String businessreply = req.getParameter("businessreply");
			Date date = new Date();
			//时间格式化：
			SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd");
			String reviewsdate = time.format(date);
			ShopCommodity shopscommodity = shopCommodityService.findById(commCode);
			ShopReviews shopReviews = new ShopReviews();
			shopReviews.setBusinessreply(businessreply);
			if (!reviewsRank.equals("")&&reviewsRank!=null) {
				if (reviewsRank.equals("good")) {
					shopReviews.setReviewsRank(ReviewsRank.good);
					shopReviews.setRankImagesPath("goodurl");
				}if (reviewsRank.equals("better")) {
					shopReviews.setReviewsRank(ReviewsRank.better);
					shopReviews.setRankImagesPath("betterurl");
				}if (reviewsRank.equals("bad")) {
					shopReviews.setReviewsRank(ReviewsRank.bad);
					shopReviews.setRankImagesPath("badurl");
				}
			}			
			//设置用户
			AppUser user = userService.findById(userId);
			shopReviews.setUser(user);
			//设置orderFormID，标识评论与订单的关系
			shopReviews.setOrderForm(orderForm);
			shopReviews.setReviewsdate(reviewsdate);
			shopReviews.setShopscommodity(shopscommodity);
			System.out.println("得到评价的信息："+shopReviews.getReviews()+"::"+shopReviews.getReviewsRank());
			//保存评论
			shopReviewsService.save(shopReviews);
		}
		
//		//1.查询3个月之内的订单
//		List<OrderForm> order3Month = orderFormService.getShopOrderByShop(shop.getId());
//		mode.put("order3Month", order3Month);
//		System.out.println("三个月以内的订单数量："+order3Month.size()); 
//		//2.查询等待买家付款订单
//		List<OrderForm> waitPayment = orderFormService.getAllByOrderStatus("waitPayment");	
//		mode.put("waitPayment", waitPayment);
//		//3.查询等待卖家发货订单
//		List<OrderForm> waitDelivery = orderFormService.getAllByOrderStatus("waitDelivery");	
//		mode.put("waitDelivery", waitDelivery);
//		//4.查询已发货订单
//		List<OrderForm> transitGoods = orderFormService.getAllByOrderStatus("transitGoods");	
//		mode.put("transitGoods", transitGoods);
//		//5.查询退款中订单
//		List<OrderForm> refundOrderForm = orderFormService.getAllByOrderStatus("refundOrderForm");	
//		mode.put("refundOrderForm", refundOrderForm);
//		//6.查询退款成功订单
//		List<OrderForm> refundSuccess = orderFormService.getAllByOrderStatus("refundSuccess");	
//		mode.put("refundSuccess", refundSuccess);
//		//7.查询成功订单
//		List<OrderForm> completionTransaction = orderFormService.getAllByOrderStatus("completionTransaction");	
//		mode.put("completionTransaction", completionTransaction);
//		//8.查询关闭订单
//		List<OrderForm> closeTransaction = orderFormService.getAllByOrderStatus("closeTransaction");	
//		mode.put("closeTransaction", closeTransaction);
		
		return new ModelAndView("success",mode);
	}
	
	//messageCenter消息中心
	@RequestMapping("messageCenter")
	public ModelAndView messageCenter(HttpServletRequest req){
		ModelMap mode = new ModelMap();
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		mode.put("shop", shop);
		List<MissionPlan> missionPlans = missionPlanService.getAll();
		List<MissionPlan> usermp = new ArrayList<MissionPlan>();
		for (int i = 0; i < missionPlans.size(); i++) {
			if (missionPlans.get(i).getToUser()!=null) {
				if (missionPlans.get(i).getToUser().getId()==shop.getUser().getId()) {
					usermp.add(missionPlans.get(i));
				}
			}
		}
		mode.addAttribute("usermp", usermp);
		mode.addAttribute("Usize", usermp.size());
		return new ModelAndView("setupShop/messageCenter",mode);
	}
	
	//删除消息:删除消息对象与用户之间的关系
	@RequestMapping("delMessage")
	public ModelAndView delMessage(HttpServletRequest req){
		ModelMap mode = new ModelMap();
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		mode.put("shop", shop);
		
		Integer mid = Integer.parseInt(req.getParameter("mid"));
		MissionPlan mission = missionPlanService.findById(mid);
		mission.setToUser(null);
		missionPlanService.update(mission);
		
		List<MissionPlan> missionPlans = missionPlanService.getAll();
		List<MissionPlan> usermp = new ArrayList<MissionPlan>();
		for (int i = 0; i < missionPlans.size(); i++) {
			if (missionPlans.get(i).getToUser()!=null) {
				if (missionPlans.get(i).getToUser().getId()==shop.getUser().getId()) {
					usermp.add(missionPlans.get(i));
				}
			}
		}
		System.out.println("得到用户的消息个数：：："+usermp.size());
		mode.addAttribute("usermp", usermp);
		mode.addAttribute("Usize", usermp.size());
		return new ModelAndView("setupShop/messageCenter",mode);
	}
	
	//读取消息
	@RequestMapping("readMessage")
	public ModelAndView readMessage(HttpServletRequest req){
		ModelMap mode = new ModelMap();
		Integer mid = Integer.parseInt(req.getParameter("mid"));
		MissionPlan missionPlan = missionPlanService.findById(mid);
		missionPlan.setAdvState(AdvState.Read);		
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		mode.put("shop", shop);
		List<MissionPlan> missionPlans = missionPlanService.getAll();
		List<MissionPlan> usermp = new ArrayList<MissionPlan>();
		for (int i = 0; i < missionPlans.size(); i++) {
			if (missionPlans.get(i).getToUser()!=null) {
				if (missionPlans.get(i).getToUser().getId()==shop.getUser().getId()) {
					usermp.add(missionPlans.get(i));
				}
			}
		}
		System.out.println("得到用户的消息个数：：："+usermp.size());
		mode.addAttribute("usermp", usermp);
		mode.addAttribute("Usize", usermp.size());
		return new ModelAndView("setupShop/messageCenter",mode);
	}
	
	//查看我的店铺：
	@RequestMapping("myShop")
	public ModelAndView myShop(HttpServletRequest req){
		ModelMap mode = new ModelMap();
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		mode.put("shop", shop);
		//通过店铺Id得到所有商品：
		List<ShopCommodity> commodities = shopCommodityService.getAllByShop(shop.getId());
		Map<String, String> mapRed = new HashMap<String, String>();
		Map<String, String> mapWhite = new HashMap<String, String>();
		Map<String, String> mapPi = new HashMap<String, String>();
		Map<String, String> mapYang = new HashMap<String, String>();
		Map<String, String> mapFood = new HashMap<String, String>();
		
		List<ShopCommodity> redComms = new ArrayList<ShopCommodity>();
		List<ShopCommodity> whiteComms = new ArrayList<ShopCommodity>();
		List<ShopCommodity> piComms = new ArrayList<ShopCommodity>();
		List<ShopCommodity> yangComms = new ArrayList<ShopCommodity>();
		List<ShopCommodity> foodComms = new ArrayList<ShopCommodity>();
		//葡萄酒：
		for (int i = 0; i < commodities.size()&&commodities.get(i).getShopCategory().getParentLevel().getParentLevel().getCategory().equals("葡萄酒"); i++) {
			if (commodities.get(i).getShelves()) {
				//得到商品的类别的三级目录
				mapRed.put(commodities.get(i).getShopCategory().getCategory()+"", commodities.get(i).getShopCategory().getCategory());
				System.out.println("商品的类别是：3：：："+commodities.get(i).getShopCategory().getCategory());
				//得到商品的类别的一级目录
				System.out.println("商品的类别是：1：：："+commodities.get(i).getShopCategory().getParentLevel().getParentLevel().getCategory());
				redComms.add(commodities.get(i));
			}			
		}
		mode.put("redComms", redComms);
		mode.put("mapRed",mapRed);
		
		//白酒：
		for (int i = 0; i < commodities.size(); i++) {
			if (i < commodities.size()&&commodities.get(i).getShopCategory().getParentLevel().getParentLevel().getCategory().equals("白酒")) {
				if (commodities.get(i).getShelves()) {
					mapWhite.put(commodities.get(i).getShopCategory().getCategory()+"", commodities.get(i).getShopCategory().getCategory());
					whiteComms.add(commodities.get(i));
				}
			}
		}
		mode.put("whiteComms", whiteComms);
		mode.put("mapWhite",mapWhite);
		
		//啤酒：
		for (int i = 0; i < commodities.size(); i++) {
			if (i < commodities.size()&&commodities.get(i).getShopCategory().getParentLevel().getParentLevel().getCategory().equals("啤酒")) {
				if (commodities.get(i).getShelves()) {
					mapPi.put(commodities.get(i).getShopCategory().getCategory()+"", commodities.get(i).getShopCategory().getCategory());
					piComms.add(commodities.get(i));
				}
			}
		}
		mode.put("piComms", piComms);
		mode.put("mapPi",mapPi);
		
		//洋酒：
		for (int i = 0; i < commodities.size(); i++) {
			if (i < commodities.size()&&commodities.get(i).getShopCategory().getParentLevel().getParentLevel().getCategory().equals("洋酒")) {
				if (commodities.get(i).getShelves()) {
					mapYang.put(commodities.get(i).getShopCategory().getCategory()+"", commodities.get(i).getShopCategory().getCategory());
					yangComms.add(commodities.get(i));
				}
			}
		}
		mode.put("yangComms", yangComms);
		mode.put("mapYang",mapYang);
		
		//小食品：
		for (int i = 0; i < commodities.size(); i++) {
			if (i < commodities.size()&&commodities.get(i).getShopCategory().getParentLevel().getParentLevel().getCategory().equals("小食品")) {
				if (commodities.get(i).getShelves()) {
					mapFood.put(commodities.get(i).getShopCategory().getCategory()+"", commodities.get(i).getShopCategory().getCategory());
					foodComms.add(commodities.get(i));
				}
			}
		}
		mode.put("foodComms", foodComms);
		mode.put("mapFood",mapFood);
		mode.put("shopId", shop.getId());
		return new ModelAndView("setupShop/myShop",mode);
	}
	//店铺中的搜索：搜索本店中的商品
	@RequestMapping("searchTheShopComm")
	public ModelAndView searchTheShopComm(HttpServletRequest req){
		ModelMap mode = new ModelMap();
		/**
		 * 以下两句为模拟shop，表示已经存在shop对象。
		 */
		Shop shop = shopService.findById(1);
		req.getSession().setAttribute("shop", shop);
		mode.put("shop", shop);
		String keyValue = req.getParameter("serach1");
		//得到商家ID：
		Integer shopId = Integer.parseInt(req.getParameter("shopId"));
		List<ShopCommodity> commodities = shopCommodityService.getAllByNameAndShop(keyValue,shopId);
		mode.put("commodities", commodities);
		return new ModelAndView("setupShop/myShop",mode);
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
		String foodCriLis = req.getParameter("foodCriLis"); 
		String taxReg = req.getParameter("taxReg"); 
		Shop shop = new Shop();
		shop.setPrivatePerson(name);
		shop.setSex(sex);
		shop.setBirthday(birthday);
		shop.setAddress(province+" "+city +" "+area);
		shop.setJuridicalCard(juridicalCard);
		shop.setIdCard(idCard);
		shop.setShopType(ShopType.individual);
		shop.setFoodCriLis(foodCriLis);
		shop.setTaxReg(taxReg);
		//显示待审核：
		shop.setIsPermit(false);
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
