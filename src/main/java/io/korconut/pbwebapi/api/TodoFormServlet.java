package io.korconut.pbwebapi.api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import io.korconut.bspb.dao.TodoDao;
import io.korconut.bspb.dto.TodoDto;

/**
 * Servlet implementation class TodoFormServlet
 */
@WebServlet("/newtodo.html")
public class TodoFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
        RequestDispatcher rd = req.getRequestDispatcher("/todoForm.jsp");
		rd.forward(req, resp);
	}
	

}
