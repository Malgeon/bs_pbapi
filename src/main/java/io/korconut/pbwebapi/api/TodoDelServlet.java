package io.korconut.pbwebapi.api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import io.korconut.bspb.dao.TodoDao;
import io.korconut.bspb.dto.TodoDto;

/**
 * Servlet implementation class TodoDelServlet
 */
@WebServlet("/todoDel")
public class TodoDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoDelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		TodoDao dao = new TodoDao();
		
		int id = Integer.parseInt(request.getParameter("id"));
    	int result = dao.deleteTodo(id);
    	
    	if (result == 1) {
    		out.println("success!!");
    	}
    	else {
    		out.println("no!!");
    	}
	}

}
