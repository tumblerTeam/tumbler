package com.yc.controller.management;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import com.yc.entity.Brand;
import com.yc.entity.ShopCategory;
import com.yc.entity.ShopCommoidty;
import com.yc.entity.Specifications;
import com.yc.service.IBrandService;
import com.yc.service.IShopCategoryService;
import com.yc.service.IShopCommoidtyService;
import com.yc.service.ISpecificationsService;

//类别管理
@Controller
@RequestMapping("/management")
public class CategoryManagementController {

	private static final Logger LOG = Logger.getLogger(CategoryManagementController.class);
	
	@Autowired
	IShopCategoryService categoryService;
	
	@Autowired
	IBrandService brandService;
	
	@Autowired
	ISpecificationsService specificationsService;
	
	@Autowired
	IShopCommoidtyService shopCommoidtyService;
	
	/**
	 * 查询类别
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "sortList", method = RequestMethod.GET)
	public ModelAndView sortList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ShopCategory> list = categoryService.getAllByParent();
		ModelMap mode = new ModelMap();
		mode.put("treeList1", list);
		return new ModelAndView("management/sortList", mode);
	}
	/**
	 * 添加类别
	 * @param page
	 * @param departmentID 类别ID
	 * @param departmentname 类别名称
	 * @param describes 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "addOrUpdateDep", method = RequestMethod.POST)
	public String addOrUpdateDep(String page, Integer departmentID, String departmentname, String describes, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory department = categoryService.findById(departmentID);
		addDepartment(department, departmentname);
		return "redirect:/management/getAgriculturalsSort?id=" + departmentID+"&page=sortList";
	}
	
	private ShopCategory addDepartment(ShopCategory parentDepartment, String departmentname) {
		ShopCategory department = new ShopCategory();
		department.setParentLevel(parentDepartment);
		department.setCategory(departmentname);
		department = categoryService.save(department);
		if (parentDepartment != null) {
			parentDepartment.getChildren().add(department);
			categoryService.update(parentDepartment);
		}
		return department;
	}
	/**
	 * 通过类别ID查询类别
	 * @param id 类别ID
	 * @param page sortList or orther
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "getAgriculturalsSort", method = RequestMethod.GET)
	public ModelAndView getAgriculturalsSort(Integer id, String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory department = categoryService.findById(id);
		List<ShopCategory> list = categoryService.getAllByParent();
		ModelMap mode = new ModelMap();
		mode.put("shopCategory", department);
		mode.put("treeList1", list);
		if (page.equals("sortList")) {
			return new ModelAndView("management/sortList", mode);
		} else {
			return new ModelAndView("management/addProducts", mode);
		}
	}
	/**
	 * 更新类别
	 * @param departmentId 类别ID
	 * @param departmentname 类别名称
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "updateDepartmen", method = RequestMethod.POST)
	public String updateDepartmen(Integer departmentId, String departmentname,  HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory department = categoryService.findById(departmentId);
		ShopCategory depart = null;
		if (department != null) {
			depart = updateDepartment(department, departmentname);
		}
		return "redirect:/management/getAgriculturalsSort?id=" + depart.getCategoryID()+"&page=sortList";
	}
	
	private ShopCategory updateDepartment(ShopCategory department, String departmentname) {
		department.setCategory(departmentname);
		department = categoryService.update(department);
		return department;
	}
	/**
	 * 类别禁用
	 * @param departmentId
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "deleteDepartmen", method = RequestMethod.POST)
	public String deleteDepartmen(Integer departmentId, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory department = categoryService.findById(departmentId);
		getNode(department);
		return "redirect:/management/getAgriculturalsSort?id=" + department.getCategoryID()+"&page=sortList";
	}
	
	private void getNode(ShopCategory department) {
		List<ShopCategory> list = department.getChildren();
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				ShopCategory dep = list.get(i);
				if (dep.getChildren() != null && dep.getChildren().size() > 0) {
					getNode(dep);
				}
				dep.setIsForbidden(!dep.getIsForbidden());
				categoryService.update(dep);
			}
		}
		department.setIsForbidden(!department.getIsForbidden());
		categoryService.update(department);
	}
	/**
	 * 品牌展示
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "brandList", method = RequestMethod.GET)
	public ModelAndView brandList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Brand> list = brandService.getAll();
		List<ShopCategory> categories = categoryService.getAllByParent();
		ModelMap mode = new ModelMap();
		mode.put("categories", categories);
		mode.put("list", list);
		return new ModelAndView("management/brandList",mode);
	}
	/**
	 * 通过类别ID，查询类别，
	 * @param cateID
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "getCateByCateID", method = RequestMethod.GET)
	public ModelAndView getCateByCateID(Integer cateID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory cate = categoryService.findById(cateID);
		List<ShopCategory> categories = categoryService.getAllByParent();
		ModelMap mode = new ModelMap();
		mode.put("categories", categories);
		mode.put("shopCategory", cate);
		return new ModelAndView("management/brandList",mode);
	}
	/**
	 * 根据类别ID，品牌ID查询品牌和类别，用于展示品牌和类别
	 * @param cateID 类别ID
	 * @param brandID 品牌ID
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "getBrandByCateID", method = RequestMethod.GET)
	public ModelAndView getBrandByCateID(Integer cateID,Integer brandID,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Brand brand = brandService.findById(brandID);
		ShopCategory cate = categoryService.findById(cateID);
		List<ShopCategory> categories = categoryService.getAllByParent();
		ModelMap mode = new ModelMap();
		mode.put("categories", categories);
		mode.put("brand", brand);
		mode.put("shopCategory", cate);
		return new ModelAndView("management/brandList",mode);
	}
	/**
	 * 添加品牌 POST
	 * @param sendFile 上传文件
	 * @param categoryID 类别ID
	 * @param brandName 品牌名称
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "addBrand", method = RequestMethod.POST)
	public String addBrand(@RequestParam("sendFile") MultipartFile sendFile,Integer categoryID,String brandName,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory cate = categoryService.findById(categoryID);
		if (cate != null) {
			String name = sendFile.getOriginalFilename();
			String pathDir = "content/static/img/brand/";
			if (!name.equals("")) {
				String logoRealPathDir = request.getSession().getServletContext().getRealPath(pathDir);
				File file1 = new File(logoRealPathDir);
				if (!file1.exists())
					file1.mkdirs();
				File file = new File(logoRealPathDir, name);
				if (file.getParentFile() == null)
					file.mkdirs();
				sendFile.transferTo(file);
			}
			Brand brand = brandService.getBrandName(brandName);
			if (brand !=null ) {
				brand.setBrandName(brandName);
				if (!name.equals("")) {
					brand.setLogo(pathDir+name);
				}
			}else{
				brand = new Brand();
				brand.setBrandName(brandName);
				if (!name.equals("")) {
					brand.setLogo(pathDir+name);
				}
				brand = brandService.save(brand);
			}
			List<ShopCategory> shopCateges = brand.getShopCateges();
			if (shopCateges == null || shopCateges.size()==0) {
				shopCateges = new ArrayList<ShopCategory>();
			}
			if (!shopCateges.contains(cate)) {
				shopCateges.add(cate);
				brand.setShopCateges(shopCateges);
			}
			if (!cate.getBrands().contains(brand)) {
				cate.getBrands().add(brand);
			}
			brandService.update(brand);
			categoryService.update(cate);
		}
		return "redirect:/management/getCateByCateID?cateID="+categoryID;
	}
	/**
	 * 更新品牌
	 * @param sendFile 上传的文件
	 * @param categoryID 类别ID
	 * @param brandID 品牌ID
	 * @param brandName 品牌名称
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "updateBrand", method = RequestMethod.POST)
	public String updateBrand(@RequestParam("sendFile") MultipartFile sendFile,Integer categoryID,Integer brandID, String brandName,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (brandID !=null && !brandID.equals("")) {
			String name = sendFile.getOriginalFilename();
			String pathDir = "content/static/img/brand/";
			if (!name.equals("")) {
				String logoRealPathDir = request.getSession().getServletContext().getRealPath(pathDir);
				File file1 = new File(logoRealPathDir);
				if (!file1.exists())
					file1.mkdirs();
				File file = new File(logoRealPathDir, name);
				if (file.getParentFile() == null)
					file.mkdirs();
				sendFile.transferTo(file);
			}
			Brand brand = brandService.findById(brandID);
			if (brand != null ) {
				brand.setBrandName(brandName);
				if (!name.equals("")) {
					brand.setLogo(pathDir+name);
				}
				brand = brandService.update(brand);
			}
			ShopCategory cate = categoryService.findById(categoryID);
			if (cate != null ) {
				List<Brand> brands = cate.getBrands();
				for (int i = 0; i < brands.size(); i++) {
					Brand brandOld = brands.get(i);
					if (brandOld.getBrandID() == brand.getBrandID()) {
						brandOld.setBrandName(brand.getBrandName());
					}
				}
				cate.setBrands(brands);
			}
		}
		return "redirect:/management/getBrandByCateID?cateID="+categoryID+"&brandID="+brandID;
	}
	/**
	 * 删除类别下的品牌，并删除品牌与商品的关联关系
	 * @param categoryID 类别ID
	 * @param brandID 品牌ID
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "deleteBrand", method = RequestMethod.GET)
	public String deleteBrand(Integer categoryID,Integer brandID,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory cate = categoryService.findById(categoryID);
		Brand brand = brandService.findById(brandID);
		if (brand != null) {
			List<ShopCommoidty> list = brand.getShopCommoidties();
			if (list.size()>0) {
				for (int i = 0; i < list.size(); i++) {
					ShopCommoidty shopComm = list.get(i);
					shopComm.setBrand(null);
					shopCommoidtyService.update(shopComm);
				}
			}
			List<ShopCategory> cates = brand.getShopCateges();
			if (cates.size()>0) {
				for (int i = 0; i < cates.size(); i++) {
					if (cates.get(i).getCategoryID()==cate.getCategoryID()) {
						cates.remove(cates.get(i));
					}
				}
			}
			brandService.update(brand);
			List<Brand> brands = cate.getBrands();
			for (int i = 0; i < brands.size(); i++) {
				System.out.println("brands.get(i).getBrandID() == brand.getBrandID()============="+(brands.get(i).getBrandID() == brand.getBrandID()));
				if (brands.get(i).getBrandID() == brand.getBrandID()) {
					brands.remove(brands.get(i)); 
				}
			}
			categoryService.update(cate);
			if (brand.getShopCateges().size() == 0) {
				brandService.delete(brandID);
			}
		}
		return "redirect:/management/getBrandByCateID?cateID="+categoryID+"&brandID="+brandID;
	}
	/**
	 * 规格展示
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "specManage", method = RequestMethod.GET)
	public ModelAndView specManage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<Specifications> list = specificationsService.getAll();
		mode.put("list", list);
		return new ModelAndView("management/specManage",mode);
	}
	/**
	 * 规格添加GET
	 * @param page add
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "addSpec", method = RequestMethod.GET)
	public ModelAndView addSpec(String page,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		mode.put("page", page);
		return new ModelAndView("management/addSpec",mode);
	}
	/**
	 * 规格添加 POST
	 * @param spec 规格属性
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "specAdd", method = RequestMethod.POST)
	public String specAdd(Specifications spec, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		spec.setAttribute(spec.getAttribute().replace("，", ","));
		specificationsService.save(spec);
		return "redirect:/management/specManage";
	}
	/**
	 * 通过规格ID查找规格,为规格更新做准备
	 * @param page update
	 * @param id 规格ID
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "updateSpec", method = RequestMethod.GET)
	public ModelAndView updateSpec(String page,Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		mode.put("page", page);
		Specifications spec = specificationsService.findById(id);
		mode.put("spec", spec);
		return new ModelAndView("management/addSpec",mode);
	}
	/**
	 * 更行规格属性,整体更新
	 * @param spec
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "updateSpec", method = RequestMethod.POST)
	public String updateSpecs(Specifications spec, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Specifications specs = specificationsService.findById(spec.getId());
		if (specs != null) {
			specs.setAttribute(spec.getAttribute().replace("，", ","));
			specs.setSpecificatName(spec.getSpecificatName());
			specificationsService.update(specs);
		}
		return "redirect:/management/specManage";
	}
	/**
	 * 展示所有类别属性和规格，为规格分配准备
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "specDivide", method = RequestMethod.GET)
	public ModelAndView specDivide(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Specifications> list = specificationsService.getAll();
		List<ShopCategory> categories = categoryService.getAllByParent();
		ModelMap mode = new ModelMap();
		mode.put("categories", categories);
		mode.put("list", list);
		return new ModelAndView("management/specDivide",mode);
	}
	/**
	 * 通过类别ID查找类别，进行规格分配
	 * @param cateID
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "getCateByID", method = RequestMethod.GET)
	public ModelAndView getCateByID(Integer cateID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory cate = categoryService.findById(cateID);
		List<ShopCategory> categories = categoryService.getAllByParent();
		List<Specifications> list = specificationsService.getAll();
		List<Specifications> cateSpec = cate.getSpecifications();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		mode.put("cateSpec", cateSpec);
		mode.put("categories", categories);
		mode.put("shopCategory", cate);
		return new ModelAndView("management/specDivide",mode);
	}
	
	/**
	 * 规格属性与分类绑定
	 * @param categoryID
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value = "divideSpec", method = RequestMethod.POST)
	public String divideSpec(Integer categoryID, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShopCategory cate = categoryService.findById(categoryID);
		List<Specifications> cateSpec = cate.getSpecifications();
		String[] specs = request.getParameterValues("specs");
		if (cateSpec == null || cateSpec.size() == 0) {
			notCateAdd(cate, specs);
		}else{
			List<Specifications> specss = specificationsService.getAll();
			if(specs != null && specs.length >0){
				haveCateOrther(cate, cateSpec, specs, specss);
			}else{
				haveCateDel(cate, specss);
			}
		}
		return "redirect:/management/getCateByID?cateID="+categoryID;
	}
	
	/**
	 * 删除有属性类别
	 * @param cate
	 * @param specss
	 */
	private void haveCateDel(ShopCategory cate, List<Specifications> specss) {
		for (int i = 0; i < specss.size(); i++) {
			Specifications spe = specss.get(i);
			List<ShopCategory> cates = spe.getShopCategories();
			for (int j = 0; j < cates.size(); j++) {
				if(cates.get(j).getCategoryID() == cate.getCategoryID()){
					cates.remove(cates.get(j));
				}
			}
			specificationsService.update(spe);
		}
		cate.setSpecifications(null);
		cate = categoryService.update(cate);
	}

	/**
	 * 分配规格
	 * @param cate
	 * @param cateSpec
	 * @param specs
	 * @param specss
	 * @param lengths 
	 */
	private void haveCateOrther(ShopCategory cate, List<Specifications> cateSpec, String[] specs, List<Specifications> specss) {
		List<Specifications> cateSpec2 = new ArrayList<Specifications>();
		for ( int m = 0; m<cateSpec.size(); m++){
			   cateSpec2.add(cateSpec.get(m));
		}
		for (int i = 0; i < cateSpec2.size(); i++) {
			boolean isok = true;
			for (int j = 0; j < specs.length; j++) {
				Specifications spec = specificationsService.findById(Integer.parseInt(specs[j]));
				if (spec != null) {
					if(cateSpec2.get(i).getId() == spec.getId()){
						isok = false;
					}
				}
			}
			if (isok) {
				for (int j = 0; j < specss.size(); j++) {
					if(specss.get(j).getId() == cateSpec2.get(i).getId()){
						Specifications spe = specss.get(j);
						List<ShopCategory> specate = spe.getShopCategories();
						for (int k = 0; k < specate.size(); k++) {
							if(specate.get(k).getCategoryID() == cate.getCategoryID()){
								specate.remove(specate.get(k));
							}
						}  
						specificationsService.update(spe);
					}
				}
				cate.getSpecifications().remove(cateSpec2.get(i)); 
				cate = categoryService.update(cate);
			}
		}
		for (int j = 0; j < specs.length; j++) {
			Specifications spec = specificationsService.findById(Integer.parseInt(specs[j]));
			if (spec != null) {
				boolean isok = true;
				for (int i = 0; i < cateSpec.size(); i++) {
					if(spec.getId() == cateSpec.get(i).getId()){
						isok = false;
					}
				}
				if (isok) {
					List<ShopCategory> catespe = spec.getShopCategories();
					if (catespe !=null && catespe.size()>0) {
						catespe.add(cate);
					}else{
						catespe = new ArrayList<ShopCategory>();
						catespe.add(cate);
						spec.setShopCategories(catespe);
					}
					specificationsService.update(spec);
					cate.getSpecifications().add(spec);
					categoryService.update(cate);
				}
			}
		}
	}

	/**
	 * 类别属性没有规格，新添加
	 * @param cate
	 * @param specs
	 */
	private void notCateAdd(ShopCategory cate, String[] specs) {
		List<Specifications> specList;
		List<ShopCategory> cateList;
		if (specs != null && specs.length >0) {
			specList = new ArrayList<Specifications>();
			for (int i = 0; i < specs.length; i++) {
				 Specifications spec = specificationsService.findById(Integer.parseInt(specs[i]));
				 if (spec.getShopCategories().size()>0) {
					 cateList = spec.getShopCategories();
				 }else{
					 cateList = new ArrayList<ShopCategory>();
				 }
				 cateList.add(cate);
				 spec.setShopCategories(cateList);
				 spec = specificationsService.update(spec);
				 specList.add(spec); 
			}
			cate.setSpecifications(specList);
			cate = categoryService.update(cate);
		}
	}
	
}
