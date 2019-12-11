<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Sessions</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/cyborg/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-mtS696VnV9qeIoC8w/PrPoRzJ5gwydRVn0oQ9b+RJOPxE1Z1jXuuJcyeNxvNZhdx"
	crossorigin="anonymous">
</head>
<body>
	<table class="table">
		<tr>
			<th>Location</th>
			<th>Duration</th>
			<th>Start Time</th>
			<th>Tutor Name</th>
		</tr>
		<c:forEach var="s" items="${sessions }"> 
		<tr>
			<td>${s.meetingLocation }</td>
			<td>${s.duration }</td>
			<td>${s.startTime }</td>
			<td>${s.tutor.name }</td>
		</tr>
		</c:forEach>
	</table>


</body>
</html>