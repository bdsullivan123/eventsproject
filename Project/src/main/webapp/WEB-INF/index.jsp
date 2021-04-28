<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
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
		}
		
		#error {
			color: red;
		}
		
		#wrapper {
			display: flex;
			justify-content: space-between;
			width: 1000px;
			margin: auto;
			margin-top: 50px;
		}
		
		#state_dropdown {
			width: 100px;
		}
		
		.spacing {
			display: flex;
			justify-content: space-between;
			margin-top: 10px;
		}
		
		.smaller {
			width: 200px;
			margin-left: 5px;
			border-radius: 3px;
			color: black;
		}
		
		#register {
			border: solid 5px #2b2b2b;
			padding: 10px;
			border-radius: 10px;
		}
		
		#login {
			border: solid 5px #2b2b2b;
			padding: 10px;
			height: 220px;
			border-radius: 10px;
		}
		
		#register_button {
  			display: block;
  			margin-left: auto;
  			margin-right: auto;	
  			margin-top: 10px;	
  		}
  		
  		#login_button {
  			display: block;
  			margin-left: auto;
  			margin-right: auto;	
  			margin-top: 10px;	
  		}
  		
  		#states {
  			color: black;
  		}
	</style>
</head>
<body>
	<header>
		<img id="logo" src="/images/eventplannerlogo.png" alt="logo"/>
	</header>
	<div id="wrapper">
    <div id="register">
    <h1>Register</h1>
    
    <p><form:errors path="user.*"/></p>
    
    <form:form method="POST" action="/registration" modelAttribute="user">
        <div class="spacing">
            <form:label path="firstName">First Name:</form:label>
            <form:input class="form-control, smaller" type="text" path="firstName"/>
        </div>
        <div class="spacing">
            <form:label path="lastName">Last Name:</form:label>
            <form:input class="form-control, smaller" type="text" path="lastName"/>
        </div>
        <div class="spacing">
            <form:label path="location">Location:</form:label>
            <form:input class="form-control, smaller" type="text" path="location"/>
     	</div>
    	<div class="spacing">
    	 	<form:label path="state">State:</form:label>
            <form:errors path="state"/>
        	<form:select id="state_dropdown" class="form-control" path="state">
        		<c:forEach items="${states}" var="state">
					<form:option id="states" value="${state}"><c:out value="${state}"/></form:option>
        		</c:forEach>
        	</form:select>
       	</div>
        <div class="spacing">
            <form:label path="email">Email:</form:label>
            <form:input class="form-control, smaller" type="email" path="email"/>
        </div>
        <div class="spacing">
            <form:label path="password">Password:</form:label>
            <form:password class="form-control, smaller" path="password"/>
        </div>
        <div class="spacing">
            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
            <form:password class="form-control, smaller" path="passwordConfirmation"/>
        </div>
        <input id="register_button" class="btn btn-secondary" type="submit" value="Register"/>
    </form:form>
    </div>
    <div id="login">
    <h1>Login</h1>
    <p id="error"><c:out value="${error}" /></p>
    <form method="post" action="/login">
        <div class="spacing">
            <label for="email">Email:</label>
            <input class="form-control, smaller" type="text" id="email" name="email"/>
        </div>
        <div class="spacing">
            <label for="password">Password:</label>
            <input class="form-control, smaller" type="password" id="password" name="password"/>
        </div>
        <input id="login_button" class="btn btn-secondary" type="submit" value="Login"/>
    </form>  
    </div>
    </div>
</body>
</html>