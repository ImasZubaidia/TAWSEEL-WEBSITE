<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Page</title>
</head>
<body>
    <h1>Welcome to the Admin Page <c:out value="${currentUser.username}"></c:out></h1>
    
    <form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout!" />
    </form>
    <h1>Table 1: Restaurants Details</h1>
    <table>
    <thead>
    <tr>
    <td>Restaurant Name:</td>
    <td>Restaurant Location:</td>
   	<td>Menu Size</td>
    <td>Add Item to Restaurant's Menu</td>    
    <td>Cancel Contract</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="res" items="${allRest}">
    <tr>
    <td><c:out value="${res.name}"/></td>
    <td><c:out value="${res.address.city}"/></td>
    <td><c:out value="${res.item.size()}"/> Items</td>
    <td>NEEDS NEW PAGE!</td>
    <td>
    <form:form action="/resDelete/${res.id}" method="post">
    <input type="hidden" name="_method" value="delete">
    < value="${order.item}"></c:set>
    
   <c:forEach var="item" items="${order.item}">
    <h2><c:out value="${item.price}"/></h2>
    </c:forEach> 
    <td>NEEDS NEW PAGE!</td>
    <td>
    <form:form action="/orderDelete/${order.id}" method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Cancel Order" />
    </form:form>
    </td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
</body>
</html> --%>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> --%>
<!-- LOGO -->    
			<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
</head>
<!-- CSS link -->
<link rel="stylesheet" href="/css/admin.css" />
 <body>

 <!-- header -->
       <nav>
          <ul>
              <li><a href="/"> All Restaurants</a></li>
              <li><a href="/about"> About Us</a></li>
              <li> <a href="/logout"> Log out</a></li>
          </ul>
       </nav>
       
      
    <!-- LOGO -->    
			<div class="icons">
          		<img class="profile-icon" src="/images/logo-image.png" alt="logo">
             </div>
    
    
   
     <h1>Welcome to the Admin Page <c:out value="${currentUser.username}"></c:out></h1>
   
    <form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
         
    </form>
    <h1>Restaurants Details</h1>
    <table>
    <thead>
    <tr>
    <td>Restaurant Name:</td>
    <td>Restaurant Location:</td>
   	<td>Menu Size</td>   
    <td>Cancel Contract</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="res" items="${allRest}">
    <tr>
    <td><c:out value="${res.name}"/></td>
    <td><c:out value="${res.address.city}"/></td>
    <td><c:out value="${res.item.size()}"/> Items</td>
    <td>
    <form:form action="/resDelete/${res.id}" method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Cancel Contract" />
    </form:form>
    </td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
     <h1> Orders</h1>
    <table>
    <thead>
    <tr>
    <td>Order#:</td>
    <td>Deliver to:</td>
    <td>Total Items in order:</td>
    <td>View Order details! (Items, Price)</td>
    <td>Cancel Order</td> 
    </tr>
    </thead>
    <tbody>
    <c:forEach var="order" items="${allOrders}">
    <tr>
    <td><c:out value="${order.id}"/></td>
    <td>City: <c:out value="${order.address.city}"/>
    	Street: <c:out value="${order.address.street}"/>
    	FloorNo <c:out value="${order.address.floor}"/>
    	Apartment: <c:out value="${order.address.departmentNo}"/>
    </td>
    <td>Customer Name:<c:out value="${order.customer.username}"/>, Mobile <c:out value="${order.customer.number}"/></td>
    <td><c:out value="${order.item.size()}"/> Items</td>
    <c:set var="items" value="${order.item}"></c:set>
    
   <%-- <c:forEach var="item" items="${order.item}">
    <h2><c:out value="${item.price}"/></h2>
    </c:forEach> --%> 
    <td>
    <form:form action="/orderDelete/${order.id}" method="post">
    <input type="hidden" name="_method" value="delete">
    <input type="submit" value="Cancel Order" />
    </form:form>
    </td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
</body>
</html>