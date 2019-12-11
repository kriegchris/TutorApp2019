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
	crossorigin="anonymous"></head>
<body>
	<form action="/confirmation">
	<input name="tutorId" type="hidden" value="${tutor.id}">
	<input name="studentId" type="hidden" value="${student.id}">
	<input name="meetingLocation" type="hidden" value="${meetingLocation}">
	Duration: <input name="duration" type="number" placeholder="minutes">
	Start Time: <input type="time" name="startTime">
	<input name="submit" type="submit" value="Reserve Session">
	</form>


</body>
</html>