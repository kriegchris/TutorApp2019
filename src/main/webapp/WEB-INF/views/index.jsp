<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-hVpXlpdRmJ+uXGwD5W6HZMnR9ENcKVRn855pPbuI/mwPIEKAuKgTKgGksVGmlAvt"
	crossorigin="anonymous">
<link rel="stylesheet" href="/styles.css" type="text/css">
</head>
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: "Nunito Sans", -apple-system, BlinkMacSystemFont,
		"Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif,
		"Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";;
}
/* Fix the button on the left side of the page */
.open-btn {
	display: flex;
	justify-content: left;
}
/* Style and fix the button on the page */
.open-button {
	background-color: #1a1a1a;;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 0;
	cursor: pointer;
	opacity: 1;
	position: static;
}
/* Position the Popup form */
.login-popup {
	position: static;
	text-align: center;
	width: 100%;
}
/* Hide the Popup form */
.form-popup {
	display: none;
	position: static;
	left: 45%;
	top: 1%;
	transform: translate(-45%, 5%);
	border: 2px solid #666;
	z-index: 9;
}
/* Styles for the form container */
.form-container {
	max-width: 300px;
	padding: 2px;
	background-color: #fff;
}
/* Full-width for input fields */
.form-container input[type=text], .form-container input[type=name] {
	width: 100%;
	padding: 10px;
	border: none;
	background: #eee;
}

.form-container input[type=text], .form-container input[type=email] {
	width: 100%;
	padding: 10px;
	border: none;
	background: #eee;
}

.form-container input[type=text], .form-container input[type=latitude] {
	width: 100%;
	padding: 10px;
	border: none;
	background: #eee;
}

.form-container input[type=text], .form-container input[type=longitude]
	{
	width: 100%;
	padding: 10px;
	border: none;
	background: #eee;
}

.form-container input[type=text], .form-container input[type=subject] {
	width: 100%;
	padding: 10px;
	border: none;
	background: #eee;
}

.form-container input[type=text], .form-container input[type=bio] {
	width: 100%;
	padding: 10px;
	border: none;
	background: #eee;
}

.form-container input[type=text], .form-container input[type=password] {
	width: 100%;
	padding: 10px;
	border: none;
	background: #eee;
}
/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus
	{
	background-color: #ddd;
	outline: none;
}
/* Style submit/login button */
.form-container .btn {
	background-color: #1a1a1a;
	color: #fff;
	padding: 12px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
	margin-bottom: 10px;
	opacity: 1;
}
/* Style cancel button */
.form-container .cancel {
	background-color: #1a1a1a;
}
/* Hover effects for buttons */
.form-container .btn:hover, .open-button:hover {
	opacity: 1;
}
</style>
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
		<div>
			<div class="open-btn primary">
				<h4 class="index-word-text"> TUTOR </h4><button class="open-button" onclick="openForm1()" 
				style="margin:5px;">SIGN IN</button> ${tutorError}${tutorPasswordError }
				<div class="form-popup" id="popupForm1">
					<form action="tutor-login" class="form-container">
						<input type="email" id="email" placeholder="Email" name="email"
							required> <label for="Password"> <strong>Password</strong></label>
						<input type="password" id="password" placeholder="Password"
							name="password" required>
						<button type="submit" class="btn btn-primary">Sign in</button>
						<button type="button" class="btn cancel" onclick="closeForm1()">Close</button>
					</form>
				</div>
			</div>
		</div>
		<div>
			<div class="open-btn primary">
				<button class="open-button" onclick="openForm2()" style="margin:5px;">REGISTER</button>
				<div class="form-popup" id="popupForm2">
					<form action="register-t" class="form-container">
						<label for="Full Name">Full Name</label> <input
							type="text" id="name" placeholder="Full Name" name="name"
							required> <label for="email">Email
						</label> <input type="email" id="email" placeholder="Email" name="email"
							required> <label for="Password">Password</label>
						<input type="password" id="password" placeholder="Password"
							name="password" required> <label for="Latitude">Latitude</label>
						<input type="latitude" id="latitude" placeholder="Latitude"
							name="latitude" required> <label for="Longitude">Longitude</label>
						<input type="longitude" id="longitude" placeholder="Longitude"
							name="Longitude" required> <label for="Subject">Subject</label>
						<input type="text" id="subject" placeholder="Subject"
							name="subject" required> <label for="subject"> Bio</label>
						<input type="text" id="Bio" placeholder="Bio" name="Bio" required>
						<button type="submit" class="btn btn-primary">Register</button>
						<button type="button" class="btn cancel" onclick="closeForm2()">Close</button>
					</form>
				</div>
			</div>
		</div>
		<br> <br>
		<div>
			<div class="open-btn primary">
			<h4 class="student-word-text">STUDENT </h4><button class="open-button" onclick="openForm3()" 
			style="margin:5px;">SIGN IN</button> ${studentError}${studentPasswordError }
				<div class="form-popup" id="popupForm3">
					<form action="student-login" class="form-container">
						<input type="email" id="email" placeholder="Email" name="email"
							required> <label for="Password"> <strong>Password</strong></label>
						<input type="password" id="password" placeholder="Password"
							name="password" required>
						<button type="submit" class="btn btn-primary">Sign in</button>
						<button type="button" class="btn cancel" onclick="closeForm3()">Close</button>
					</form>
				</div>
			</div>
		</div>
		<div>
			<div class="open-btn primary">
				<button class="open-button" onclick="openForm4()" style="margin:5px;">REGISTER</button>
				<div class="register-popup">
					<div class="form-popup" id="popupForm4">
						<form action="register-s" class="form-container">
							<label for="Full Name"> <strong>Full Name</strong></label> <input
								type="text" id="name" placeholder="Full Name" name="name"
								required> <label for="email"> <strong>Email</strong></label>
							<input type="email" id="email" placeholder="Email" name="email"
								required> <label for="Password"> <strong>Password</strong></label>
							<input type="password" id="password" placeholder="Password"
								name="password" required>
							<button type="submit" class="btn btn-primary">Register</button>
							<button type="button" class="btn cancel" onclick="closeForm4()">Close</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<script>
		function openForm1() {
			document.getElementById("popupForm1").style.display = "block";
		}

		function closeForm1() {
			document.getElementById("popupForm1").style.display = "none";
		}
		window.onclick = function(event) {
			var modal = document.getElementById('popupForm1');
			if (event.target == modal) {
				closeForm1();
			}
		}
		function openForm2() {
			document.getElementById("popupForm2").style.display = "block";
		}

		function closeForm2() {
			document.getElementById("popupForm2").style.display = "none";
		}
		window.onclick = function(event) {
			var modal = document.getElementById('popupForm2');
			if (event.target == modal) {
				closeForm2();
			}
		}
		function openForm3() {
			document.getElementById("popupForm3").style.display = "block";
		}

		function closeForm3() {
			document.getElementById("popupForm3").style.display = "none";
		}
		window.onclick = function(event) {
			var modal = document.getElementById('popupForm3');
			if (event.target == modal) {
				closeForm3();
			}
		}
		function openForm4() {
			document.getElementById("popupForm4").style.display = "block";
		}

		function closeForm4() {
			document.getElementById("popupForm4").style.display = "none";
		}
		window.onclick = function(event) {
			var modal = document.getElementById('popupForm4');
			if (event.target == modal) {
				closeForm4();
			}
		}
	</script>
</section>
</body>
</html>