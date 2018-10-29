package com.javaweb.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaweb.dao.IPostDaoable;
import com.javaweb.daoImpl.PostDaoImpl;
import com.javaweb.model.Post;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		IPostDaoable psd = new PostDaoImpl();
		Post post = new Post();
		String pname = request.getParameter("postname");
		post.setPname(pname);
		String content = request.getParameter("content");
		post.setP_content(content);
		String id = request.getParameter("puid");
		int puserid = Integer.parseInt(id);
		post.setPuserid(puserid);
		String id1 = request.getParameter("sid");
		int ssid = Integer.parseInt(id1);
		post.setSmallid(ssid);
		String id3 = request.getParameter("theme");
		int cid = Integer.parseInt(id3);
		post.setCid(cid);
		psd.addPost(post);
		response.sendRedirect("PluginServlet?smallid=" + ssid);
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
