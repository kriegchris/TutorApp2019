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
<link rel="stylesheet" href="/styles.css" type="text/css">
</head>
<body>

	<section class="index">
		<header id="header">
			<!-- <nav>
				<a id="menu-icon">&#8801;</a>
			</nav> -->
		</header>

		<header class="index-header">
			<h1 class="index-title">READY TUTOR ONE</h1>
			<br>
			<h2 class="index-subtitle">The place to find nearby help, now.</h2>
		</header>
		
		<footer class="index-footer">
			<form action="student-login">
				STUDENT: <a class="button button-primary" href="#">SIGN-IN</a> <a
					class="button" href="#">REGISTER</a>
			</form>
			<br>
			<br>
			<form action="tutor-login">
				TUTOR: <a class="button button-primary" href="#">SIGN-IN</a> <a
					class="button" href="/register-tutor">REGISTER</a>
			</form>
		</footer>
	</section>

	<%-- 	<h3>Tutor Login</h3>
		<form action="tutor-login">
			Email: <input type="email" name="email"> ${tutorError}
			Password: <input type="password" name="password"> <input
				type="submit" value="Login" class="btn btn-primary">
		</form>
		<br>
		<h5>Tutor Registration</h5>
		<form action="register-tutor">
			<input type="submit" value="Register Now" class="btn btn-primary">
		</form>
		
		<h3>Student Login</h3>
		<form action="student-login">
			Email: <input type="email" name="email"> ${studentError}
			Password: <input type="password" name="password"> <input
				type="submit" value="Login" class="btn btn-primary">
		</form>
		<br>
		<h5>Student Registration</h5>
		<form action="register-student">
			<input type="submit" value="Register Now" class="btn btn-primary">
		</form> --%>

</body>
</html>