<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-hVpXlpdRmJ+uXGwD5W6HZMnR9ENcKVRn855pPbuI/mwPIEKAuKgTKgGksVGmlAvt"
	crossorigin="anonymous">
</head>
<body>
<div class ="container">
<br>
		<div class="jumbotron">
	<h1>Please fill out your information below:</h1>
		</div>
	<form action="register-s">
		Full Name: <input type="text" name="name"> <br><br>
		E-mail: <input type="email" name="email"> <br><br>
		Password: <input type="password" name="password"> <br><br>
		<input type="submit" class="btn btn-primary" value="Register">
	</form>
</div>
</body>
</html>