<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Access Denied</title>
</head>
<body>

	<h3>Access Denied to Customer Panel</h3>
	${msg }
	<br>
	<a href="${pageContext.request.contextPath }/admin-panel/welcome">Back</a>

</body>
</html>