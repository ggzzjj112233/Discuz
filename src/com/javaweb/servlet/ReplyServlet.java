package com.javaweb.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaweb.dao.IReplyDaoable;
import com.javaweb.daoImpl.ReplyDaoImpl;
import com.javaweb.model.Reply;

/**
 * Servlet implementation class ReplyServlet
 */
@WebServlet("/ReplyServlet")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReplyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	    IReplyDaoable rpd = new ReplyDaoImpl();
	    Reply reply=new Reply();
	    String content = request.getParameter("content");
		reply.setR_content(content);
		String id=request.getParameter("ruid");
		int ruserid = Integer.parseInt(id);
		reply.setRuserid(ruserid);
		String postid=request.getParameter("pid");
		int id2 = Integer.parseInt(postid);
		reply.setPostid(id2);
		rpd.addReply(reply);
		response.sendRedirect("ThreadServlet?postid="+id2);
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
