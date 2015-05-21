package com.yc.util;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

//验证
@Controller
@RequestMapping("/verification")
public class Verification {

	@RequestMapping(value = "smsVerification", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> smsVerification(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		String mobile = request.getParameter("mobile");
		ModelMap mode = TumblerUtil.sendSmsVerification(mobile, session);
		return mode;
	}
	
}
