<%@page import="com.bean.ViewSales"%>
<%@page import="java.util.List"%>
<%@page import="com.mysql.fabric.Response"%>
<%@page import="com.dal.SalesGateway"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="index.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="">
		<%-- <%
			int customerId = Integer.parseInt(request.getParameter("customerId"));
			String date = request.getParameter("date");
		%>
		 --%><%
			SalesGateway salesGateway = new SalesGateway();
			List<ViewSales> viewSales = salesGateway.viewSales();
		%>
		<div style="margin: 0 auto; max-width: 960px">
			<table>
				<thead>
					<tr>
						<td>Customer</td>
						<td>Contact</td>
						<td>Transaction Date</td>
						<td>Total Quantity</td>
						<td>Total Paid</td>
					</tr>
				</thead>
				<tbody>
				<% for(int i=0;i<viewSales.size();i++){
					
				 %>
				 <tr>
				<td><%=viewSales.get(i).getCustomerName() %></td>
				<td><%=viewSales.get(i).getContact() %></td>
				<td><%=viewSales.get(i).getTrunsactionDate() %></td>
				<td><%=viewSales.get(i).getTotalQty() %></td>
				<td><%=viewSales.get(i).getPaidAmount() %></td>
				 </tr><%} %>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>