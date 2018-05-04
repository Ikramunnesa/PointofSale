<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.dal.CustomerGateway"%>
<%@ page import="com.bean.Customer"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="index.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales Form</title>
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
		$("#trunsactionDate").datepicker({
			startDate : "today",
			autoclose : true,
			todayHighlight : true
		});
	});
</script>
</head>
<body>
	<%
		CustomerGateway customerGateway = new CustomerGateway();
		List<Customer> customers = customerGateway.getAllCustomer();
	%>
	<form action="/POS/sale" method="post">
		<br> <br> <br> <br> <br> <br> <br> <br>
		<div style="margin: 0 auto; max-width: 960px">

			<table
				class="table table-hover table-primary table-dark table-striped table-warning">
				<tr>
					<td><label>Customer Name :</label></td>
					<td>
						<!-- <input  /> --> <select name="customerId"
						class="form-control">
							<%
								for (int i = 0; i < customers.size(); i++) {
							%>
							<option value="<%=customers.get(i).getCustomerId()%>"><%=customers.get(i).getName()%></option>
							<%
								}
							%>
					</select>
					</td>
				</tr>
				<tr>
					<td><label>Total Quantity :</label></td>
					<td><input name="totalQty" class="form-control" /></td>
				</tr>
				<tr>
					<td><label>Transaction Date :</label></td>

					<td><input type="date" id="trunsactionDate" value="" class="form-control" />
						</td>
				</tr>
				<tr>
					<td><label>Amount Paid :</label></td>
					<td><input name="paidAmount" class="form-control" /></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><input type="submit" value="Save"
						class="form-control btn btn-success" /></td>
				</tr>
			</table>

		</div>
	</form>
</body>
</html>