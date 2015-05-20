package com.yc.controller.management;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.yc.entity.AgriculturalsSort;
import com.yc.entity.Language;
import com.yc.entity.News;
import com.yc.entity.Products;
import com.yc.entity.user.User;
import com.yc.service.IAgriculturalsSortService;
import com.yc.service.INewsService;
import com.yc.service.IProductsService;
import com.yc.service.IUserService;

@Controller
@RequestMapping("/management")
public class ManagementController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(ManagementController.class);

	@Autowired
	IUserService userService;

	@Autowired
	IAgriculturalsSortService sortService;

	@Autowired
	IProductsService productsService;
	
	@Autowired
	INewsService newsService;

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("management/index", null);
	}

	@RequestMapping(value = "userList", method = RequestMethod.GET)
	public ModelAndView userList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> list = userService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/userList", mode);
	}

	@RequestMapping(value = "updateUser", method = RequestMethod.GET)
	public ModelAndView updateUser(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = userService.findById(id);
		ModelMap mode = new ModelMap();
		mode.put("user", user);
		return new ModelAndView("management/updateUser", mode);
	}

	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
	public String updateUsers(String loginName, String password, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = userService.getUser(loginName);
		if (user != null) {
			user.setPassword(password);
			userService.update(user);
		}
		return "redirect:/management/userList";
	}

	@RequestMapping(value = "deleteUser", method = RequestMethod.GET)
	public String deleteUser(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userService.delete(id);
		return "redirect:/management/userList";
	}

	@RequestMapping(value = "sortList", method = RequestMethod.GET)
	public ModelAndView sortList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<AgriculturalsSort> list = sortService.getSortByParent();
		ModelMap mode = new ModelMap();
		mode.put("treeList1", list);
		return new ModelAndView("management/sortList", mode);
	}

	@RequestMapping(value = "addOrUpdateDep", method = RequestMethod.POST)
	public String addOrUpdateDep(@RequestParam("sendFile") MultipartFile sendFile,String languages, String page, Integer departmentID, String departmentname, String describes, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AgriculturalsSort department = sortService.findById(departmentID);
		AgriculturalsSort depart = null;
		String name = sendFile.getOriginalFilename();
		String pathDir = "/content/static/img/sort/";
		String logoRealPathDir = request.getSession().getServletContext().getRealPath(pathDir);
		File file1 = new File(logoRealPathDir);
		if (!file1.exists())
			file1.mkdirs();
		File file = new File(logoRealPathDir, name);
		if (file.getParentFile() == null)
			file.mkdirs();
		sendFile.transferTo(file);
		System.out.println("language====="+languages);
		depart = addDepartment(department, departmentname, languages, pathDir + name);
		return "redirect:/management/getAgriculturalsSort?id=" + depart.getId()+"&page=sortList";
	}

	private AgriculturalsSort addDepartment(AgriculturalsSort parentDepartment, String departmentname,String languages,String describes) {
		AgriculturalsSort department = new AgriculturalsSort();
		department.setParentLevel(parentDepartment);
		department.setDepartmentname(departmentname);
		department.setDescribes(describes);
		department.setLanguage(Language.valueOf(languages));
		department = sortService.save(department);
		if (parentDepartment != null) {
			parentDepartment.getChildren().add(department);
			sortService.update(parentDepartment);
		}
		return department;
	}

	@RequestMapping(value = "getAgriculturalsSort", method = RequestMethod.GET)
	public ModelAndView getAgriculturalsSort(Integer id, String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AgriculturalsSort department = sortService.findById(id);
		List<AgriculturalsSort> list = sortService.getSortByParent();
		ModelMap mode = new ModelMap();
		mode.put("department", department);
		mode.put("treeList1", list);
		if (page.equals("sortList")) {
			return new ModelAndView("management/sortList", mode);
		} else {
			return new ModelAndView("management/addProducts", mode);
		}
	}

	@RequestMapping(value = "updateDepartmen", method = RequestMethod.POST)
	public String updateDepartmen(@RequestParam("sendFile") MultipartFile sendFile,String languages, Integer departmentId, String departmentname, String describes, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AgriculturalsSort department = sortService.findById(departmentId);
		AgriculturalsSort depart = null;
		if (department != null) {
			String name = sendFile.getOriginalFilename();
			String pathDir = "/content/static/img/sort/";
			if (!name.equals("") && !pathDir.equals(department.getDescribes())) {
				String logoRealPathDir = request.getSession().getServletContext().getRealPath(pathDir);
				File file1 = new File(logoRealPathDir);
				if (!file1.exists())
					file1.mkdirs();
				File file = new File(logoRealPathDir, name);
				if (file.getParentFile() == null)
					file.mkdirs();
				sendFile.transferTo(file);
				depart = updateDepartment(department, departmentname, pathDir + name,languages);
			} else {
				depart = updateDepartment(department, departmentname, department.getDescribes(),languages);
			}
		}
		return "redirect:/management/getAgriculturalsSort?id=" + depart.getId()+"&page=sortList";
	}

	private AgriculturalsSort updateDepartment(AgriculturalsSort department, String departmentname, String describes,String languages) {
		department.setDepartmentname(departmentname);
		department.setDescribes(describes);
		department.setLanguage(Language.valueOf(languages));
		department = sortService.update(department);
		return department;
	}

	@RequestMapping(value = "deleteDepartmen", method = RequestMethod.POST)
	public String deleteDepartmen(Integer departmentId, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AgriculturalsSort department = sortService.findById(departmentId);
		getNode(department);
		return "redirect:/management/sortList";
	}

	private void getNode(AgriculturalsSort department) {
		Set<AgriculturalsSort> list = department.getChildren();
		if (list != null && list.size() > 0) {
			Iterator<AgriculturalsSort> iter = list.iterator();
			while (iter.hasNext()) {
				AgriculturalsSort dep = iter.next();
				if (dep.getChildren() != null && dep.getChildren().size() > 0) {
					getNode(dep);
				}
				Set<Products> depAndPos = dep.getProducts();
				if (depAndPos != null && depAndPos.size() > 0) {
					Iterator<Products> iterator = depAndPos.iterator();
					while (iterator.hasNext()) {
						Products depAndPoss = iterator.next();
						productsService.delete(depAndPoss.getId());
					}
				}
				sortService.deleteSort(dep);
			}
		}
		sortService.deleteSort(department);
	}

	@RequestMapping(value = "productslist", method = RequestMethod.GET)
	public ModelAndView productslist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<Products> list = productsService.getAll();
		mode.put("list", list);
		return new ModelAndView("management/productslist", mode);
	}

	@RequestMapping(value = "addProducts", method = RequestMethod.GET)
	public ModelAndView addProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<AgriculturalsSort> tree1 = sortService.getSortByParent();
		mode.put("treeList1", tree1);
		return new ModelAndView("management/addProducts", mode);
	}

	@RequestMapping(value = "addProducts", method = RequestMethod.POST)
	public ModelAndView addProduct(String language, Integer productsID,Integer departmentID, String productsName, String describes, String effect, String benefits, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		AgriculturalsSort sort = sortService.findById(departmentID);
		List<AgriculturalsSort> list = sortService.getSortByParent();
		ModelMap mode = new ModelMap();
		mode.put("department", sort);
		mode.put("treeList1", list);
		if (sort != null) {
			Products products = productsService.findById(productsID);
			if (multipartResolver.isMultipart(request)) {
				String productsPhoto = "/content/static/img/productsPhoto/"+departmentID+"/";
				String brand = "/content/static/img/brand/"+departmentID+"/";
				List<String> recommends = new ArrayList<String>();
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
				// 取得request中的所有文件名
				Iterator<String> iter = multiRequest.getFileNames();
				while (iter.hasNext()) {
					// 取得上传文件
					MultipartFile file = multiRequest.getFile(iter.next());
					if (file != null) {
						// 取得当前上传文件的文件名称
						String myFileName = file.getOriginalFilename();
						// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
						if (myFileName.trim() != "") {
							// 重命名上传后的文件名
							String fileName = file.getOriginalFilename();
							// 定义上传路径
							System.out.println("file.getName().equals()" + file.getName());
							if (file.getName().equals("sendFile")) {
								String logoRealPathDir = request.getSession().getServletContext().getRealPath(productsPhoto);
								File file1 = new File(logoRealPathDir);
								if (!file1.exists())
									file1.mkdirs();
								File file2 = new File(logoRealPathDir, fileName);
								if (file2.getParentFile() == null)
									file2.mkdirs();
								file.transferTo(file2);
								productsPhoto = productsPhoto +fileName;
							}else if (file.getName().equals("brandFile")) {
								String logoRealPathDir = request.getSession().getServletContext().getRealPath(brand);
								File file1 = new File(logoRealPathDir);
								if (!file1.exists())
									file1.mkdirs();
								File file2 = new File(logoRealPathDir, fileName);
								if (file2.getParentFile() == null)
									file2.mkdirs();
								file.transferTo(file2);
								brand = brand + fileName;
							}else{
								String recommend = "/content/static/img/recommend/"+departmentID+"/";
								String logoRealPathDir = request.getSession().getServletContext().getRealPath(recommend);
								File file1 = new File(logoRealPathDir);
								if (!file1.exists())
									file1.mkdirs();
								File file2 = new File(logoRealPathDir, fileName);
								if (file2.getParentFile() == null)
									file2.mkdirs();
								file.transferTo(file2);
								recommend = recommend + fileName;
								recommends.add(recommend);
							}
						}
					}
				}
				if (products == null) {
					products = new Products();
					products = productsService.save(products);
				}
				products.setBenefits(benefits);
				products.setLanguage(Language.valueOf(language));
				products.setEffect(effect);
				products.setProductsName(productsName);
				if (!productsPhoto.replace("/content/static/img/productsPhoto/"+departmentID+"/", "").equals("")) {
					products.setProductsPhoto(productsPhoto);
				}
				if (!brand.replace("/content/static/img/brand/"+departmentID+"/", "").equals("")) {
					products.setBrand(brand);
				}
				if (recommends.size()>0) {
					products.setRecommends(recommends);
				}
				products.setAgriculturalsSort(sort);
				products = productsService.update(products);
				mode.put("products", products);
			}
		}
		return new ModelAndView("management/addProducts",mode);
	}
	
	@RequestMapping(value = "updateProducts", method = RequestMethod.GET)
	public ModelAndView updateProducts(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelMap mode = new ModelMap();
		List<AgriculturalsSort> tree1 = sortService.getSortByParent();
		Products products = productsService.findById(id);
		mode.put("treeList1", tree1);
		mode.put("products", products);
		mode.put("department", products.getAgriculturalsSort());
		return new ModelAndView("management/addProducts", mode);
	}
	
	@RequestMapping(value = "deleteProducts", method = RequestMethod.GET)
	public String deleteProducts(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		productsService.delete(id);
		return "redirect:/management/productslist";
	}
	
	@RequestMapping(value = "news", method = RequestMethod.GET)
	public ModelAndView news( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<News> list = newsService.getAll();
		ModelMap mode = new ModelMap();
		mode.put("list", list);
		return new ModelAndView("management/news",mode);
	}
	
	@RequestMapping(value = "getNews", method = RequestMethod.GET)
	public ModelAndView getNews(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		News news = newsService.findById(id);
		ModelMap mode = new ModelMap();
		mode.put("notice", news);
		return new ModelAndView("management/getNews",mode);
	}
	
	@RequestMapping(value = "deleteNews", method = RequestMethod.GET)
	public String deleteNews(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		newsService.delete(id);
		return "redirect:/management/news";
	}
	
	@RequestMapping(value = "addNews", method = RequestMethod.GET)
	public ModelAndView addNews( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("management/addNews");
	}
	
	@RequestMapping(value = "addNews", method = RequestMethod.POST)
	public String addNew(String languages,String contentNews, String title,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		News news = new News();
		news.setContent(contentNews);
		news.setTitle(title);
		news.setLanguage(Language.valueOf(languages));
		newsService.save(news);
		return "redirect:/management/news";
	}
	
}
