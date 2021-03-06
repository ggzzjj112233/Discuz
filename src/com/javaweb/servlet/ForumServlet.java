package com.javaweb.servlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaweb.dao.IBigblockDaoable;
import com.javaweb.daoImpl.BigblockDaoImpl;
import com.javaweb.model.Bigblock;
import com.javaweb.model.Smallblock;
import com.javaweb.service.Smallblockable;
import com.javaweb.serviceImpl.SmallblockImpl;

/**
 * Servlet implementation class ForumServlet
 */
@WebServlet("/ForumServlet")
public class ForumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForumServlet() {
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
		IBigblockDaoable bbd = new BigblockDaoImpl();
		Smallblockable sba=new SmallblockImpl();
		String where1 = "";
		List<Bigblock> bigblocks = bbd.selectBigblocks(where1);
		List<Smallblock> smallblocks=sba.getAll();
		request.setAttribute("bigblocks", bigblocks);
		request.setAttribute("smallblocks", smallblocks);
		request.getRequestDispatcher("forum.jsp").forward(request, response);
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
