<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="index.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>

	<%@ page import="com.dal.CustomerRegisterGateway"%>
	<jsp:useBean id="cr" class="com.bean.CustomerRegister"></jsp:useBean>
	<jsp:setProperty property="*" name="cr" />

	<%
		CustomerRegisterGateway cusRegGateway = new CustomerRegisterGateway();
		int i = cusRegGateway.saveCustomerRegister(cr);
		if (i > 0)
			response.sendRedirect("/POS/index.html");
		else
			response.sendRedirect("/POS/Register.html");
	%>

</body>
</html>