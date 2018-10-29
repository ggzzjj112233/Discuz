package com.javaweb.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaweb.model.Userdate;
import com.javaweb.service.Registable;
import com.javaweb.serviceImpl.RegistImpl;

/**
 * Servlet implementation class RegistServlet
 */
@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	Userdate userdate = new Userdate();
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 对应于get请求
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 对应于post请求
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("username");
		userdate.setUser_name(name);
		String mima = request.getParameter("mima");
		userdate.setUser_psd(mima);
		String email = request.getParameter("email");
		userdate.setUser_email(email);
		Registable userRigst = new RegistImpl();
		userRigst.regist(userdate);
	}

}
