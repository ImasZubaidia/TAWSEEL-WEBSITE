<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<link rel="stylesheet" href="/css/register.css" />
<body>

	<!-- FIXME: -->
	<div class="area">
		<ul class="circles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>



	<div class="wrapper">
		<h2>Registration</h2>
		<form:form action="/registration" method="post"
			modelAttribute="customer">

			<p class="error">
				<form:errors path="username"></form:errors>
			</p>
			<p class="error">
				<form:errors path="email"></form:errors>
			</p>
			<p class="error">
				<form:errors path="number"></form:errors>
			</p>
			<p class="error">
				<form:errors path="password"></form:errors>
			</p>
			<p class="error">
				<form:errors path="passwordConfirmation"></form:errors>
			</p>

			<div class="input-box my-1">
				<form:input type="text" path="username"
					placeholder="Enter your name" required="required" />
			</div>
			<div class="input-box my-1">
				<form:input type="text" path="email" placeholder="Enter your email"
					required="required" />
			</div>
			<div class="input-box my-1">
				<form:input type="tel" path="number" placeholder="Enter your mobile"
					required="required" />
			</div>
			<div class="input-box my-1">
				<form:input type="password" path="password"
					placeholder="Create password" required="required" />
			</div>
			<div class="input-box my-1">
				<form:input type="password" path="passwordConfirmation"
					placeholder="Confirm password" required="required" />
			</div>
			<div class="policy">
				<input type="checkbox">
				<h3>I accept all terms & condition</h3>
			</div>
			<div class="input-box button">
				<input type="Submit" value="Register Now">
			</div>
			<div class="text">
				<h3>
					Already have an account? <a href="#">Login now</a>
				</h3>
			</div>
		</form:form>
	</div>
	<div class="card">
		<h1>
			<span class="tawseel">TAWSEEL</span>
			<div class="scroller">
				<span> ORDER<br /> FOOD<br /> ONLINE<br /> IN PALESTINE
				</span>
			</div>
		</h1>
		<p class="note">
			<a href="/">Home</a><br /> <a href="/about">About Us</a><br />
		</p>
	</div>
	<div class="wrapper">
		<h2>Login</h2>
		<form action="/login" method="post">

			<p class="error">
				<form:errors path="email"></form:errors>
			</p>
			<p class="error">
				<form:errors path="password"></form:errors>
			</p>

			<div class="input-box my-1">
				<input type="text" id="username" name="username"
					placeholder="Enter your username" required="required" />
			</div>
			<div class="input-box my-1">
				<input type="password" id="password" name="password"
					placeholder="Enter Password" required="required" />
			</div>
			<div class="input-box button">
				<input type="submit" value="Login!" />
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div>
				<a class="btn btn-primary" style="background-color: #55acee;"
					href="/oauth2/authorization/facebook" role="button"><i
					class="fab fa-facebook me-2" ></i> Login with Facebook</a> 
				<br />
				<a class="btn btn-primary"
					style="background-color: #55acee;"
					href="/oauth2/ahorization/github" role="button"><i
					class="fab fa-github me-2"></i> Login with Github</a>
			</div>
		</form>
	</div>
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>