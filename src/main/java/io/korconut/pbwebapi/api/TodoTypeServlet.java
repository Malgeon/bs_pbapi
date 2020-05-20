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
 * Servlet implementation class TodoTypeServlet
 */
@WebServlet("/type")
public class TodoTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String parentDiv = request.getParameter("pdivname");
		String id = request.getParameter("id");
		String type;
		if(parentDiv.equals("left")) {
			type = "DOING";
		}
		else if(parentDiv.equals("mid")) {
			type = "DONE";
		}
		else {
			out.println("parentDiv Error");
			type = "";
		}
		TodoDto todo = new TodoDto();
        TodoDao dao = new TodoDao();

    	todo.setType(type);
    	todo.setId((long)Integer.parseInt(id));
    	
    	int result = dao.updateTodo(todo);
    	
    	if (result == 1) {
    		out.println("success!!");
    	}
    	else {
    		out.println("no!!");
    	}

	}

}
