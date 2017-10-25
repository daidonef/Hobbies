<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Account</title>
</head>
<body>

<h1>Create Account</h1>

<p>${userNameExist }</p>

<div>
	<form name="createAccount" onsubmit="return validation()" action="hobbies" method="post">

		<br>Username: <input type="text" class="inside" name="userName"> 
		<br>First Name: <input type="text" class="inside" name="firstName"> 
		<br>Last Name: <input type="text" class="inside" name="lastName"> 
		<br>password: <input type="password" class="inside" name="password"> 
		<br>Email: <input type="text" class="inside" name="email"> 
		<br><br>
		
		<input type="submit" class="inside" value="Create Account">
	</form>
</div>

</body>
</html>