 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="io.korconut.bspb.dao.TodoDao, io.korconut.bspb.dto.TodoDto, java.util.List, java.util.ArrayList" %>    
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
		<title>[Server]BoostCourse Project B</title>
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
				background: #fff;
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

			.down_right_move, .down_right_del {
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
		<header>
			<div class="header_wrap">
				<div class="head_content">
					<h2 class="head">나의 해야할 일들</h2>
				</div>
				
				<div class="btn_input">
					<a href="../bs_pbapi/newtodo.html">새로운 TODO 등록</a>
				</div>
			</div>
		</header>
		
		<div id="wrap">
			<div class="content_box">
				<div class="left">
					<div class="header"><h3><span class="content_head">TODO</span></h3></div>
					<c:forEach var="data" items="${todo }">
						<div class="main_content" name = "div_t_${data.id }">
							<div class="main_up">
								<h3 class="main_h">${data.title }</h3>
							</div>
							<div class="main_down">
								<div class="down_left">
									<p class="main_p">등록날짜:${fn:substring(data.regDate, 0, 10) }, ${data.name }, 우선순위${data.sequence }</p>
								</div>
									<button class="down_right_move" type="button" name = "btn_l_${data.sId.length() }${data.id }">→</button>
							</div>
						</div>
					</c:forEach>				
				</div>
				<div class="mid">
					<div class="header"><h3><span class="content_head">DOING</span></h3></div>
					<c:forEach var="data" items="${doing }">
						<div class="main_content" name = "div_t_${data.id }">
							<div class="main_up">
								<h3 class="main_h">${data.title }</h3>
							</div>
							<div class="main_down">
								<div class="down_left">
									<p class="main_p">등록날짜:${fn:substring(data.regDate, 0, 10) }, ${data.name }, 우선순위${data.sequence }</p>
								</div>
									<button class="down_right_move" type="button" name = "btn_m_${data.sId.length() }${data.id }">→</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="right">
					<div class="header"><h3><span class="content_head">DONE</span></h3></div>
					<c:forEach var="data" items="${done }">
						<div class="main_content" name = "div_t_${data.id }">
							<div class="main_up">
								<h3 class="main_h">${data.title }</h3>
							</div>
							<div class="main_down">
								<div class="down_left">
									<p class="main_p">등록날짜:${fn:substring(data.regDate, 0, 10) }, ${data.name }, 우선순위${data.sequence }</p>
								</div>
									<button class="down_right_del" type="button" name = "btn_r_${data.sId.length() }${data.id }">X</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<footer>
		<div class="end">3개 가운데 배치는 이정도가 적당할듯, 웹 크기에 다른 width 100% -> 50% 변화는 js에서 알게 될듯..</div>
		 <p class="logo">Korconut
		</footer>
		
	
	</body>
	
	<script type="text/javascript">
	
	var tmp = document.querySelectorAll('.down_right_move')
	
	for (var itm of tmp) {
		itm.addEventListener('click', function(event){
			console.log("클릭했어!");
			var target = event.target;
			console.log(target.className);
			//var xhr = new XMLHttpRequest();
		    //xhr.open('POST', './type');
		    //xhr.onreadystatechange = function(){
		    //	console.log();
		    //}
		    //xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		    //var data = '';
		    //xhr.send(data); 
		    var target_div = document.getElementsByName(target.name)[0];
		    var parent_p = target.name.substring(4,5);
		    var t_id_count = target.name.substring(6, 7); 
		    var t_id = target.name.substring(7, 7+t_id_count);
		    if(parent_p =='l') {
		    	var parent_div_name = "left";
		    } 
		    else if(parent_p =='m') {
		    	var parent_div_name = "mid";
		    }
		    else if(parent_p =='r') {
		    	var parent_div_name = "right";
		    }
		    else {
		    	console.log("parent_p error");	    	
		    }
		    if(parent_p == 'r'){
		    	del_Div(t_id);
		    }
		    
		    else {
		    	var next_div = nextDiv(parent_div_name);
		    
			    if(next_div == 'right') {
			    	target_div.className = "down_right_del";
			    	target_div.innerText = "X";
			    }
			    
			    target_div.name = "btn_" + next_div.substring(0, 1) + "_" + t_id_count + t_id;
			    
			    var childNode = document.getElementsByName("div_t_"+t_id)[0];
			    var parentDiv = document.getElementsByClassName(next_div)[0];
			    var tmp = undefined;
			    parentDiv.insertBefore(childNode, tmp);
		    }
		});
	}
	var del = document.querySelectorAll('.down_right_del')
	
	for (var del_itm of del) {
		del_itm.addEventListener('click', function(event){
			console.log("여기로 와애해");
			var target = event.target;
			console.log(target.className);
			//var xhr = new XMLHttpRequest();
		    //xhr.open('POST', './type');
		    //xhr.onreadystatechange = function(){
		    //	console.log();
		    //}
		    //xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		    //var data = '';
		    //xhr.send(data); 
		    var t_id_count = target.name.substring(6, 7); 
		    var t_id = target.name.substring(7, 7+t_id_count);
		    var node = document.getElementsByName("div_t_"+t_id)[0];
		    del_Div(t_id);
		});
	}
	
	function nextDiv( item ) {
		if (item == 'left')	{
			var next_div_name = "mid"
			return next_div_name;
		}
		
		else if (item == 'mid')	{
			var next_div_name = "right"
			return next_div_name;
		}
		
		else {
			console.log("next_item error");	  
		}
	}
	
	function del_Div( id ) {
		
		var target_Node = document.getElementsByName("div_t_" + id)[0];
		var t_Node_parent = target_Node.parentNode;
		t_Node_parent.removeChild(target_Node);
		
		
	}
	
	
	</script>

</html>