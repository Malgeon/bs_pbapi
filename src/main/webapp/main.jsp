 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				<div class="left"> <!-- 사실 left, mid, right 전체를 하나 태그로 둘수 있을 것 같은데, 구현 소요시간이 너무 많아 다음에 공부하기로 하자 -->
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
	//첫 소규모 개인 프로젝트라 기준은 없다. (예를들어 함수를 만드는 기준 등등 느낌가는대로) 
	//ajax 사용방법이나 jstl이나 querySelectorAll과 같은 메소드 찾아보기도 바뻤고, 이해하기도, 적용하기도 바뻣다.  
	//주석다는 습관이나 깔끔한 코드 설계는 다음부터..
	var tmp = document.querySelectorAll('.down_right_move') //ajax를 사용해서 db의 정보 변경과 js를 이용해 웹상 정보 변경을 동시에 하는 방식으로 구현. Jquery 미사용 조건
	
	for (var itm of tmp) {
		itm.addEventListener('click', function(event){
			var target = event.target;  
		    var target_div = document.getElementsByName(target.name)[0]; 
		    //해당 버튼 name = btn_부모노드_[id자릿수][id번호] | 사실 그냥 느낌상 getElement에 있는것중 느낌상 정보전달용 name으로 고른건데 보통은 어떤걸 고르는지 모르겠다.
		    //className을 고르는것 같기도 하고
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
		    	
		    	var xhr = new XMLHttpRequest();
			    xhr.open('POST', '../bs_pbapi/type');
			    xhr.onreadystatechange = function(){
			    	console.log(this.responseText);
			    }
			    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			    xhr.send("pdivname=" + parent_div_name + "&id=" + t_id); 
			    
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
			var target = event.target;			

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
		
		var xhr = new XMLHttpRequest();
	    xhr.open('POST', '../bs_pbapi/todoDel');
	    //delete servlet 주소
	    xhr.onreadystatechange = function(){
	    	console.log(this.responseText);
	    }
	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    xhr.send("id=" + id); 
		
		
	}
	
	
	</script>

</html>