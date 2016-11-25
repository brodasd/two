<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description"
	content="A front-end template that helps you build fast, modern mobile web apps.">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>게시판짜기</title>

<!-- Add to homescreen for Chrome on Android -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="images/android-desktop.png">

<!-- Add to homescreen for Safari on iOS -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Material Design Lite">
<link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

<!-- Tile icon for Win8 (144x144 + tile color) -->
<meta name="msapplication-TileImage"
	content="images/touch/ms-touch-icon-144x144-precomposed.png">
<meta name="msapplication-TileColor" content="#3372DF">

<link rel="shortcut icon" href="images/favicon.png">

<!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
<!--
    <link rel="canonical" href="http://www.example.com/">
    -->

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.2.1/material.deep_purple-pink.min.css">
<link rel="stylesheet" href="styles.css">
<style>
#view-source {
	position: fixed;
	display: block;
	right: 0;
	bottom: 0;
	margin-right: 40px;
	margin-bottom: 40px;
	z-index: 900;
}
</style>
</head>
<body
	class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		<header
			class="mdl-layout__header mdl-layout__header--scroll mdl-color--primary">
			<div class="mdl-layout--large-screen-only mdl-layout__header-row">
			</div>
			<div class="mdl-layout--large-screen-only mdl-layout__header-row">
				<h3>게시판입니다.</h3>
			</div>
			<div class="mdl-layout--large-screen-only mdl-layout__header-row">
			</div>
			<div
				class="mdl-layout__tab-bar mdl-js-ripple-effect mdl-color--primary-dark">
				<a href="../board/list?page=1" class="mdl-layout__tab is-active">게시판입니다!!</a>
				<button
					class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored mdl-shadow--4dp mdl-color--accent"
					id="add">
					<i class="material-icons" role="presentation">add</i> <span
						class="visuallyhidden">Add</span>
				</button>
			</div>
		</header>
		<main class="mdl-layout__content">
		<div class="mdl-layout__tab-panel is-active" id="overview">
			<section
				class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
				<header
					class="section__play-btn mdl-cell mdl-cell--3-col-desktop mdl-cell--2-col-tablet mdl-cell--4-col-phone mdl-color--teal-100 mdl-color-text--white">
					<i class="material-icons">play_circle_filled</i>
				</header>
			</section>


			<section class="section--footer mdl-color--white mdl-grid">
				<div
					class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
					<div
						class="section__circle-container__circle mdl-color--accent section__circle--big"></div>
				</div>
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


					<div class="page">
						<c:if test="${page.current ne page.firstPage}">
							<a href='list?page=${param.page-1}'>이전</a>
						</c:if>

						<c:forEach begin="${page.firstPage}" end="${page.lastPage}"
							var='idx'>
							<ul class='paging'>
								<li class='pageLi'><a href='${idx}'>${idx}</a></li>
							</ul>
						</c:forEach>

						<c:if test="${page.current ne page.lastPage}">
							<a href='list?page=${param.page+1}'>다음</a>
						</c:if>

						<form action="register">
							<button type="submit">글쓰기</button>
						</form>
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
				</div>
				<div
					class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
					<div
						class="section__circle-container__circle mdl-color--accent section__circle--big"></div>
				</div>

			</section>
		</div>
		<div class="mdl-layout__tab-panel" id="features">
			<section class="section--center mdl-grid mdl-grid--no-spacing">
				<div class="mdl-cell mdl-cell--12-col"></div>
			</section>
		</div>
		<footer class="mdl-mega-footer">
			<div class="mdl-mega-footer--middle-section">
				<div class="mdl-mega-footer--drop-down-section">
					<input class="mdl-mega-footer--heading-checkbox" type="checkbox"
						checked>
					<h1 class="mdl-mega-footer--heading">Features</h1>
					<ul class="mdl-mega-footer--link-list">
						<li><a href="#">About</a></li>
						<li><a href="#">Terms</a></li>
						<li><a href="#">Partners</a></li>
						<li><a href="#">Updates</a></li>
					</ul>
				</div>
				<div class="mdl-mega-footer--drop-down-section">
					<input class="mdl-mega-footer--heading-checkbox" type="checkbox"
						checked>
					<h1 class="mdl-mega-footer--heading">Details</h1>
					<ul class="mdl-mega-footer--link-list">
						<li><a href="#">Spec</a></li>
						<li><a href="#">Tools</a></li>
						<li><a href="#">Resources</a></li>
					</ul>
				</div>
				<div class="mdl-mega-footer--drop-down-section">
					<input class="mdl-mega-footer--heading-checkbox" type="checkbox"
						checked>
					<h1 class="mdl-mega-footer--heading">Technology</h1>
					<ul class="mdl-mega-footer--link-list">
						<li><a href="#">How it works</a></li>
						<li><a href="#">Patterns</a></li>
						<li><a href="#">Usage</a></li>
						<li><a href="#">Products</a></li>
						<li><a href="#">Contracts</a></li>
					</ul>
				</div>
				<div class="mdl-mega-footer--drop-down-section">
					<input class="mdl-mega-footer--heading-checkbox" type="checkbox"
						checked>
					<h1 class="mdl-mega-footer--heading">FAQ</h1>
					<ul class="mdl-mega-footer--link-list">
						<li><a href="#">Questions</a></li>
						<li><a href="#">Answers</a></li>
						<li><a href="#">Contact us</a></li>
					</ul>
				</div>
			</div>
			<div class="mdl-mega-footer--bottom-section">
				<div class="mdl-logo">More Information</div>
				<ul class="mdl-mega-footer--link-list">
					<li><a href="https://developers.google.com/web/starter-kit/">Web
							Starter Kit</a></li>
					<li><a href="#">Help</a></li>
					<li><a href="#">Privacy and Terms</a></li>
				</ul>
			</div>
		</footer> </main>
	</div>
</body>
</html>
