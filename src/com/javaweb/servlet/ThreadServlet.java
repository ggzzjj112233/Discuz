package com.javaweb.servlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaweb.dao.IReplyDaoable;
import com.javaweb.daoImpl.ReplyDaoImpl;
import com.javaweb.model.Reply;
import com.javaweb.service.Bigblockable;
import com.javaweb.service.Categoryable;
import com.javaweb.service.Postable;
import com.javaweb.service.Replyable;
import com.javaweb.service.Smallblockable;
import com.javaweb.service.Userdateable;
import com.javaweb.serviceImpl.BigblockImpl;
import com.javaweb.serviceImpl.CategoryImpl;
import com.javaweb.serviceImpl.PostImpl;
import com.javaweb.serviceImpl.ReplyImpl;
import com.javaweb.serviceImpl.SmallblockImpl;
import com.javaweb.serviceImpl.UserdateImpl;

/**
 * Servlet implementation class ThreadServlet
 */
@WebServlet("/ThreadServlet")
public class ThreadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThreadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Bigblockable bba = new BigblockImpl();
		Smallblockable sba = new SmallblockImpl();
		Postable psa = new PostImpl();
		Categoryable cga = new CategoryImpl();
		Userdateable uda = new UserdateImpl();
		IReplyDaoable rpd = new ReplyDaoImpl();
		Replyable rpa = new ReplyImpl();
		String id = request.getParameter("postid");
		int postid = Integer.parseInt(id);
		int pid=postid;
		request.setAttribute("pid", pid);
		String bsname = bba.getBigblockname(postid);
		request.setAttribute("bsname", bsname);
		String ssname = sba.getSbname(postid);
		request.setAttribute("ssname", ssname);
		String postName = psa.getPname(postid);
		request.setAttribute("postName", postName);
		String className = cga.getCatename(postid);
		request.setAttribute("className", className);
		String userName = uda.getPostUserName(postid);
		request.setAttribute("userName", userName);
		String postTime = psa.getPtime(postid);
		request.setAttribute("postTime", postTime);
		String postContent = psa.getPcontent(postid);
		request.setAttribute("postContent", postContent);
		List<Reply> replies = rpd.selectReplys(postid);
		request.setAttribute("replies", replies);
		int countAll = rpa.getCount(postid);
		request.setAttribute("countAll", countAll);
		request.getRequestDispatcher("thread.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
