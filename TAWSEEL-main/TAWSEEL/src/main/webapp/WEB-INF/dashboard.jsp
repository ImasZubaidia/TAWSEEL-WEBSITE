<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
<!-- CSS link -->
<link rel="stylesheet" href="/css/dashbord.css" />
<body>


 <!-- header -->
       <nav>
          	<c:choose>
      		<c:when test="${currentUser!=null }">

          <ul>
           
           <li><a href="/admin">Admin Dashboard</a></li>
              <li> <a href="/about">About Us</a></li>
              <li> <a href="/logout">Logout</a></li>
             
          </ul>
          </c:when>
          <c:otherwise>
          
          <ul>
              <li> <a href="/about"> About Us</a></li>
              <li> <a href="/registration">Login/Sign Up</a></li>
             
          </ul>
          </c:otherwise>
          </c:choose>

       </nav>

			<div class="icons">
          		<img class="profile-icon" src="/images/logo-image.png" alt="logo">
             </div>
    

    <!-- main DASHBORD -->
	<div class="dashboard">
		<div class="dashboard-banner">
			<h1>
				<span>Satisfy</span><br> Your Hunger <br> With Our Service
			</h1>
		</div>
		<h3 class="dashboard-title">Recommended Restaurants</h3>
		<!-- Cities -->
		<form action="/">
			<select name="City" id="">
				<option value="0">Select All</option>
				<option value="Ramallah">Ramallah</option>
				<option value="Bethlehem">Bethlehem</option>
				<option value="Hebron">Hebron</option>
				<option value="Nablus">Nablus</option>
				<option value="">Jenin</option>
				<option value="">Tulkarem</option>
			</select> <select name="FoodType" id="">
				<option value="0">Select All</option>
				<option value="Traditional">Traditional Food</option>
				<option value="FastFood">Fast Food</option>
				<option value="Chinese">Chinese Food</option>
				<option value="pastries">pastries</option>
				<option value=""></option>
				<option value=""></option>
			</select>
			<button class="btn-danger ">search</button>
		</form>
	</div>

	<div class="dashboard-content">
        <c:forEach var="i" items="${Res}">
         <a href="/restaurant/${i.id}"  style="text-decoration: none;color:black;"> <div class="dashboard-card">
                <img class="card-image" src="${i.image}">
                <div class="card-detail">
                    <h4>${i.name}</h4>
                    <p> pizza, various sandwiches, pasta in various shapes and sauces and much more</p>
                </div>
            </div>
            </a>
            </c:forEach>
            </div>
           
</body>
</html>