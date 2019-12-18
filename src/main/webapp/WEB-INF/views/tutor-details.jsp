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
			<h1>Information about ${tutorName }</h1>
			<p>${subject }</p>
			<p>${bio }</p>
			<p>${rating }</p>

			<h2>${no }Reviews</h2>
			<table class="table">
				<tr>
					<th>Student</th>
					<th>Review</th>
				</tr>
				<c:forEach var="r" items="${reviews }">
					<tr>
						<td>${r.student.name }</td>
						<td>${r.review }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>