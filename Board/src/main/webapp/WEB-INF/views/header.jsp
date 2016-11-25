<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			<h3>게시판</h3>
		</div>
		<div class="mdl-layout--large-screen-only mdl-layout__header-row">
		</div>
		<div
			class="mdl-layout__tab-bar mdl-js-ripple-effect mdl-color--primary-dark">
			<a href="../board/list?page=1" class="mdl-layout__tab is-active">게시판입니다!!
			</a>
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
			<i class="material-icons">play_circle_filled</i> </header> </section>


			<section class="section--footer mdl-color--white mdl-grid">
			<div
				class="section__circle-container mdl-cell mdl-cell--2-col mdl-cell--1-col-phone">
				<div
					class="section__circle-container__circle mdl-color--accent section__circle--big"></div>
			</div>