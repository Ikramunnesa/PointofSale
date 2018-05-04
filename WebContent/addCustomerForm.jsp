<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="index.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Customer Form</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
<br/><br/><br/><br/>
<form action="/POS/addCustomer.jsp" method="post">
<div style="margin: 0 auto; max-width: 600px">
<table>
<tr>
<td><label>Name :</label></td>
<td><input name="name" /></td>
</tr>
<tr>
<td><label>Contact :</label></td>
<td><input name="contact"/></td>
</tr>
<tr>
<td><label>Total Purchase :</label></td>
<td><input name="totalPurchase"/></td>
</tr>
<tr>
<td><label></label></td>
<td><input type="submit" value="Save" /></td>
</tr>
</table>
</div>
</form>
</body>
</html>