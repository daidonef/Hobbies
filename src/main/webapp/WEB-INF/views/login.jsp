<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>

<h1>Login</h1>

<p>${wrongUserName }${wrongPassword }</p>

<div>
	<form name="hobbies" action="hobbies" method="post">

		<br>Username: <input type="text" class="inside" name="userName"> 
		<br>Password: <input type="password" class="inside" name="password"> <br>
		<br>
		
		<input type="submit" class="inside" value="Login">
	</form>
</div>

</body>
</html>