package com.yc.util;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

//验证
@Controller
@RequestMapping("/verification")
public class Verification {

	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";

	public static String createRandom(boolean numberFlag, int length) {
		String retStr = "";
		String strTable = numberFlag ? "1234567890" : "1234567890abcdefghijkmnpqrstuvwxyz";
		int len = strTable.length();
		boolean bDone = true;
		do {
			retStr = "";
			int count = 0;
			for (int i = 0; i < length; i++) {
				double dblR = Math.random() * len;
				int intR = (int) Math.floor(dblR);
				char c = strTable.charAt(intR);
				if (('0' <= c) && (c <= '9')) {
					count++;
				}
				retStr += strTable.charAt(intR);
			}
			if (count >= 2) {
				bDone = false;
			}
		} while (bDone);

		return retStr;
	}

	@RequestMapping(value = "smsVerification", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> smsVerification(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, DocumentException {

		HttpClient client = new HttpClient();
		PostMethod method = new PostMethod(Url);

		// client.getParams().setContentCharset("GBK");
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType", "application/x-www-form-urlencoded;charset=UTF-8");

		String mobile_code = createRandom(false, 6);

		// System.out.println(mobile);

		String content = new String("您的验证码是： " + mobile_code + "。请不要把验证码泄露给其他人。");

		NameValuePair[] data = {// 提交短信
		new NameValuePair("account", "cf_jb520hss"), new NameValuePair("password", "zhang123456"), // 密码可以使用明文密码或使用32位MD5加密
				// new NameValuePair("password",
				// util.StringUtil.MD5Encode("密码")),
				new NameValuePair("mobile", request.getParameter("mobile")), new NameValuePair("content", content), };

		method.setRequestBody(data);
		client.executeMethod(method);

		String SubmitResult = method.getResponseBodyAsString();

		// System.out.println(SubmitResult);

		Document doc = DocumentHelper.parseText(SubmitResult);
		Element root = doc.getRootElement();

		String code = root.elementText("code");
		String msg = root.elementText("msg");
		String smsid = root.elementText("smsid");

		System.out.println(code);
		System.out.println(msg);
		System.out.println(smsid);

		if ("2".equals(code)) {
			ModelMap mode = new ModelMap();
			mode.put("name", "提交成功");
			return mode;
		}
		return null;
	}
}
