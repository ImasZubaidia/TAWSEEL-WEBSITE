<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<link rel="stylesheet" href="css/order.css" />

<body>

	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- header -->

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

	<div class="container d-flex">
		<div class="col-lg-3 col-12"></div>
		<div class="col-lg-6 col-12">
			<h1>Dear Customer:</h1>
			<p>Please add delivery details:</p>
			<form:form action="/addAdress" method="post" modelAttribute="address">
				<div class="form-group">
					<form:label class="form-check-label" path="city">City: </form:label>
		
					<form:errors path="city" />
					<form:input class="form-control" type="text" path="city" />
				</div>

				<div class="form-group">
					<form:label class="form-check-label" path="street">Street: </form:label>
		
					<form:errors path="street" />
					<form:input class="form-control" type="text" path="street" />
				</div>

				<div class="form-group my-2">
					<form:label class="form-check-label" path="building">Building: </form:label>
					
					<form:errors path="building" />
					<form:input class="form-control" type="text" path="building" />
				</div>
				<div class="form-group my-2">
					<form:label class="form-check-label" path="floor">Floor: </form:label>
					<form:errors path="floor" />
					<form:input class="form-control" type="number" path="floor" />
				</div >
					<div class="form-group my-2">
					<form:label class="form-check-label" path="departmentNo">Appartment No.: </form:label>
					<form:errors path="departmentNo" />
					<form:input class="form-control" type="number" path="departmentNo" />
				</div >
				<div class="form-group my-3">
					<input  type="submit" class="btn btn-secondary" value="Add Location & Confirm Order!" />
				</div>
			</form:form>
		</div>
		<div class="col-lg-3 col-12"></div>
	</div>

</body>
</head>
</html>


</body>
</html>