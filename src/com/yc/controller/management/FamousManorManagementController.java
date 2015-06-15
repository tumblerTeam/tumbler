package com.yc.controller.management;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.FamousManor;
import com.yc.entity.FamousManorAndShop;
import com.yc.entity.Shop;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommoidty;
import com.yc.service.IFamousManorAndShopService;
import com.yc.service.IFamousManorService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommoidtyService;
import com.yc.service.IShopService;

//名庄管理
@Controller
@RequestMapping("/management")
public class FamousManorManagementController {

	private static final Logger LOG = Logger.getLogger(FamousManorManagementController.class);

	@Autowired
	IFamousManorService famousManorService;

	@Autowired
	IShopService shopService;

	@Autowired
	IShopCommoidtyService shopCommoidtyService;

	@Autowired
	IShopCategoryService shopCategoryService;

	@Autowired
	IFamousManorAndShopService manorAndShopService;

	/**
	 * 名庄列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "famousManorList", method = RequestMethod.GET)
	public ModelAndView famousManorList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<FamousManor> list = famousManorService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/famousManorList", mode);
	}

	/**
	 * 跳转名庄添加页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "addManor", method = RequestMethod.GET)
	public ModelAndView addManor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("management/addManor");
	}

	/**
	 * 名庄添加 POST
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "addManor", method = RequestMethod.POST)
	public String addManorPost(@RequestParam("path") MultipartFile sendFile, String manorName, String describes, String isForbidden, String title,  HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = sendFile.getOriginalFilename();
		String pathDir = "content/static/img/manor/";
		String logoRealPathDir = request.getSession().getServletContext().getRealPath(pathDir);
		File file1 = new File(logoRealPathDir);
		if (!file1.exists())
			file1.mkdirs();
		File file = new File(logoRealPathDir, name);
		if (file.getParentFile() == null)
			file.mkdirs();
		sendFile.transferTo(file);
		FamousManor famousManor = new FamousManor();
		famousManor.setDescribes(describes.trim());
		famousManor.setManorName(manorName);
		famousManor.setIsForbidden(Boolean.valueOf(isForbidden));
		famousManor.setLogoPath(pathDir + name);
		famousManor.setTitle(title);
		famousManorService.save(famousManor);
		return "redirect:/management/famousManorList";
	}

	@RequestMapping(value = "updateManor", method = RequestMethod.GET)
	public ModelAndView updateManor(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FamousManor manor = famousManorService.findById(id);
		ModelMap model = new ModelMap();
		model.put("manor", manor);
		model.put("page", "update");
		return new ModelAndView("management/addManor", model);
	}

	@RequestMapping(value = "updateManor", method = RequestMethod.POST)
	public String updateManorPost(@RequestParam("path") MultipartFile sendFile, String isForbidden,String title, String manorName, String describes, Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FamousManor famousManor = famousManorService.findById(id);
		if (famousManor != null) {
			String name = sendFile.getOriginalFilename();
			String pathDir = "content/static/img/manor/";
			if (name != null && !name.equals("")) {
				String logoRealPathDir = request.getSession().getServletContext().getRealPath(pathDir);
				File file1 = new File(logoRealPathDir);
				if (!file1.exists())
					file1.mkdirs();
				File file = new File(logoRealPathDir, name);
				if (file.getParentFile() == null)
					file.mkdirs();
				sendFile.transferTo(file);
				famousManor.setLogoPath(pathDir + name);
			}
			famousManor.setDescribes(describes.trim());
			famousManor.setManorName(manorName);
			famousManor.setTitle(title);
			famousManor.setIsForbidden(Boolean.valueOf(isForbidden));
			famousManorService.update(famousManor);
		}
		return "redirect:/management/famousManorList";
	}

	@RequestMapping(value = "deleteManor", method = RequestMethod.GET)
	public String deleteManor(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		famousManorService.delete(id);
		return "redirect:/management/famousManorList";
	}

	/**
	 * 查询没有开通名庄接口的店铺，用作接口审核开通
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "manorJurisdiction", method = RequestMethod.GET)
	public ModelAndView manorJurisdiction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Shop> list = shopService.getShopForNotManor();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/manorJurisdiction", mode);
	}

	/**
	 * 店铺名庄接口开启
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "openManor", method = RequestMethod.GET)
	public String openManor(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Shop shop = shopService.findById(id);
		List<FamousManor> famousManors = famousManorService.getAll();
		ShopCategory cate = shopCategoryService.findById(1);
		for (int i = 0; i < famousManors.size(); i++) {
			FamousManor famousManor = famousManors.get(i);
			List<FamousManorAndShop> famAndShop = famousManor.getFamousManorAndShops();
			if (famAndShop == null) {
				famAndShop = new ArrayList<FamousManorAndShop>();
			}
			FamousManorAndShop fmas = new FamousManorAndShop();
			fmas.setShop(shop);
			fmas.setShopCategory(cate);
			fmas.setStartDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			fmas.setEndDate(-1+"");
			fmas.setFamousManor(famousManor);
			fmas = manorAndShopService.save(fmas);
		}
		return "redirect:/management/manorJurisdiction";
	}
	
	@RequestMapping(value = "jurisdictionMaintenance", method = RequestMethod.GET)
	public ModelAndView jurisdictionMaintenance( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<FamousManorAndShop> list = manorAndShopService.getAll();
		mode.put("list", list);
		return new ModelAndView("management/jurisdictionMaintenance", mode);
	}
	
	@RequestMapping(value = "closeManor", method = RequestMethod.GET)
	public String closeManor(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ID==="+id);
		Shop shop = shopService.findById(id);
		getNode(shop);
		return "redirect:/management/jurisdictionMaintenance";
	}
	private void getNode(Shop department) {
		List<FamousManorAndShop> depAndPos = department.getManorAndShops();
		System.out.println("depAndPos======="+depAndPos.size());
		if (depAndPos != null && depAndPos.size() > 0) {
			for (int i = 0; i < depAndPos.size(); i++) {
				FamousManorAndShop depAndPoss = depAndPos.get(i);
				System.out.println("depAndPoss====="+depAndPoss.getId());
				List<ShopCommoidty> shopCommoidties = depAndPoss.getShopCommoidties();
				if (shopCommoidties != null && shopCommoidties.size() > 0) {
					for (int k = 0; k < shopCommoidties.size(); k++) {
						ShopCommoidty shopCommoidty = shopCommoidties.get(k);
						shopCommoidty.setFamousManorAndShop(null);
						shopCommoidtyService.update(shopCommoidty);
					}
				}
				manorAndShopService.delete(depAndPoss.getId());
			}
		}
	}
	
	@RequestMapping(value = "getFamousManor", method = RequestMethod.GET)
	public ModelAndView getFamousManor(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FamousManor famousManor =  famousManorService.findById(id);
		ModelMap mode = new ModelMap();
		mode.put("famousManor", famousManor);
		return new ModelAndView("management/getFamousManor",mode);	
	}
}
