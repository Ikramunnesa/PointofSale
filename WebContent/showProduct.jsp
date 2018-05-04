<%@page import="java.util.List"%>
<%@ page import="com.dal.ProductGateway"%>
<%@ page import="com.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="index.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show All Products</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
	<%
		ProductGateway proGateway = new ProductGateway();
		List<Product> proList = proGateway.getAllProduct();
	%>
	<form><br><br><br>
		<h3 style="margin: 0 auto;max-width:960px;text-align: center;">Products</h3>
	<div style="margin: 0 auto;max-width:960px">
		<table class="table table-hover table-primary table-dark table-striped table-warning">
			
			<thead>
				<tr>
					<td>Product Name</td>
					<td>
					<td>Brand</td>
					<td>
					<td>Product Model</td>
					<td>
					<td>Quantity</td>
					<td>
					<td>Unit</td>
					<td>
					<td>Price</td>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < proList.size(); i++) {
				%>
				<tr>
					<td><%=proList.get(i).getProductName()%></td>
					<td>
					<td><%=proList.get(i).getBrand()%></td>
					<td>
					<td><%=proList.get(i).getProductModel()%></td>
					<td>
					<td><%=proList.get(i).getQty()%></td>
					<td>
					<td><%=proList.get(i).getUnit()%></td>
					<td>
					<td><%=proList.get(i).getPrice()%></td>

					<%
						}
					%>
				
			</tbody>
		</table></div>
	</form>
</body>
</html>