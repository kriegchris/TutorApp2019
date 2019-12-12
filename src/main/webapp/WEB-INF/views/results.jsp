<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Business List</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-hVpXlpdRmJ+uXGwD5W6HZMnR9ENcKVRn855pPbuI/mwPIEKAuKgTKgGksVGmlAvt"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="jumbotron">
		<h2>Meeting place options for your tutor session: </h2>
		</div>
			<table class="table">
				<tr>
					<th>Image</th>
					<th>Name</th>
					<th>Address</th>
					<th>Reserve</th>
				</tr>
				<c:forEach var="b" items="${businesses }">
					<tr>
						<td><img src="${b.image_url }" width="104px" height="104px"></td>
						<td><a href="${b.url }" target="_blank">${b.name }</a></td>
						<td>${b.location }</td>
						<td><a href="/confirm-session?meetingLocation=${b.location}&studentId=${studentId}&tutorId=${tutorId}" 
						class="btn btn-primary">Choose This Location</a> </td>
					</tr>
				</c:forEach>
			</table>
		
	</div>
</body>
</html>