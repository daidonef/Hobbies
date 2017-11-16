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
			<th>Add new Genre</th>
		</tr>
		<c:forEach items="${hobbies }" var="hobby" varStatus="status">
			<tr>
				<td>
				<button onclick="genres('${hobby.hobby}')">${hobby.hobby}</button>
				</td>
				<td>${hobby.timeSpent}</td>
				<td>${hobby.dateStarted}</td>
				<td>${hobby.lastDone}</td>
				<td>${hobby.rating}</td>
				<td>${hobby.description}</td>
				<td>
				
				<form name="addGenre" action="hobbies" method="post">
	
					<input type="hidden" value="${hobby.hobby }" name="hobbyG">
					<br>Genre: <input type="text" class="inside" name="genre"> 
					<br>Total time spent in hours: <input type="text" class="inside" name="timeSpentG"> 
					<br>Date Started: <input type="date" class="inside" name="dateStartedG"> 
					<br>Date Last Done: <input type="date" class="inside" name="lastDoneG"> 
					<br>Rating (0 to 10 with 0.5 intervals): <input type="number" class="inside" name="ratingG" 
						min="0" max="10" step="0.5"> 
					<br>Description: <input type="text" class="inside" name="descriptionG"> 
					<br><br>
		
					<input type="submit" class="inside" value="Add Genre">
	
				</form>
				
				</td>
			</tr>
			<tr id="${hobby.hobby }" style="display:none"><td colspan="7">
			<table>
				<c:set var="notBreaking" value="true"/> <%-- For breaking out of loop later --%>
				<c:forEach items="${genres }" var="genre">
					<c:if test="${hobby.hobby == genre.hobby && notBreaking}">
						<tr>
							<th>Genre</th>
							<th>Time Spent(Hours)</th>
							<th>Date Started</th>
							<th>Last Done</th>
							<th>Rating</th>
							<th>Description</th>
						</tr>
						<c:set var="notBreaking" value="false"/> <%-- breaks out of loop --%>
					</c:if>
				</c:forEach>
				<c:forEach items="${genres }" var="genre">
					<c:if test="${hobby.hobby == genre.hobby }">
						<tr>
							<td>${genre.genre }</td>
							<td>${genre.timeSpent }</td>
							<td>${genre.dateStarted }</td>
							<td>${genre.lastDone }</td>
							<td>${genre.rating }</td>
							<td>${genre.description }</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			</td></tr>
		</c:forEach>
	</table>

</p>

<script>

	function genres(hobbyG) {
		
		var x = document.getElementById(hobbyG);
		
	    if (x.style.display === "none") {
	        x.style.display = "table-row";
	    } else {
	        x.style.display = "none";
	    }
	}
	
	

</script>

</body>
</html>