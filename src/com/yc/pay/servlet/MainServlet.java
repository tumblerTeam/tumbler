package com.yc.pay.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("!QQQQ!!!!!!!!!!!!!!!!!!�Ѿ�����mainServlet��������");
		String userId = request.getParameter("userId");
		String orderNo = request.getParameter("orderNo");
		String describe = request.getParameter("describe");
		String money = request.getParameter("money");
		
		//���˺ż��̻���ز���
		String appid = "wx8c70512b5e52591e";
		String appsecret = "8a0f2476960f82450df5d82d046f29dd";
		String partner = "1250338601";
		String partnerkey = "8a0f2476960f82450df5d82d046f29dd";
		
		String backUri = "http://www.bdweng.com/topayServlet";
		System.out.println(backUri);
		//��Ȩ��Ҫ��ת����������Ĳ���һ���л�Ա�ţ���������֮�࣬
		//����Լ�����һ�������ַ�����������һ���Զ����key��MD5ǩ�������Լ�д��ǩ��,
		//���� Sign = %3D%2F%CS% 
		//		backUri = backUri+"?userId=b88001&orderNo=1499900164810&describe=����&money=10.00";
		backUri = backUri+"?userId="+userId+"&orderNo=1499900164823&describe="+describe+"&money="+money;
		//URLEncoder.encode �������backUri ��url�����ȡ���ݵ����в���
		backUri = URLEncoder.encode(backUri);
		//scope �����Ӹ������������������scope=snsapi_base ��������Ȩҳ��ֱ����ȨĿ��ֻ��ȡͳһ֧���ӿڵ�openid
		String url = "https://open.weixin.qq.com/connect/oauth2/authorize?" +
				"appid=" + appid+
				"&redirect_uri=" +
				 backUri+
				"&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
		response.sendRedirect(url);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
