<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<link href="https://fonts.googleapis.com/css?family=Noto Sans"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<link rel="stylesheet" href="css/about.css" />
<body>
	<nav>
		<c:choose>
			<c:when test="${currentUser!=null}">

				<ul>
					<li style="color: white">${currentUser.username}</li>
					<li><a href="/">Home</a></li>
					<li><a href="/logout">Logout</a></li>

				</ul>
			</c:when>
			<c:otherwise>

				<ul>
					<li><a href="/">Home</a></li>
					<li><a href="/registration">Login/SignUp</a></li>

				</ul>
			</c:otherwise>
		</c:choose>
	</nav>


	<!-- LOGO -->
	<div class="icons">
		<img class="profile-icon" src="/images/logo-image.png"
			alt="logo">
	</div>
	<section class="contact">
		<div class="contactForm">
			<p>
				<span> Tawseel</span> is our food online ordering platform that
				makes getting great food from your favorite local restaurants as
				easy as requesting a ride. The Tawseel app connects you with a broad
				range of local restaurants and food, so you can order from the full
				menus of your local favorites whenever you want. The Tawseel app
				connects you with a broad range of local eateries, so you can have
				your favorite food delivered to your doorstep at the tap of a
				button.
			</p>
		</div>
		<div class="content">
			<div>
				<p>Contact Us</p>
			</div>
			<div class="media">
				<i class="fa fa-facebook-square" aria-hidden="true"></i> <i
					class="fa fa-whatsapp" aria-hidden="true"></i> <i
					class="fa fa-twitter" aria-hidden="true"></i> <i
					class="fa fa-linkedin" aria-hidden="true"></i>
			</div>
		</div>

	</section>
</body>
</html>