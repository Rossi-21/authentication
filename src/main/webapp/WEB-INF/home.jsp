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
	<title>Home</title>
</head>
<body>
	<h1>You did it <c:out value="${user.userName}"/> </h1>
	<p><a href="/logout">logout</a></p>
</body>
</html>