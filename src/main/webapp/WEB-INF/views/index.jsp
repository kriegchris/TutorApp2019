<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-hVpXlpdRmJ+uXGwD5W6HZMnR9ENcKVRn855pPbuI/mwPIEKAuKgTKgGksVGmlAvt"
	crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<div class="jumbotron">
			<h1>Welcome. Please enter your login info</h1>

			<h3>Tutor Login</h3>
			<form action="tutor-login">
				Email: <input type="email" name="email"> Password: <input
					type="password" name="password"> <input type="submit"
					value="Login" class="btn btn-primary">
			</form>
			<h3>Tutor Registration</h3>
			<form action="register-tutor">
				<input type="submit" value="Register Now" class="btn btn-primary">
			</form>

			<h3>Student Login</h3>
			<form action="student-login">
				Email: <input type="email" name="email"> 
				Password: <input type="password" name="password">
				<input type="submit" value="Login" class="btn btn-primary">
			</form>
			<h3>Student Registration</h3>
			<form action="register-student">
				<input type="submit" value="Register Now" class="btn btn-primary">
			</form>
		</div>
	</div>

</body>
</html>