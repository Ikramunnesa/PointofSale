<%@page import="java.util.List"%>
<%@page import="com.dal.CustomerGateway"%>
<%@ page import="com.bean.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="index.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="/css/bootstrap.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show All Customers</title>
</head>
<body>
	<%
		CustomerGateway customerGateway = new CustomerGateway();
		List<Customer> cusList = customerGateway.getAllCustomer();
	%>
	<form><br><br><br><br>
	<h3 style="margin: 0 auto;max-width:960px;text-align: center;">Customers</h3>
	<div style="margin: 0 auto;max-width:960px">
		<table class="table table-hover table-primary table-dark table-striped table-warning">
			<thead>
				<tr>
					<td>Name</td>
					<td>
					<td>Contact</td>
					<td>
					<td>Total Purchase</td>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < cusList.size(); i++) {
				%>
				<tr>
					<td><%=cusList.get(i).getName()%></td>
					<td>
					<td><%=cusList.get(i).getContact()%></td>
					<td>
					<td><%=cusList.get(i).getTotalPurchase()%></td>
					<%
						}
					%>
				
			</tbody>
		</table>
		</div>
	</form>
</body>
</html>