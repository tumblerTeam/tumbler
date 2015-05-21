package com.yc.controller.user;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yc.entity.user.User;
import com.yc.service.IUserService;
import com.yc.tumbler.service.TumblerService;
import com.yc.util.ServiceException;

@Controller
@RequestMapping("/user")
public class UserController {

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(UserController.class);

	@Autowired
	IUserService userService;

	@Resource
	TumblerService tumblerService;

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String page,RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("mobile");
		String pwd = request.getParameter("password");
		HttpSession session = request.getSession();
		User personnel = userService.getUser(name);
		if (personnel == null) {
			request.getSession().setAttribute("message", "nouser");
			return "redirect:/login?page="+page;
		} else {
			if (personnel.getPassword().equals(pwd.trim())) {
				session.setAttribute("loginUser", personnel);
				LOG.info("page============="+page);
				return "redirect:"+page;
			} else {
				request.getSession().setAttribute("message", "nouser");
				return "redirect:/login?page="+page;
			}
		}
	}

	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return new ModelAndView("user/register");
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("loginUser");
		return "redirect:/login";
	}

	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String registing(User personnel, String mobile_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Object session_code = session.getAttribute("mobile_code");
		if (session_code != null) {
			String session_mobileCode = session_code.toString();
			if (session_mobileCode.equals(mobile_code.trim())) {
				userService.save(personnel);
			}
		}
		return "redirect:/login";
	}

	@RequestMapping(value = "binding", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView load(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String action = request.getParameter("action");
		System.out.println("-----r----" + action);
		ModelAndView mav = new ModelAndView();
		if ("register".equals(action)) {
			User user = userService.findById(Integer.parseInt(request.getParameter("id")));
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
}
