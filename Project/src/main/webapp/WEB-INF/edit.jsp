<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit Event</title>
	<style type="text/css">	
		* {
			margin: 0;
			padding: 0;
			color: #fbfbfb;
		}
		
		body {
            background-image: linear-gradient(to right, #3a3a3a, #5f5f5f);
		}
		
		header{
			background-color: #2b2b2b;
			padding-top: 10px;
			padding-bottom: 10px;
			margin: auto;
		}
		
		#logo {
			border-radius: 15px;
			width: 250px;
  			display: block;
  			margin-left: auto;
  			margin-right: auto;
  			margin-top: -35px;
		}
		
		#error {
			color: red;
		}
		
		#logout_button {
			text-align: right;
			margin-right: 2%;
		}
		
		#wrapper {
			width: 400px;
			margin: auto;
			margin-top: 15px;
			border: solid 5px #2b2b2b;
			padding: 15px;
			margin-bottom: 30px;
		}
		
		#formform {
			width: 300px;
			margin: auto;
		}
		
		#coloring {
			color: black;
		}
		
		#submit_button {
  			display: block;
  			margin-left: auto;
  			margin-right: auto;	
  			margin-top: 10px;	
  		}
	</style>
</head>
<body>
	<header>
		<div id="logout_button">
			<a class="btn btn-secondary" href="/events">Dashboard</a>
		</div>
		<img id="logo" src="/images/eventplannerlogo.png" alt="logo"/>
	</header>
	<div id="wrapper">
	<div id="formform">
	<h1><c:out value="${event.name}"/></h1>
	<br>
	<h3>Edit Event</h3>
	<form:form action="/updateEvent/${event.id}" method="post" modelAttribute="event">
    	<p>
        	<form:label class="form-label" path="name">Name</form:label>
        	<form:input class="form-control" path="name"/>
        	<form:errors path="name"/>
    	</p>
        <p>
            <form:label class="form-label" path="date">Date:</form:label>
            <form:errors path="date"/>
            <form:input type="date" class="form-control" path="date"/>
        </p>
        <p>
            <form:label path="location">Location:</form:label>
            <form:errors path="location"/>
            <form:input class="form-control" type="text" path="location"/>
        </p>
        <p>
            <form:label path="state">State:</form:label>
            <form:errors path="state"/>
        	<form:select class="form-control" path="state">
        		<c:forEach items="${states}" var="state">
					<form:option id="coloring" value="${state}"><c:out value="${state}"/></form:option>
        		</c:forEach>
        	</form:select>
        </p>
		<form:hidden path="user" value="${event.user.id}"/>
    	<input id="submit_button" class="btn btn-secondary" type="submit" value="Submit"/>
	</form:form>  
	</div> 
	</div>
</body>
</html>