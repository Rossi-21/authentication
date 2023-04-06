<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" href="/css/main.css"/>
	<!-- For any Bootstrap that uses JS -->
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<title>Login</title>
</head>
<body >
	<div class="container-fluid">

		<div class="d-flex mx-auto mt-5" style="width:500px;">
			<div class="me-5">
				<h1>Register</h1>
				<form:form class="" action="/register" method="post" modelAttribute="newUser">
					<div>
						<form:label class="fw-bold mt-2 form-label" path='userName'>User Name:</form:label>
						<form:errors class="text-danger" path="userName"/>
			   			<form:input class="form-control" path='userName'/>
					</div>
					<div>
						<form:label class="fw-bold mt-2 form-label" path='email'>Email:</form:label>
						<form:errors class="text-danger" path="email"/>
						<form:input class="form-control" type='text' path='email'/>
					</div>
					<div>
						<form:label class="fw-bold mt-2 form-label" path='password'>Password:</form:label>
						<form:errors class="text-danger" path="password"/>
						<form:input class="form-control" path='password' type="password"/>	    		
					</div>			
			   		<div>
			   			<form:label class="fw-bold mt-2 form-label" path="confirm">Confirm Password:</form:label>
			   			<form:errors class="text-danger" path="confirm"/>
						<form:input class="form-control" path='confirm' type="password"/>	
			   		</div>
			   		<input class="mt-3 border border-dark rounded" type="submit" value="Submit"/>
	   			</form:form>
			</div>			
			<div class="ms-5">
				<h1>Login</h1>
				<form:form class="" action="/login" method="post" modelAttribute="newLogin">
					<div>
						<form:label class="fw-bold mt-2 form-label" path='email'>Email:</form:label>
						<form:errors class="text-danger" path="email"/>
			   			<form:input class="form-control" path='email'/>
					</div>
					<div>
						<form:label class="fw-bold mt-2 form-label" path='password'>Password:</form:label>
						<form:errors class="text-danger" path="password"/>
						<form:input class="form-control" path='password' type="password"/>	    		
					</div>			
			   		<input class="mt-3 border border-dark rounded" type="submit" value="Submit"/>
	   			</form:form>
			</div>
		</div>	
	</div>
</body>
</html>