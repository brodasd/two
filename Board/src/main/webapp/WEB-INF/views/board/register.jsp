<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%@ include file="../header.jsp"%>

<body>
	<style>
.fileDrop {
	width: 100px;
	height: 300px;
	border: 3px dotted blue;
}
</style>
	<div>
		<form action="register" method="post">
			작성자 : <input type="text" name="writer"> 제목 : <input
				type="text" name="title"> 내용 :<input type="text"
				name="content"><input type="hidden" name="imgsrc"
				id='imgsrc'>
			<button>등록버튼</button>
		</form>
	</div>
	<div class='fileDrop'></div>
	<div class="uploadedList"></div>
	<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			var uploadedList = $(".uploadedList");
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();
			});
			$(".fileDrop").on("drop", function(event) {
				event.preventDefault();
				var files = event.originalEvent.dataTransfer.files;
				var file = files[0];
				/* 옛날브라우저에선 이렇게 폼태그를 만들어버리는 방식이 지원이안됨 최신버전에서만 지원이됨.*/
				var formData = new FormData();
				$('.uploadedList').empty();
				formData.append("file", file);
				console.log(formData);
				/* ajax!!!이건 ajax로만됨. get post getjson ㄴㄴ해 */
				$.ajax({
					url : "uploadFile",

					data : formData,/* 이건 기본이 멀티파트임.. */
					dataType : 'text',
					type : "post",
					/* 이데이터들이 필요함. */
					contentType : false,/*  */
					processData : false,
					success : function(data) {
						uploadedList.html("<img src=show?name=" + data + ">");
						$("#uphoto").val(data);

						$("#imgsrc").val(data);
					}
				});
			});

		});
	</script>
</body>
<%@ include file="../footer.jsp"%>
</html>