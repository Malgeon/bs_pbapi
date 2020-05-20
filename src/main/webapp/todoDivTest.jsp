<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="io.korconut.bspb.dao.TodoDao, io.korconut.bspb.dto.TodoDto, java.util.List, java.util.ArrayList" %>
<%!
	String id = "u001";
	public String getId() {
	return id;
	}
%>
<%
	TodoDao dao = new TodoDao();
	List<TodoDto> todolist = dao.getTodosByType("TODO");
	List<TodoDto> donelist = dao.getTodosByType("DONE");
	List<TodoDto> doinglist = dao.getTodosByType("DOING");
	request.setAttribute("todo", todolist);
	request.setAttribute("done", donelist);
	request.setAttribute("doing", doinglist);
	ArrayList<String> type = new ArrayList<String>();
	type.add("TODO");
	type.add("DOING");
	type.add("DONE");
	request.setAttribute("type_u", type);
	
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>

			a:link { 
				color: white; text-decoration: none;
			}
 			a:visited { 
 				color: white; text-decoration: none;
 			}
 			a:hover { 
 				color: white; text-decoration: none;
			 }
			 
            body {
				background-color: white;
				min-width: 490px;
            }

			.header_wrap {
				display: flex;
				padding-right: 0.5rem;
				height: 80px;
				margin-top: 20px;
			}

			#wrap {
				display: flex;
			}
				
			.head {
				margin-top: 20px;
			    -moz-transform: rotate(-30deg);
			    -webkit-transform: rotate(-30deg);
				transform: rotate(-30deg);
				position:relative;
			}
					
			.left, .mid, .right {
			    width : 400px;
				height : auto;
				position : relative;
			    border: 1px solid whitesmoke;
				float : left;
				margin-top: 30px;
				margin-right: 10px;
				margin-left: 15px;
				margin-bottom: 30px;
				background-color:whitesmoke;
				padding: 0 20px;
				border-radius: 3px;
				padding-bottom: 12px;
			}

			.btn_input {
				margin-left: auto;
				padding-right: 20px;
                font-size: 14px;
                height: 22px;
                padding: 12px 11px;
                width:130px;
                box-sizing: inherit;
                border-radius: 8px;
                border: 1px solid #78aff8;
                position: relative;
                cursor: pointer;
                display: inline-block;
				text-align: center;
				background: #78aff8;
				color: #fff;

				margin-top: 15px;
			}

			.content_head {
				margin-left: 10px;
			}

			.content_box {
				margin: 0 auto;
			}

			.head_content {
				margin-top: 20px;
				margin-left: -2px;
			}

			.btn_input:hover, .down_right:hover {
                box-shadow: 0 5px 5px 0 rgba(0,0,0,0.24),0 0 0 0 rgba(0,0,0,0.19);
			}
			
            .btn_input:active, .down_right:active {
                outline: 5px;
                color: #fff;
                background: #91baf7;
			}
			
			.main_content {
				background: whitesmoke;
				padding: 15px;
				border-radius: 8px;
				margin-bottom: 8px;
			}

			.main_content > .main_down {
				display: flex;
				margin-top: 5px;
			}

			.down_left {
				width: 94%;
			}

			.main_h {
				margin: 0 auto;
			}
			.main_p {
				margin: 0 auto;
			}

			.down_right {
				border-radius: 3px;
				font-size: 6px;
				font-weight: bold;
                height: 20x;
                padding: 0;
                width: 20px;
                box-sizing: inherit;
                border: 1px solid whitesmoke;
                position: relative;
                cursor: pointer;
                display: inline-block;
				text-align: center;
				background: whitesmoke;
				color: rgb(116, 116, 116);
			}
			
			.logo {
				text-align: center;
			}
			
			.end {
				text-align: center;
			}

        </style>
        
	</head>
	<body>
		<div class="wrap">
		
		<c:forEach var="i" begin="0" end="2" step="1">
				<div class="mid">
					<div class="header"><h3><span class="content_head">${type_u[i] }</span></h3></div>
					<c:if test=${type_u[i] == 'TODO'}>
						<c:forEach var="data" items="${todo }">
							<div class="main_content">
								<div class="main_up">
									<h3 class="main_h">${data.title }</h3>
								</div>
								<div class="main_down">
									<div class="down_left">
										<p class="main_p">등록날짜:${fn:substring(data.regDate, 0, 10) }, ${data.name }, 우선순위${data.sequence }</p>
									</div>
										<button class="down_right" type="button">→</button>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test=${type_u[i] == 'DOING'}>
						<c:forEach var="data" items="${doing }">
							<div class="main_content">
								<div class="main_up">
									<h3 class="main_h">${data.title }</h3>
								</div>
								<div class="main_down">
									<div class="down_left">
										<p class="main_p">등록날짜:${fn:substring(data.regDate, 0, 10) }, ${data.name }, 우선순위${data.sequence }</p>
									</div>
										<button class="down_right" type="button">→</button>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test=${type_u[i] == 'DONE'}>
						<c:forEach var="data" items="${done }">
							<div class="main_content">
								<div class="main_up">
									<h3 class="main_h">${data.title }</h3>
								</div>
								<div class="main_down">
									<div class="down_left">
										<p class="main_p">등록날짜:${fn:substring(data.regDate, 0, 10) }, ${data.name }, 우선순위${data.sequence }</p>
									</div>
										<button class="down_right" type="button">→</button>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>					
		</c:forEach>
		</div>
		
			
	</body>	
	<script type="text/javascript">
		
	</script>	
	
	
	
</html>