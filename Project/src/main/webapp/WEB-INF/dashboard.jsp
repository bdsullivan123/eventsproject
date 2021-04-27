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
		}
		
		body {
			width: 950px;
			margin: auto;
		}
		
		header {
			display: flex;
			justify-content: space-between;
			width: 80%;
			margin: auto;
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
		
		#logout {
			text-align: right;
		}
	</style>
</head>
<body>
	<div id="logout">
		<a href="/logout">Logout</a>
	</div>
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
            	<td><a href="/events/${instate.id}"><c:out value="${instate.name}"/></a></td>
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
            	<td><a href="/events/${outofstate.id}"><c:out value="${outofstate.name}"/></a></td>
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
	<a href="/events/new">Create Event</a>
</body>
</html>