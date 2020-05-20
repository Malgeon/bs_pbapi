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
 * Servlet implementation class TodoAddServlet
 */
@WebServlet("/todoadd")
public class TodoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
        TodoDao dao = new TodoDao();
    	long id = dao.getTodo_id();
    	String name = request.getParameter("name");
    	int sequence = Integer.parseInt(request.getParameter("sequence"));
    	String title = request.getParameter("title");
        String type = "TODO";
        String test = request.getParameter("test");
        
        System.out.println("id : " + id);
        System.out.println("name : " + name);
        System.out.println("sequence : " + sequence);
        System.out.println("title : " + title); 
        System.out.println("type : " + type);
        System.out.println("test : " + test);
        
        TodoDto todo = new TodoDto(name, sequence, title, type);
    	int insertCount = dao.addTodo(todo);
    	System.out.println(insertCount);
    	
        response.sendRedirect("../bs_pbapi/main.html");
	}

}
