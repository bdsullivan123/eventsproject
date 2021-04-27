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
		}
		
		#error {
			color: red;
		}
		
		#wrapper {
			display: flex;
			justify-content: space-evenly;
			width: 900px;
			margin: auto;
			margin-top: 50px;
		}
		
		#state_dropdown {
			width: 100px;
		}
	</style>
</head>
<body>
	<div id="wrapper">
    <div id="register">
    <h1>Register</h1>
    
    <p><form:errors path="user.*"/></p>
    
    <form:form method="POST" action="/registration" modelAttribute="user">
        <p>
            <form:label path="firstName">First Name:</form:label>
            <form:input class="form-control" type="text" path="firstName"/>
        </p>
        <p>
            <form:label path="lastName">Last Name:</form:label>
            <form:input class="form-control" type="text" path="lastName"/>
        </p>
        <p>
            <form:label path="location">Location:</form:label>
            <form:input class="form-control" type="text" path="location"/>
        	<form:select id="state_dropdown" class="form-control" path="state">
        		<c:forEach items="${states}" var="state">
					<form:option value="${state}"><c:out value="${state}"/></form:option>
        		</c:forEach>
        	</form:select>
        </p>
        <p>
            <form:label path="email">Email:</form:label>
            <form:input class="form-control" type="email" path="email"/>
        </p>
        <p>
            <form:label path="password">Password:</form:label>
            <form:password class="form-control" path="password"/>
        </p>
        <p>
            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
            <form:password class="form-control" path="passwordConfirmation"/>
        </p>
        <input class="btn btn-secondary" type="submit" value="Register"/>
    </form:form>
    </div>
    <div id="login">
    <h1>Login</h1>
    <p id="error"><c:out value="${error}" /></p>
    <form method="post" action="/login">
        <p>
            <label for="email">Email:</label>
            <input class="form-control" type="text" id="email" name="email"/>
        </p>
        <p>
            <label for="password">Password:</label>
            <input class="form-control" type="password" id="password" name="password"/>
        </p>
        <input class="btn btn-secondary" type="submit" value="Login"/>
    </form>  
    </div>
    </div>
</body>
</html>