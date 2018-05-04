<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Add</title>
</head>
<body>
<%@ page import="com.dal.CustomerGateway" %>
<jsp:useBean id="c" class="com.bean.Customer"></jsp:useBean>
<jsp:setProperty property="*" name="c" />
<%
CustomerGateway customerGateway=new CustomerGateway();
int i=customerGateway.saveCustomer(c);
if(i>0)
	response.sendRedirect("/POS/showCustomer.jsp");
else
	response.sendRedirect("/POS/addCustomerForm.jsp");
%>
</body>
</html>