<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Home!  
</h1>

<!-- Need to add google sign in API -->
<div>
	<form name="login" action="login" method="post">

		<input type="submit" class="inside" value="Login">
	</form>
	<form name="createAccount" action="createaccount" method="post">

		<input type="submit" class="inside" value="Create Account">
	</form>
</div>

</body>
</html>
