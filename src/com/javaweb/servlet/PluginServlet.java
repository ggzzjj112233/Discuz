package com.javaweb.servlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaweb.dao.ICategoryDaoable;
import com.javaweb.daoImpl.CategoryDaoImpl;
import com.javaweb.model.Post;
import com.javaweb.service.Pageable;
import com.javaweb.service.Postable;
import com.javaweb.serviceImpl.PageImpl;
import com.javaweb.serviceImpl.PostImpl;

/**
 * Servlet implementation class PluginServlet
 */
@WebServlet("/PluginServlet")
public class PluginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PluginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Postable postable = new PostImpl();
		ICategoryDaoable cgd = new CategoryDaoImpl();
		Pageable pageable = new PageImpl();
		String id = request.getParameter("smallid");
		int smallid = Integer.parseInt(id);
		request.setAttribute("smallid", smallid);
		String pages1 = request.getParameter("pagenum");
		if (pages1 == null) {
			pages1 = "1";			
		} 
		int pagenum = Integer.parseInt(pages1);
		request.setAttribute("pagenumber", pagenum);
		int count1 = cgd.getCatecount1();
		request.setAttribute("count1", count1);
		int count2 = cgd.getCatecount2();
		request.setAttribute("count2", count2);
		int count3 = cgd.getCatecount3();
		request.setAttribute("count3", count3);
		int count4 = cgd.getCatecount4();
		request.setAttribute("count4", count4);
		int count5 = cgd.getCatecount5();
		request.setAttribute("count5", count5);
		List<Post> posts = postable.selectposts(smallid, (pagenum-1)*3);
		request.setAttribute("posts", posts);
		int page = pageable.getPage(smallid);
		request.setAttribute("pages", page);
		request.getRequestDispatcher("plugin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
