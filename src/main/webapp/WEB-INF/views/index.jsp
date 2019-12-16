<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-hVpXlpdRmJ+uXGwD5W6HZMnR9ENcKVRn855pPbuI/mwPIEKAuKgTKgGksVGmlAvt"
	crossorigin="anonymous">
</head>
<body>

	<div class="container">
	<br>
	
		<div class="jumbotron">
			<h1>QuickTutor</h1>
		</div>
		<h3>Welcome to QuickTutor!</h3>
		<h3>The place to find nearby help, now.</h3>
		<br>
		<hr>
		<br>
			<h3>Tutor Login</h3>
			<form action="tutor-login">
				Email: <input type="email" name="email"> 
				${tutorError}
				Password: <input
					type="password" name="password"> <input type="submit"
					value="Login" class="btn btn-primary">
			</form>
			<br>
			<h5>Tutor Registration</h5>
			<form action="register-tutor">
				<input type="submit" value="Register Now" class="btn btn-primary">
			</form>
			<br>
			<hr>
			<br>
			<h3>Student Login</h3>
			<form action="student-login">
				Email: <input type="email" name="email">
			${studentError}
				Password: <input type="password" name="password">
				<input type="submit" value="Login" class="btn btn-primary">
			</form>
			<br>
			<h5>Student Registration</h5>
			<form action="register-student">
				<input type="submit" value="Register Now" class="btn btn-primary">
			</form>
		
	</div>

</body>
</html>