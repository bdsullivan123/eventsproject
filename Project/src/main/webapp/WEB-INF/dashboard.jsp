<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Events</title>
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
		
		#table {
			width: 80%;
			margin: auto;
			border: 1px solid lightgrey;
		}
		
		#createTask {
			margin-top: 10%;
			margin-left: 10%;
		}
		
		#logout_button {
			text-align: right;
			margin-right: 2%;
		}
		
		#wrapper {
			width: 970px;
			margin: auto;
			margin-top: 15px;
			margin-bottom: 20px;
		}
	</style>
</head>
<body>
	<header>
		<div id="logout_button">
			<a class="btn btn-secondary" href="/logout">Logout</a>
		</div>
		<img id="logo" src="/images/eventplannerlogo.png" alt="logo"/>
	</header>
	<div id="logout">
	</div>
	<div id="wrapper">
	<h1>Welcome, <c:out value="${user.firstName}"/>!</h1>
	<br>
	<h4>Here are some of the events in your state:</h4>
	<div id="table">
	<table class="table table-hover">
    	<thead>
        	<tr>
            	<th>Name</th>
            	<th>Date</th>
            	<th>Location</th>
            	<th>State</th>
            	<th>Host</th>
            	<th>Action</th>
        	</tr>
    	</thead>
    	<tbody>
        	<c:forEach items="${instate}" var="instate">
        	<tr>
            	<td><a class="btn btn-secondary" href="/events/${instate.id}"><c:out value="${instate.name}"/></a></td>
            	<td><c:out value="${instate.date}"/></td>
            	<td><c:out value="${instate.location}"/></td>
            	<td><c:out value="${instate.state}"/></td>
            	<td><c:out value="${instate.user.firstName}"/> <c:out value="${instate.user.lastName}"/></td>
				<c:choose>
                	<c:when test="${instate.user == user}">
                   		<td>Attending | <a href="/events/${instate.id}/edit">Edit</a> | <a href="events/${instate.id}/delete">Delete</a></td>
                   	</c:when>
                  	<c:otherwise>
                  		<c:set var="attending" value="${false}"/>
                		<c:forEach items="${instate.getJoinedUsers()}" var="attendee">
                   			<c:if test="${attendee == user}">
                       			<c:set var="attending" value="${true}"/>
                         	</c:if>
                   		</c:forEach>
                       	<c:choose>
                     		<c:when test="${attending == false}">
                        		<td><a href="/events/${instate.id}/join">Join</a></td>
                          	</c:when>
                        	<c:otherwise>
                          		<td>Attending | <a href="events/${instate.id}/cancel">Cancel</a></td>
                       		</c:otherwise>
                    	</c:choose>
                  	</c:otherwise>
           		</c:choose>  
        	</tr>
        	</c:forEach>
    	</tbody>
	</table>
	</div>
	<br>
	<h4>Here are some events in other states:</h4>
	<div id="table">
	<table class="table table-hover">
    	<thead>
        	<tr>
            	<th>Name</th>
            	<th>Date</th>
            	<th>Location</th>
            	<th>State</th>
            	<th>Host</th>
            	<th>Action</th>
        	</tr>
    	</thead>
    	<tbody>
        	<c:forEach items="${outofstate}" var="outofstate">
        	<tr>
            	<td><a class="btn btn-secondary" href="/events/${outofstate.id}"><c:out value="${outofstate.name}"/></a></td>
            	<td><c:out value="${outofstate.date}"/></td>
            	<td><c:out value="${outofstate.location}"/></td>
            	<td><c:out value="${outofstate.state}"/></td>
            	<td><c:out value="${outofstate.user.firstName}"/> <c:out value="${outofstate.user.lastName}"/></td>
				<c:choose>
                	<c:when test="${outofstate.user == user}">
                   		<td>Attending | <a href="/events/${outofstate.id}/edit">Edit</a> | <a href="events/${outofstate.id}/delete">Delete</a></td>
                   	</c:when>
                  	<c:otherwise>
                  		<c:set var="attending" value="${false}"/>
                		<c:forEach items="${outofstate.getJoinedUsers()}" var="attendee">
                   			<c:if test="${attendee == user}">
                       			<c:set var="attending" value="${true}"/>
                         	</c:if>
                   		</c:forEach>
                       	<c:choose>
                     		<c:when test="${attending == false}">
                        		<td><a href="/events/${outofstate.id}/join">Join</a></td>
                          	</c:when>
                        	<c:otherwise>
                          		<td>Attending | <a href="events/${outofstate.id}/cancel">Cancel</a></td>
                       		</c:otherwise>
                    	</c:choose>
                  	</c:otherwise>
           		</c:choose>  
        	</tr>
        	</c:forEach>
    	</tbody>
	</table>
	</div>
	<br>
	<a class="btn btn-secondary" href="/events/new">Create Event</a>
	</div>
</body>
</html>