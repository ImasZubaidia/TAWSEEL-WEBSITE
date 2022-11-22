<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<link rel="stylesheet" href="/css/rest.css" />
<body>

	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- header -->
	<input type="checkbox" id="cart">
	<label for="cart" class="label-cart"><span
		class="fas fa-shopping-cart"></span></label>
	<nav>
		<c:choose>
			<c:when test="${currentUser!=null }">

				<ul>
					<li><a href="/admin">Admin Dashboard</a></li>
					<li><a href="/">Home</a></li>
					<li><a href="/about">About Us</a></li>
					<li><a href="/logout">Logout</a></li>

				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<li><a href="/">Home</a></li>
					<li><a href="/about">About Us</a></li>
					<li><a href="/login">Login/Sign Up</a></li>

				</ul>
			</c:otherwise>
		</c:choose>
	</nav>
	<div class="icons">
		<img class="profile-icon" src="/images/logo-image.png" alt="logo">
	</div>
	<div class="dashboard-banner">
		<h1>
			<span>Satisfy</span><br> Your Hunger <br> With Our Service
		</h1>
	</div>

	<h3 class="dashboard-title">
		Menu of
		<c:out value="${restaurant.name}" />
		Restaurant
	</h3>
	<div class="container">
		<div class="row justify-content-left ">
			<div
				class="col-lg-5 border border-3 rounded p-5 mx-5">
				<div class="row d-flex justify-content-around">
				<div class="col-lg-6">				
					<div class="foodinfo">
						<c:forEach var="i" items="${restaurant.item}">
							<section class="menu-list">
								<img src="${i.image}">
								<p>${i.name}</p>
							</section>
						</c:forEach>
					</div>
				</div>
				<div class="col-lg-6">
						<div class="foodprice">
							<c:forEach var="i" items="${restaurant.item}">
								<section class="menu-list">
									<p>₪${i.price}</p>
									<form action="/neworder/${i.id}">
										<button class="button" name="idR" value="${restaurant.id}">+</button>
									</form>
								</section>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 border border-2 rounded-8 p-5 ">
				<!-- 	----- Order Menu ----- -->
				<h3>Order Details:</h3>
				<div class="order-address">
					<h4>Restaurant Name: ${restaurant.name}</h4>
				</div>

				<div class="order-wrapper">
					<c:forEach var="i" items="${order.item }">
						<div class="order-card">
							<img class="order-image" src="${i.image }">
							<div class="order-detail">
								<p>${i.name}</p>
								<i class="fas fa-times"></i> <input type="text" value="1">
							</div>
							<h4 class="order-price">₪${i.price}</h4>
						</div>
					</c:forEach>

				</div>
				<hr class="divider">
				<div class="order-total">
					<p>
						Total Price: <span>${sum}₪</span>
					</p>
					<p>
						Delivery Fee: <span>10₪</span>
					</p>

					<hr class="divider">
					<p>
						Total <span>₪${sum+10} </span>
					</p>
					<a href="/order"><button class="checkout btn">Checkout</button></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>