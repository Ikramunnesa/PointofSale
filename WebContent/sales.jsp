<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales</title>
</head>
<body>
<%@ page import="com.dal.SalesGateway" %>
<jsp:useBean id="s" class="com.bean.Sales"></jsp:useBean>
<jsp:setProperty property="*" name="s"/>
<%
SalesGateway salesGateway=new SalesGateway();
int i=salesGateway.saveSales(s);
if(i>0)
	response.sendRedirect("/POS/showSales.jsp");
else
	response.sendRedirect("/POS/salesForm.jsp");

%>
</body>
</html>