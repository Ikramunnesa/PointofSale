<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Add</title>
</head>
<body>
<%@ page import="com.dal.ProductGateway" %>
<jsp:useBean id="p" class="com.bean.Product"></jsp:useBean>
<jsp:setProperty property="*" name="p" />
<%
ProductGateway proGateway=new ProductGateway();
int i=proGateway.saveProduct(p);
if(i>0)
	response.sendRedirect("/POS/showProduct.jsp");
else
	response.sendRedirect("/POS/addProductForm.jsp");
%>
</body>
</html>