package io.korconut.pbwebapi.api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import io.korconut.bspb.dao.TodoDao;
import io.korconut.bspb.dto.TodoDto;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main.html")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		TodoDao dao = new TodoDao();
		List<TodoDto> todolist = dao.getTodosByType("TODO");
		List<TodoDto> donelist = dao.getTodosByType("DONE");
		List<TodoDto> doinglist = dao.getTodosByType("DOING");
		request.setAttribute("todo", todolist);
		request.setAttribute("done", donelist);
		request.setAttribute("doing", doinglist); 
		//한꺼번에 request에 넣을수 있을것 같은데, 소규모 프로젝트 치고 이거 구상하는데도 시간 너무 많이 걸려서 패스함  
		ArrayList<String> type = new ArrayList<String>();
		type.add("TODO");
		type.add("DOING");
		type.add("DONE");
		request.setAttribute("type_u", type);
		
		//전체적으로 라인수를 줄일수 있게 하리면 초기 구상 (dto, dao) 부터 다시 변경해야 하는 것 같은 느낌적인 느낌이라, 이렇게 구현해놓음 

		RequestDispatcher rd = request.getRequestDispatcher("/main.jsp");
		rd.forward(request, response);
		
	}


}
