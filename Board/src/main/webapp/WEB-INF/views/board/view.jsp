<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%@ include file="../header.jsp"%>


<body>

	<style>
.updateBtn {
	display: none;
}

.replyBtn {
	display: none;
}

.read {
	list-style: none;
}
</style>
	<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous"></script>
	<div align="left">
		<ul class="read">

			<li>제목 : ${read.title}</li>
			<li>작성자 : ${read.writer}</li>
			<li>내용 : ${read.content}</li>
			<li>등록 시간 : ${read.regdate}</li>
			<c:if test="${read.imgsrc ne null}">
				<img src="show?name=${read.imgsrc}">
			</c:if>
		</ul>
		<h1>댓글들</h1>
		<ul class="reply">
		</ul>


		<button id="dBtn">삭제하기</button>
		<button id="listBtn">목록가기</button>
		<button class="uBtn">수정하기</button>
		<button class="rBtn">댓글 달기</button>

		<form class="deleteBtn" action="delete" method="post">
			<input type="hidden" name="bno" value="${param.bno}">
		</form>


		<div class="updateBtn">
			<form action="update" method="post">
				<input type="hidden" name="bno" value="${param.bno}"> 제목 : <input
					type="text" name="title"> 내용 : <input type="text"
					name="content">
				<button>수정하기</button>
			</form>
		</div>

		<div class="replyBtn">
			<form action="reply" method="post" id="f2">
				<input type="hidden" name="bno" value="${param.bno}"> 댓글 내용
				: <input type="text" name="reply" id="reply"> 댓글 작성자 : <input
					type="text" name="replyer" id="replyer">

			</form>
			<button id="replyAddBtn">댓글 등록</button>
		</div>


	</div>
	<form id='form' action="listSearch" method='get'>
		<input type='hidden' name='page' value='${param.page}'> <input
			type='hidden' name='sType' value='${param.sType}'> <input
			type='hidden' name='keyword' value='${param.keyword}'> <input
			type='hidden' name='bno' value='${param.bno}'>
	</form>

	<script>
		$(document).ready(function() {
			
			$('#listBtn').on('click', function() { 
				$('#form').submit(); 
				});
			

			$('#dBtn').on('click', function() { 
				$('.deleteBtn').submit(); 
				});
			
			$(function() {
				$('.uBtn').click(function() {
					$('.updateBtn').toggle('slow');
					
				});
			});
			
			$(function() {
				$('.rBtn').click(function() {
					$('.replyBtn').toggle('slow'); 
				});
			}); 
			 
			$(function() {
				$('.showBtn').click(function() {
					$('.reply').toggle('slow');
				});
			});
			
			
			var printReply = function(){ 
				
				event.preventDefault();
				var bno = ${param.bno}; 
				
				
				$.getJSON(
						"http://localhost:8081/reply/view", 
				 		{bno : bno }, 
				 		function(data){
				 		  
						$('.reply').empty();
						$.each(data, function(index, obj){ 
							
							rno = obj.rno;/*  */
							console.log(rno);
							$('.reply').append('<li >'+ "번호 : " + obj.rno + " 작성자 : " 
									+ obj.replyer + "<br>댓글내용 : "+ obj.reply+'</li>' 
									+ '<button class="delBtn" value="'+obj.rno +'">댓글삭제</button>'
									+'<button id="replyUptBtn">댓글수정</button>'
									);
							 
							console.log(obj); 
						 }); 
				});  
			};
			
 
			console.log("=============================start reply===============");
			printReply(); 
			
			$('#replyAddBtn').on('click', function(event) {
				console.log("add버튼 1단계");
				event.preventDefault();
				
				var data = { bno : ${param.bno},
						     reply : $('#reply').val(),
						     replyer : $('#replyer').val()
						     };  
				$.post("../reply/addReply", data, function(result) {   
					console.log("add버튼 2단계");
			 		alert("성공했습니다."); 
					printReply();  
					$('#reply').val("");
					$('#replyer').val("");
				});  
			});
			
			
			$('.reply').on('click', ".delBtn",function(event) { 
				event.preventDefault(); 
				
				
				var classVal = $(this).val();
				/* alert(classVal);
				console.log("m1의 값"+classVal);  
				
				console.log("del버튼 1단계");   */
				
				   $.ajax({      
					    
				        type:"POST",  
				        url: "http://localhost:8081/reply/delReply",      
				        data : {"rno" : classVal},
				        
				      	success:function(args){ 
				        	alert("성공했습니다.");
				        	$('.reply').empty();
				        	printReply();       
				        },
				  
				        error:function(e){  
				        	alert("실패");
				        	printReply();
				        	console.log("실패했음 콘솔")
				            
				        }  
				    });  
			});
			
			$('.reply').on('click', ".delBtn",function(event) { 
				event.preventDefault(); 
				
				
				var classVal = $(this).val();
				/* alert(classVal);
				console.log("m1의 값"+classVal);  
				
				console.log("del버튼 1단계");   */
				
				   $.ajax({      
					    
				        type:"POST",  
				        url: "http://localhost:8081/reply/delReply",      
				        data : {"rno" : classVal},
				        
				      	success:function(args){ 
				        	alert("성공했습니다.");
				        	$('.reply').empty();
				        	printReply();       
				        },
				  
				        error:function(e){  
				        	alert("실패");
				        	printReply();
				        	console.log("실패했음 콘솔")
				            
				        }  
				    });  
			});
			

			
		});
		
	</script>
</body>

<%@ include file="../footer.jsp"%>
</html>