<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hobbies</title>
</head>
<body>

<h1>Hobbies</h1>

<p>

	<form name="addHobby" action="hobbies" method="post">
	
		<br>Hobby: <input type="text" class="inside" name="hobby"> 
		<br>Total time spent in hours: <input type="text" class="inside" name="timeSpent"> 
		<br>Date Started: <input type="date" class="inside" name="dateStarted"> 
		<br>Date Last Done: <input type="date" class="inside" name="lastDone"> 
		<br>Rating (0 to 10 with 0.5 intervals): <input type="number" class="inside" name="rating" 
			min="0" max="10" step="0.5"> 
		<br>Description: <input type="text" class="inside" name="description"> 
		<br><br>
		
		<input type="submit" class="inside" value="Add Hobby">
	
	</form>

</p>

<p>

	<table>
		<tr>
			<th>Hobby</th>
			<th>Time Spent(Hours)</th>
			<th>Date Started</th>
			<th>Last Done</th>
			<th>Rating</th>
			<th>Description</th>
		</tr>
		<c:forEach items="${hobbies }" var="hobby">
			<tr>
				<td>${hobby.hobby}</td>
				<td>${hobby.timeSpent}</td>
				<td>${hobby.dateStarted}</td>
				<td>${hobby.lastDone}</td>
				<td>${hobby.rating}</td>
				<td>${hobby.description}</td>
			</tr>
		</c:forEach>
	</table>

</p>

</body>
</html>