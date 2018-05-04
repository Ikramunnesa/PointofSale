<%@page import="java.util.List"%>
<%@ page import="com.dal.OrderGateway"%>
<%@ page import="com.bean.Order"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Order List</title>
</head>
<body>
	<%
		OrderGateway orderGateway = new OrderGateway();
		List<Order> orderList = orderGateway.getAllOrder();
	%>
	<form>
		<h3 style="text-align: center;">Product Orders</h3>
		<div style="margin: 0 auto; max-width: 960px">
			<table
				class="table table-hover table-primary table-dark table-striped table-warning">

				<thead>
					<tr>
						<td>Customer Name</td>

						<td>Customer Contact</td>
						<td>Product</td>
						<td>Model</td>
						<td>Brand</td>
						<td>Date</td>
						<td>Total Quantity</td>
						<td>Paid Amount</td>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < orderList.size(); i++) {
					%>
					<tr>
						<td><%=orderList.get(i).getCustomerName()%></td>

						<td><%=orderList.get(i).getCustomerContact()%></td>

						<td><%=orderList.get(i).getProductName()%></td>
						<td><%=orderList.get(i).getProductModel()%></td>

						<td><%=orderList.get(i).getProductBrand()%></td>
						<%  SimpleDateFormat ft = 
						         new SimpleDateFormat ("dd-MMM-yy "); %>
						<td><%=ft.format(orderList.get(i).getOrderDate()) %></td>

						<td><%=orderList.get(i).getToalQty()%></td>

						<td><%=orderList.get(i).getPaidAmount()%></td>

						<%
							}
						%>
					
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>