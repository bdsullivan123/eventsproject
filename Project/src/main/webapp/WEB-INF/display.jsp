<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title><c:out value="${event.name}"/></title>
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
		
		ul li {
		    list-style: none;
		}
		
		#table_id {
			width: 350px;
		}
		
		.divScroll{
			overflow:scroll;
			height:100px;
			width:250px;
		}
		
		#wrapper {
			display: flex;
			margin: auto;
			width: 900px;
			justify-content: space-evenly;
		}
		
		#info {
			width: 400px;
			margin-top: 15px;
			border: solid 5px #2b2b2b;
			border-radius: 10px;
			padding: 15px;
		}
		
		#messages {
			width: 300px;
			margin-top: 15px;
			border: solid 5px #2b2b2b;
			border-radius: 10px;
			padding: 15px;
		}
		
		#logout_button {
			text-align: right;
			margin-right: 2%;
		}
		
		#coloring {
			color: black;
		}
		
		#submit_button {
  			display: block;
  			margin-left: auto;
  			margin-right: auto;	
  			margin-top: 10px;	
  		}	</style>
</head>
<body>
	<header>
		<div id="logout_button">
			<a class="btn btn-secondary" href="/events">Dashboard</a>
		</div>
		<img id="logo" src="/images/eventplannerlogo.png" alt="logo"/>
	</header>
	<div id="wrapper">
	<div id="info">
	<h1><c:out value="${event.name}"/></h1>
	<div>
		<ul>
			<li>Host: <c:out value="${event.user.firstName}"/> <c:out value="${event.user.lastName}"/></li>
			<li>Date: <c:out value="${event.date}"/></li>
			<li>Location: <c:out value="${event.location}"/>, <c:out value="${event.state}"/></li>
			<li>People who are attending this event: <c:out value="${counter}"/></li>
		</ul>
	</div>
	<div id="table_id">
	<table class="table table-hover">
    	<thead>
        	<tr>
            	<th>Name</th>
            	<th>Location</th>
        	</tr>
    	</thead>
    	<tbody>
        	<c:forEach items="${attendees}" var="attendees">
        	<tr>
            	<td><c:out value="${attendees.firstName}"/> <c:out value="${attendees.lastName}"/></td>
            	<td><c:out value="${attendees.location}"/></td>
        	</tr>
        	</c:forEach>
    	</tbody>
	</table>
	</div>
	</div>
	<div id="messages">
		<h1>Message Wall</h1>
		<div class="divScroll">
			<p>
        		<c:forEach items="${messages}" var="messages">
            		<c:out value="${messages.user.firstName}"/> <c:out value="${messages.user.lastName}"/>: <c:out value="${messages.words}"/>
        			<p>---------------------------</p>
        		</c:forEach>
        	</p>
		</div>
		<form:form action="/messages" method="post" modelAttribute="message">
        	<form:label class="form-label" path="words">Add Comment:</form:label>
        	<br>
        	<form:textarea id="coloring" path="words" rows="2" cols="30"/>
        	<br>
        	<form:errors id="error" path="words"/>
			<form:hidden path="user" value="${user.id}"/>
			<form:hidden path="event" value="${event.id}"/>
			<br>
    		<input id="submit_button" class="btn btn-secondary" type="submit" value="Submit"/>
		</form:form>   
	</div>
	</div>
	</body>
</html>