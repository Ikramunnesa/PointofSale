<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
<h1 style="text align:center">Registration</h1>
<form action="/POS/RegisterForm.jsp" method="post">
<div>
<table>
<tr>
<td><label>Name :</label></td>
<td><input type="text" name="name" /></td>
</tr>
<tr>
<td><label>Email :</label></td>
<td><input type="text" name="email" /></td>
</tr>
<tr>
<td><label>Address :</label></td>
<td><input type="text" name="address" /></td>
</tr>
<tr>
<td><label>Contact :</label></td>
<td><input type="text" name="contact" /></td>
</tr>
<tr>
<td><label>Gender :</label></td>
<td><input type="radio" name="gender" value="M"/>Male</td>
<td><input type="radio" name="gender" value="F"/>Female</td>
</tr>
<tr>
<td><label>Password :</label></td>
<td><input type="password" name="password" /></td>
</tr>
<tr>
<td><label>Confirm Password :</label></td>
<td><input type="password" name="confirmPassword" /></td>
</tr>
<tr>
<td><label></label></td>
<td><input type="submit" value="Register" /></td>
</tr>
</table>
</div>
</form>
</body>
</html>