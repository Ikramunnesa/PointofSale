<%@page import="com.bean.Product"%>
<%@page import="com.dal.ProductGateway"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="index.jsp" %>
<%@ page import="com.bean.Customer" %>
<%@ page import="com.dal.CustomerGateway" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Products Form</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="/css/bootstrap-datepicker.min.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript" src="/js/jquery-3.1.1.js">
	
</script>
<script type="text/javascript" src="/js/bootstrap.js">
	
</script>
<script type="text/javascript" src="/js/bootstrap-datepicker.js">
	
</script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../css/total.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>


<script>
	$(document).ready(function() {
		$("#orderDate").datepicker({
			startDate : "today",
			autoclose : true,
			todayHighlight : true
		});
	});
</script>

</head>
<body>

<form action="/POS/order" method="post">
<br>
		<br>
		<br>
		<br>
		<br>
		<br><%
		CustomerGateway customerGateway = new CustomerGateway();
		List<Customer> customers = customerGateway.getAllCustomer();
		ProductGateway productGateway=new ProductGateway();
		List<Product> products=productGateway.getAllProduct();
		%>
		<br>
		<br>
		<div style="margin: 0 auto; max-width: 960px">
			
		<table class="table table-hover table-primary table-dark table-striped table-warning">
<tr>
<td><label>Customer Name :</label></td>
<td><select name="customerName"
						class="form-control">
							<%
								for (int i = 0; i < customers.size(); i++) {
							%>
							<option value="<%=customers.get(i).getName()%>"><%=customers.get(i).getName()%></option>
							<%
								}
							%>
					</select></td>
</tr>
<tr>
<td><label>Customer Contact :</label></td>
<td><input class="form-control" name="customerContact"/></td>
</tr>
<tr>
<td><label>Product Name :</label></td>
<td><select name="productName"
						class="form-control">
							<%
								for (int i = 0; i < products.size(); i++) {
							%>
							<option value="<%=products.get(i).getProductName()%>"><%=products.get(i).getProductName()%></option>
							<%
								}
							%>
					</select></td>
</tr>
<tr>
<td><label>Product Brand :</label></td>
<td><select name="productBrand"
						class="form-control">
							<%
								for (int i = 0; i < products.size(); i++) {
							%>
							<option value="<%=products.get(i).getBrand()%>"><%=products.get(i).getBrand()%></option>
							<%
								}
							%>
					</select></td>
</tr>
<tr>
<td><label>Product Model :</label></td>
<td><select name="productModel"
						class="form-control">
							<%
								for (int i = 0; i < products.size(); i++) {
							%>
							<option value="<%=products.get(i).getProductModel()%>"><%=products.get(i).getProductModel()%></option>
							<%
								}
							%>
					</select></td>
</tr>
<tr>
<td><label>Product Order Date :</label></td>
<td><input class="form-control" id="orderDate" name="orderDate"/></td>
</tr>
<tr>
<td><label>Total Quantity :</label></td>
<td><input class="form-control" name="totalQty"/></td>
</tr>
<tr>
<td><label>Paid Amount :</label></td>
<td><input class="form-control" name="paidAmount"/></td>
</tr>
<tr>
<td><label></label></td>
<td><input type="submit" value="Order" /></td>
</tr>
</table>
</div>
</form>
</body>
</html>