<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css" rel="stylesheet" integrity="sha384-hVpXlpdRmJ+uXGwD5W6HZMnR9ENcKVRn855pPbuI/mwPIEKAuKgTKgGksVGmlAvt" crossorigin="anonymous">
</head>
<body>
	<h1>Please fill out your information below:</h1>
	<form action="register-s">
	Full Name: <input type="text" name="name">
	E-mail: <input type="email" name="email">
	Password: <input type="password" name="password">
	<input type="submit" class="btn btn-primary" value="Register">
	</form>
</body>
</html>