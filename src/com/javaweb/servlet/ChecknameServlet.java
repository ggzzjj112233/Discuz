package com.javaweb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaweb.model.Userdate;
import com.javaweb.service.Registable;
import com.javaweb.serviceImpl.RegistImpl;

/**
 * Servlet implementation class ChecknameServlet
 */
@WebServlet("/ChecknameServlet")
public class ChecknameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChecknameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Registable rga = new RegistImpl();
		ArrayList<Userdate> users = rga.getUserName();
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		int content = 0;
		for (int i = 0; i < users.size(); i++) {
			if (users.get(i).getUser_name().equals(name)) {
				content = 1;//用户名存在
				break;
			}else{
				content = 0;//用户名不存在
			}
		}
		out.print(content);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
