<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="io.korconut.bspb.dao.TodoDao, io.korconut.bspb.dto.TodoDto, java.util.List" %>
<%!
	String id = "u001";
	public String getId() {
	return id;
	}
%>
<%
	TodoDao dao = new TodoDao();
	List<TodoDto> list = dao.getTodosByType("TODO");
	request.setAttribute("todo", list);
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
		<form name="frm">
			이름 : <input type="text" name="name" /><br /> 
			나이 : <input type="text" name="age" /><br /> 
			<input type="button" value="get" id="btnGet" />
			<input type="button" value="post" id="btnPost" />
		</form>
		<br>
		id : <%=getId() %>
		
		
		<c:forEach var="i" begin="1" end="5" step="1">
			<H${ i}>아름다운 한글</H${ i}>
		</c:forEach>

	
		<c:if test="${parama.name == null }">
			name 파라미터 값이 ${parama.name} 입니다.
		</c:if>
		
		<div class="main_content">
			<div class="main_up">
				<h3 class="main_h">자바스크립트 공부하기</h3>
			</div>
			<div class="main_down">
				<div class="down_left">
					<p class="main_p">등록날짜:2020.05.02, 홍길동, 우선순위1</p>
				</div>
					<button class="down_right" type="button">→</button>
			</div>
		</div>
		
		<br><br>
		
		<c:forEach var="data" items="${todo }">
			${data.title } <br>
		</c:forEach>
		
		<c:forEach var="data" items="${todo }">
			<div class="main_content">
				<div class="main_up">
					<h3 class="main_h">${data.title }</h3>
				</div>
				<div class="main_down">
					<div class="down_left">
						<p class="main_p">등록날짜:${fn:substring(data.regDate, 0, 10) }, ${data.name }, 우선순위${data.sequence }</p>
					</div>
						<button class="down_right" id="execute" value="execute" type="button">→</button>
				</div>
			</div>
		</c:forEach>
		
			
	</body>	
	<script type="text/javascript">
	window.onload = function() {
		document.getElementById("btnGet").onclick = getFunc;
		document.getElementById("btnPost").onclick = postFunc;
	}
	
	document.querySelector('#execute').addEventListener('click', function(event) {
		var xhr_1 = new XMLHttpRequest();
		xhr_1.oepn('POST', './type');
		xhr_1.onreadystatechange = function() {
			document.querySelector('#time').innerHTML = xhr_1.responseText;
		}
		
		xhr_1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		
		var data = '';
		data += 'timezone=' + document.getElementById('timezone').value;
		data += '&format=' + document.getElementById('format').value;
		xhr_1.send(data);
	})
	
	
	
	var oReq = new XMLHttpRequest();
	oReq.addEventListener("load", function() {
		console.log(this.responseText);
	})
	
	oReq.open("GET", "./json.txt");
	oReq.send();
	
	var xhr;
	
	//get방식
	function getFunc() {
		var irum = frm.name.value;
		var nai = frm.age.value;
		//alert(irum + " " + nai);
		
		//get방식은 주소에 데이터를 붙여서 전송
		var fName = "prac_ajax.jsp?name=" + irum + "&age=" + nai; 
		xhr = new XMLHttpRequest();
		xhr.open("get", fName, true);
		xhr.onreadystatechange =  function() { //폴백

			if (xhr.readyState == 4) {
				if (xhr.status == 200) { //200은 잘넘어왔단 것이다.
					process();
				} else {
					alert("요청오류 : " + xhr.status);
				}
			}
		}
		xhr.send(null); //get방식일때 null
	}

	//post방식
	function postFunc() {
		var irum = frm.name.value;
		var nai = frm.age.value;		
		xhr = new XMLHttpRequest();
		xhr.open("post", "prac_ajax.jsp", true);
		
		xhr.onreadystatechange = function() { //폴백
			if (xhr.readyState == 4) {
				if (xhr.status == 200) { //200은 잘넘어왔단 것이다.
					process();
				} 
				else {
					alert("요청오류 : " + xhr.status);
				}
			}
		}

		//post방식은 xhr객체에 데이터를 붙여서 전송
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send("name=" + irum + "&age=" + nai); 
	}
	
	function process() {
		var data = xhr.responseText;
		
		alert("요청 결과 : " + data);
		
	}
	</script>
	
	
	
</html>