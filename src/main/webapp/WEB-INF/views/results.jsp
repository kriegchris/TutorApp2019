<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/cyborg/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-mtS696VnV9qeIoC8w/PrPoRzJ5gwydRVn0oQ9b+RJOPxE1Z1jXuuJcyeNxvNZhdx"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<table class="table">
				<tr>
					<th>Image</th>
					<th>Name</th>
					<th>Address</th>
					<th>Reserve</th>
				</tr>
				<c:forEach var="b" items="${businesses }">
					<tr>
						<td><img src="${b.image_url }" width="104px" height="142px"></td>
						<td>${b.name }</td>
						<td>${b.location }</td>
						<td>**create button**</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>