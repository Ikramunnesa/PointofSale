<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Products</title>
</head>
<body>
<%@ page import="com.dal.OrderGateway" %>
<jsp:useBean id="o" class="com.bean.Order"></jsp:useBean>
<jsp:setProperty property="*" name="o" />
<%
OrderGateway orderGateway=new OrderGateway();
int i=orderGateway.saveOrder(o);
if(i>0)
	response.sendRedirect("/POS/index.jsp");
else
	response.sendRedirect("/POS/orderForm.jsp");
%>
</body>
</html>