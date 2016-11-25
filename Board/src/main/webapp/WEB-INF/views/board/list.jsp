
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
.pagingDiv li{
	list-style: none;
	float: left;
	margin: 10px;
	list-style: none;
}

.pagingUl {
	align: center;
}




.pagingUl li{
	list-style: none;
	float: left;
	margin: 10px;
	list-style: none;

}

.list {
	list-style: none;
	
}
</style>
	<div align="center">
		<form method="get" id="f1">
			<input id="pageHidden" type="hidden" name="page" value=${cri.page}>
			<input id="bnoHidden" type="hidden" name="bno"> <select
				id="sType" name="sType" type='hidden'>
				<option value='n' ${param.sType =="n"?"selected":""}>--</option>
				<option value='t' ${param.sType =="t"?"selected":""}>제목</option>
				<option value='c' ${param.sType =="c"?"selected":""}>내용</option>
				<option value='w' ${param.sType =="w"?"selected":""}>작성자</option>
			</select> <input type="text" name="keyword" id="keyword"
				value="${param.keyword}">
			<button id='sBtn'>검색</button>
		</form>

		<c:forEach items="${list}" var="BoardVO">
			<ul class='list'>
				<li><a
					href='/board/view?page=${param.page}&bno=${BoardVO.bno }&sType=${param.sType}&keyword=${param.keyword}'>${BoardVO.title}</a>
					${BoardVO.content} ${BoardVO.writer} ${BoardVO.regdate}${count}</li>
			</ul>
		</c:forEach>



		<ul class='pagingUl'>
		<c:if test="${page.current ne page.firstPage}">
			<li><a href='list?page=${param.page-1}'>이전</a></li>
		</c:if>
		<div class='pagingDiv'>
		<c:forEach begin="${page.firstPage}" end="${page.lastPage}" var='idx'>
			
				<li class='pageLi'><a href='${idx}'>${idx}</a></li>
			
		</c:forEach>
		</div>

		<c:if test="${page.current ne page.lastPage}">
			<li><a href='list?page=${param.page+1}'>다음</a></li>
		</c:if>
		</ul>
		<form action="register">
			<button type="submit">글쓰기</button>
		</form>
	</div>
	</div>

	<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {

			$('#sBtn').on("click", function(event) {
				alert("검색이요");
				$("#pageHidden").val("1");
				$("#f1").attr("action", "listSearch").submit();

			});

			$(".pageLi").on("click", "a", function(event) {

				event.preventDefault();

				var pageNum = $(this).attr('href');

				$("#pageHidden").val(pageNum);
				$("#f1").submit();

			});
		});
	</script>

</body>

<%@ include file="../footer.jsp"%>

</html>





