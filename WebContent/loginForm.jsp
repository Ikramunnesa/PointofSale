<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="index.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Log In</title>
</head>
<body>
	<h1 style="text align: center">Log In</h1>
	<form action="/POS/login.jsp" method="post">
		<table>
			<tr>
				<td><label>Email :</label></td>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<td><label>Password :</label></td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td><label></label></td>
				<td><input type="submit" value="Log In" /></td>
			</tr>
		</table>
	</form>
</body>
</html>