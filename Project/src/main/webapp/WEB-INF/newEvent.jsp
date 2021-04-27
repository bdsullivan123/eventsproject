<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>New Event</title>
	<style type="text/css">	
		* {
			margin: 0;
			padding: 0;
		}
		
		body { 
			width: 200px;
			margin: auto;
			margin-top: 50px;
		}
	</style>
</head>
<body>
	<h1>Create a new event!</h1>
	<form:form action="/newEvent" method="post" modelAttribute="event">
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
            <form:input class="form-control" type="text" path="location"/>
        	<form:select class="form-control" path="state">
        		<c:forEach items="${states}" var="state">
					<form:option value="${state}"><c:out value="${state}"/></form:option>
        		</c:forEach>
        	</form:select>
        </p>
		<form:hidden path="user" value="${user.id}"/>
    	<input class="btn btn-secondary" type="submit" value="Submit"/>
	</form:form>   
</body>
</html>