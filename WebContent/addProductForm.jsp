<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="index.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product Form</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
	<br />
	<br />
	<br />
	<br />
	<form action="/POS/addProduct.jsp" method="post">
		<div style="margin: 0 auto; max-width: 600px">
		<h2 style="text-align: center;">Add Product</h2>
			<table>
				<tr>
					<td><label>Product Name :</label></td>
					<td><input name="productName" /></td>
				</tr>
				<tr>
					<td><label>Brand :</label></td>
					<td><input name="brand" /></td>
				</tr>
				<tr>
					<td><label>Model :</label></td>
					<td><input name="productModel" /></td>
				</tr>
				<tr>
					<td><label>Quantity :</label></td>
					<td><input name="qty" /></td>
				</tr>
				<tr>
					<td><label>Unit :</label></td>
					<td>
						<!-- <input name="unit"/> -->
						<select name="unit">
						<option>Select Unit</option>
						<option value="pcs">Pcs.</option>
						<option value="kg">KG</option>
						<option value="m">Meter</option>
						
					</select>
					</td>
				</tr>
				<tr>
					<td><label>Price :</label></td>
					<td><input name="price" /></td>
				</tr>
				<tr>
					<td><label></label></td>
					<td><input type="submit" value="Save" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>