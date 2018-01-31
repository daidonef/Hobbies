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

	<!-- To Add Hobby -->
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
	<!-- The main table which displays the hobbies -->
	<table>
		<!-- Headings for main table -->
		<tr>
			<th>Hobby</th>
			<th>Time Spent(Hours)</th>
			<th>Date Started</th>
			<th>Last Done</th>
			<th>Rating</th>
			<th>Description</th>
			<th>Add new Genre</th>
		</tr>
		<!-- Displays hobbies for the main table for each hobby for that account -->
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
				
				<c:set var="breakFormLoop" value="true"/> <%-- For breaking out of loop later --%>
				
				<!-- This choose statement is to make sure there is not an array out of bounds -->
				<c:choose>
				
				<c:when test="${genres.size() >= items.size() }">
				<c:forEach items="${genres }" var="genreTestForm" varStatus="status">
			
				<c:if test="${breakFormLoop }">
				
				<c:choose>
				
				<c:when test="${hobby.hobby == genreTestForm.hobby}">
				<!-- Need if statement to display right buttons at the right time -->
				<!-- Button for the form to add genre for that hobby -->
				<button onclick="addform('${hobby.hobby}AG')">Genre Form</button>
				<form id="${hobby.hobby}AG" style="display:none" name="addGenre" action="hobbies" method="post">
	
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
				
				<c:set var="breakFormLoop" value="false"/> <%-- breaks out of loop --%>
				
				</c:when>
				
				<c:when test="${status.index < items.size() && hobby.hobby == items[status.index].hobby }">
				
				<!-- Button for the form to add item for that hobby -->
				<button onclick="addform('${hobby.hobby}AI')">Item Form</button>
				<form id="${hobby.hobby}AI" style="display:none" name="addItem" action="hobbies" method="post">
	
					<input type="hidden" value="${hobby.hobby }" name="hobbyI">
					<br>Item: <input type="text" class="inside" name="item"> 
					<br>Total time spent in hours: <input type="text" class="inside" name="timeSpentI"> 
					<br>Date Started: <input type="date" class="inside" name="dateStartedI"> 
					<br>Date Last Done: <input type="date" class="inside" name="lastDoneI"> 
					<br>Rating (0 to 10 with 0.5 intervals): <input type="number" class="inside" name="ratingI" 
						min="0" max="10" step="0.5"> 
					<br>Description: <input type="text" class="inside" name="descriptionI"> 
					<br><br>
		
					<input type="submit" class="inside" value="Add Item">
	
				</form>
				
				<c:set var="breakFormLoop" value="false"/> <%-- breaks out of loop --%>
				
				</c:when>
				
				<c:otherwise>
				
				<button onclick="addform('${hobby.hobby}AG')">Genre Form</button>
				<form id="${hobby.hobby}AG" style="display:none" name="addGenre" action="hobbies" method="post">
	
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
				
				<!-- Button for the form to add item for that hobby -->
				<button onclick="addform('${hobby.hobby}AI')">Item Form</button>
				<form id="${hobby.hobby}AI" style="display:none" name="addItem" action="hobbies" method="post">
	
					<input type="hidden" value="${hobby.hobby }" name="hobbyI">
					<br>Item: <input type="text" class="inside" name="item"> 
					<br>Total time spent in hours: <input type="text" class="inside" name="timeSpentI"> 
					<br>Date Started: <input type="date" class="inside" name="dateStartedI"> 
					<br>Date Last Done: <input type="date" class="inside" name="lastDoneI"> 
					<br>Rating (0 to 10 with 0.5 intervals): <input type="number" class="inside" name="ratingI" 
						min="0" max="10" step="0.5"> 
					<br>Description: <input type="text" class="inside" name="descriptionI"> 
					<br><br>
		
					<input type="submit" class="inside" value="Add Item">
	
				</form>
				
				</c:otherwise>
				
				</c:choose>
				</c:if>
				</c:forEach>
				</c:when>
				
				<c:when test="${genres.size() < items.size() }">
				<c:forEach items="${items }" var="itemsTestForm" varStatus="status">
			
				<c:if test="${breakFormLoop }">
				
				<c:choose>
				
				<c:when test="${status.index < genres.size() && hobby.hobby == genres[status.index].hobby}">
				<!-- Need if statement to display right buttons at the right time -->
				<!-- Button for the form to add genre for that hobby -->
				<button onclick="addform('${hobby.hobby}AG')">Genre Form</button>
				<form id="${hobby.hobby}AG" style="display:none" name="addGenre" action="hobbies" method="post">
	
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
				
				<c:set var="breakFormLoop" value="false"/> <%-- breaks out of loop --%>
				
				</c:when>
				
				<c:when test="${hobby.hobby == items.hobby }">
				
				<!-- Button for the form to add item for that hobby -->
				<button onclick="addform('${hobby.hobby}AI')">Item Form</button>
				<form id="${hobby.hobby}AI" style="display:none" name="addItem" action="hobbies" method="post">
	
					<input type="hidden" value="${hobby.hobby }" name="hobbyI">
					<br>Item: <input type="text" class="inside" name="item"> 
					<br>Total time spent in hours: <input type="text" class="inside" name="timeSpentI"> 
					<br>Date Started: <input type="date" class="inside" name="dateStartedI"> 
					<br>Date Last Done: <input type="date" class="inside" name="lastDoneI"> 
					<br>Rating (0 to 10 with 0.5 intervals): <input type="number" class="inside" name="ratingI" 
						min="0" max="10" step="0.5"> 
					<br>Description: <input type="text" class="inside" name="descriptionI"> 
					<br><br>
		
					<input type="submit" class="inside" value="Add Item">
	
				</form>
				
				<c:set var="breakFormLoop" value="false"/> <%-- breaks out of loop --%>
				
				</c:when>
				
				<c:otherwise>
				
				<button onclick="addform('${hobby.hobby}AG')">Genre Form</button>
				<form id="${hobby.hobby}AG" style="display:none" name="addGenre" action="hobbies" method="post">
	
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
				
				<!-- Button for the form to add item for that hobby -->
				<button onclick="addform('${hobby.hobby}AI')">Item Form</button>
				<form id="${hobby.hobby}AI" style="display:none" name="addItem" action="hobbies" method="post">
	
					<input type="hidden" value="${hobby.hobby }" name="hobbyI">
					<br>Item: <input type="text" class="inside" name="item"> 
					<br>Total time spent in hours: <input type="text" class="inside" name="timeSpentI"> 
					<br>Date Started: <input type="date" class="inside" name="dateStartedI"> 
					<br>Date Last Done: <input type="date" class="inside" name="lastDoneI"> 
					<br>Rating (0 to 10 with 0.5 intervals): <input type="number" class="inside" name="ratingI" 
						min="0" max="10" step="0.5"> 
					<br>Description: <input type="text" class="inside" name="descriptionI"> 
					<br><br>
		
					<input type="submit" class="inside" value="Add Item">
	
				</form>
				
				</c:otherwise>
				
				</c:choose>
				</c:if>
				</c:forEach>
				</c:when>
				
				</c:choose>
				
				</td>
			</tr>
			
			<!-- For when there is a genre for that hobby -->
			<c:set var="breakChooseLoop" value="true"/> <%-- For breaking out of loop later --%>
			
			<!-- This choose statement is to make sure there is not an array out of bounds -->
			<c:choose>
			
			<c:when test="${genres.size() >= items.size() }">
			<c:forEach items="${genres }" var="genreTest" varStatus="status">
			
			<c:if test="${breakChooseLoop }">
			
			<!-- Need way to go to items instead of genres if there is no genre for that hobby -->
			<c:choose>
			
			<c:when test="${hobby.hobby == genreTest.hobby }">
			
			<tr id="${hobby.hobby }" style="display:none"><td colspan="7">
			<!-- Table for genre under hobby -->
			<table>
				<c:set var="notBreaking" value="true"/> <%-- For breaking out of loop later --%>
				<c:forEach items="${genres }" var="genre">
					<c:if test="${hobby.hobby == genre.hobby && notBreaking}">
						<!-- Heading for genre under hobby -->
						<tr>
							<th>Genre</th>
							<th>Time Spent(Hours)</th>
							<th>Date Started</th>
							<th>Last Done</th>
							<th>Rating</th>
							<th>Description</th>
							<th>Add new Item</th>
						</tr>
						<c:set var="notBreaking" value="false"/> <%-- breaks out of loop --%>
					</c:if>
				</c:forEach>
				<c:forEach items="${genres }" var="genre">
					<c:if test="${hobby.hobby == genre.hobby }">
						<!-- Genres information under hobby -->
						<tr>
							<!-- Button for getting to items under genre -->
							<td>
								<button onclick="genres('${hobby.hobby}I')">${genre.genre}</button>
							</td>
							<td>${genre.timeSpent }</td>
							<td>${genre.dateStarted }</td>
							<td>${genre.lastDone }</td>
							<td>${genre.rating }</td>
							<td>${genre.description }</td>
							<td>
							
								<!-- Button for the form to add item for that genre -->
								<button onclick="addform('${hobby.hobby}AIG')">Item Form</button>
								<form id="${hobby.hobby}AIG" style="display:none" name="addItem" action="hobbies" method="post">
	
									<input type="hidden" value="${hobby.hobby }" name="hobbyI">
									<br>Item: <input type="text" class="inside" name="item">
									<input type="hidden" value="${genre.genre }" name="genreI"> 
									<br>Total time spent in hours: <input type="text" class="inside" name="timeSpentI"> 
									<br>Date Started: <input type="date" class="inside" name="dateStartedI"> 
									<br>Date Last Done: <input type="date" class="inside" name="lastDoneI"> 
									<br>Rating (0 to 10 with 0.5 intervals): <input type="number" class="inside" name="ratingI" 
										min="0" max="10" step="0.5"> 
									<br>Description: <input type="text" class="inside" name="descriptionI"> 
									<br><br>
		
									<input type="submit" class="inside" value="Add Item">
	
								</form>
							
							</td>
						</tr>
						
						<!-- Need way to bring out items if there is no genre, and with genre -->
						<tr id="${hobby.hobby }I" style="display:none"><td colspan="7">
						<!-- Table for items under genre -->
						<table>
							<c:set var="notBreaking" value="true"/> <%-- For breaking out of loop later --%>
							<c:forEach items="${items }" var="item">
								<c:if test="${hobby.hobby == item.hobby && notBreaking}">
									<!-- Heading to item under genre -->
									<tr>
										<th>Item</th>
										<th>Time Spent(Hours)</th>
										<th>Date Started</th>
										<th>Last Done</th>
										<th>Rating</th>
										<th>Description</th>
									</tr>
									<c:set var="notBreaking" value="false"/> <%-- breaks out of loop --%>
								</c:if>
							</c:forEach>
							<c:forEach items="${items }" var="item">
								<c:if test="${hobby.hobby == item.hobby }">
									<!-- Items information under genre -->
									<tr>
										<td>${item.item }</td>
										<td>${item.timeSpent }</td>
										<td>${item.dateStarted }</td>
										<td>${item.lastDone }</td>
										<td>${item.rating }</td>
										<td>${item.description }</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
						</td></tr>
						
					</c:if>
				</c:forEach>
			</table>
			</td></tr>
			
			<c:set var="breakChooseLoop" value="false"/> <%-- breaks out of loop --%>
			</c:when>
			
			<c:when test="${status.index < items.size() && hobby.hobby == items[status.index].hobby }">
			
			<tr id="${hobby.hobby }" style="display:none"><td colspan="7">
			<!-- Table for Items under Hobby -->
			<table>
			
				<c:set var="notBreaking" value="true"/> <%-- For breaking out of loop later --%>
				<c:forEach items="${items }" var="item">
					<c:if test="${hobby.hobby == item.hobby && notBreaking}">
						<!-- Heading to item under hobby -->
						<tr>
							<th>Item</th>
							<th>Time Spent(Hours)</th>
							<th>Date Started</th>
							<th>Last Done</th>
							<th>Rating</th>
							<th>Description</th>
						</tr>
						<c:set var="notBreaking" value="false"/> <%-- breaks out of loop --%>
					</c:if>
				</c:forEach>
				<c:forEach items="${items }" var="item">
					<c:if test="${hobby.hobby == item.hobby }">
						<!-- Items information under hobby -->
						<tr>
							<td>${item.item }</td>
							<td>${item.timeSpent }</td>
							<td>${item.dateStarted }</td>
							<td>${item.lastDone }</td>
							<td>${item.rating }</td>
							<td>${item.description }</td>
							<td>
				
								<!-- Button for the form to add item for that hobby -->
								<button onclick="addform('${hobby.hobby}AIG')">Item Form</button>
								<form id="${hobby.hobby}AI" style="display:none" name="addItem" action="hobbies" method="post">
	
									<input type="hidden" value="${hobby.hobby }" name="hobbyI">
									<br>Item: <input type="text" class="inside" name=item> 
									<br>Total time spent in hours: <input type="text" class="inside" name="timeSpentI"> 
									<br>Date Started: <input type="date" class="inside" name="dateStartedI"> 
									<br>Date Last Done: <input type="date" class="inside" name="lastDoneI"> 
									<br>Rating (0 to 10 with 0.5 intervals): <input type="number" class="inside" name="ratingI" 
										min="0" max="10" step="0.5"> 
									<br>Description: <input type="text" class="inside" name="descriptionI"> 
									<br><br>
		
									<input type="submit" class="inside" value="Add Item">
	
								</form>
				
							</td>
						</tr>
					</c:if>
				</c:forEach>
			
			</table>
			</td></tr>
			
			<c:set var="breakChooseLoop" value="false"/> <%-- breaks out of loop --%>
			</c:when>
			
			<c:otherwise>
			
			</c:otherwise>
			
			</c:choose>
			</c:if>
			</c:forEach>
			</c:when>
			
			<c:when test="${genres.size() < items.size() }">
			<c:forEach items="${items }" var="itemsTest" varStatus="status">
			
			<c:if test="${breakChooseLoop }">
			
			<!-- Need way to go to items instead of genres if there is no genre for that hobby -->
			<c:choose>
			
			<c:when test="${status.index < genres.size() && hobby.hobby == genres[status.index].hobby }">
			
			<tr id="${hobby.hobby }" style="display:none"><td colspan="7">
			<!-- Table for genre under hobby -->
			<table>
				<c:set var="notBreaking" value="true"/> <%-- For breaking out of loop later --%>
				<c:forEach items="${genres }" var="genre">
					<c:if test="${hobby.hobby == genre.hobby && notBreaking}">
						<!-- Heading for genre under hobby -->
						<tr>
							<th>Genre</th>
							<th>Time Spent(Hours)</th>
							<th>Date Started</th>
							<th>Last Done</th>
							<th>Rating</th>
							<th>Description</th>
							<th>Add new Item</th>
						</tr>
						<c:set var="notBreaking" value="false"/> <%-- breaks out of loop --%>
					</c:if>
				</c:forEach>
				<c:forEach items="${genres }" var="genre">
					<c:if test="${hobby.hobby == genre.hobby }">
						<!-- Genres information under hobby -->
						<tr>
							<!-- Button for getting to items under genre -->
							<td>
								<button onclick="genres('${hobby.hobby}I')">${genre.genre}</button>
							</td>
							<td>${genre.timeSpent }</td>
							<td>${genre.dateStarted }</td>
							<td>${genre.lastDone }</td>
							<td>${genre.rating }</td>
							<td>${genre.description }</td>
							<td>
							
								<!-- Button for the form to add item for that genre -->
								<button onclick="addform('${hobby.hobby}AIG')">Item Form</button>
								<form id="${hobby.hobby}AIG" style="display:none" name="addItem" action="hobbies" method="post">
	
									<input type="hidden" value="${hobby.hobby }" name="hobbyI">
									<br>Item: <input type="text" class="inside" name="item">
									<input type="hidden" value="${genre.genre }" name="genreI"> 
									<br>Total time spent in hours: <input type="text" class="inside" name="timeSpentI"> 
									<br>Date Started: <input type="date" class="inside" name="dateStartedI"> 
									<br>Date Last Done: <input type="date" class="inside" name="lastDoneI"> 
									<br>Rating (0 to 10 with 0.5 intervals): <input type="number" class="inside" name="ratingI" 
										min="0" max="10" step="0.5"> 
									<br>Description: <input type="text" class="inside" name="descriptionI"> 
									<br><br>
		
									<input type="submit" class="inside" value="Add Item">
	
								</form>
							
							</td>
						</tr>
						
						<!-- Need way to bring out items if there is no genre, and with genre -->
						<tr id="${hobby.hobby }I" style="display:none"><td colspan="7">
						<!-- Table for items under genre -->
						<table>
							<c:set var="notBreaking" value="true"/> <%-- For breaking out of loop later --%>
							<c:forEach items="${items }" var="item">
								<c:if test="${hobby.hobby == item.hobby && notBreaking}">
									<!-- Heading to item under genre -->
									<tr>
										<th>Item</th>
										<th>Time Spent(Hours)</th>
										<th>Date Started</th>
										<th>Last Done</th>
										<th>Rating</th>
										<th>Description</th>
									</tr>
									<c:set var="notBreaking" value="false"/> <%-- breaks out of loop --%>
								</c:if>
							</c:forEach>
							<c:forEach items="${items }" var="item">
								<c:if test="${hobby.hobby == item.hobby }">
									<!-- Items information under genre -->
									<tr>
										<td>${item.item }</td>
										<td>${item.timeSpent }</td>
										<td>${item.dateStarted }</td>
										<td>${item.lastDone }</td>
										<td>${item.rating }</td>
										<td>${item.description }</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
						</td></tr>
						
					</c:if>
				</c:forEach>
			</table>
			</td></tr>
			
			<c:set var="breakChooseLoop" value="false"/> <%-- breaks out of loop --%>
			</c:when>
			
			<c:when test="${hobby.hobby == items.hobby }">
			
			<tr id="${hobby.hobby }" style="display:none"><td colspan="7">
			<!-- Table for Items under Hobby -->
			<table>
			
				<c:set var="notBreaking" value="true"/> <%-- For breaking out of loop later --%>
				<c:forEach items="${items }" var="item">
					<c:if test="${hobby.hobby == item.hobby && notBreaking}">
						<!-- Heading to item under hobby -->
						<tr>
							<th>Item</th>
							<th>Time Spent(Hours)</th>
							<th>Date Started</th>
							<th>Last Done</th>
							<th>Rating</th>
							<th>Description</th>
						</tr>
						<c:set var="notBreaking" value="false"/> <%-- breaks out of loop --%>
					</c:if>
				</c:forEach>
				<c:forEach items="${items }" var="item">
					<c:if test="${hobby.hobby == item.hobby }">
						<!-- Items information under hobby -->
						<tr>
							<td>${item.item }</td>
							<td>${item.timeSpent }</td>
							<td>${item.dateStarted }</td>
							<td>${item.lastDone }</td>
							<td>${item.rating }</td>
							<td>${item.description }</td>
							<td>
				
								<!-- Button for the form to add item for that hobby -->
								<button onclick="addform('${hobby.hobby}AIG')">Item Form</button>
								<form id="${hobby.hobby}AI" style="display:none" name="addItem" action="hobbies" method="post">
	
									<input type="hidden" value="${hobby.hobby }" name="hobbyI">
									<br>Item: <input type="text" class="inside" name=item> 
									<br>Total time spent in hours: <input type="text" class="inside" name="timeSpentI"> 
									<br>Date Started: <input type="date" class="inside" name="dateStartedI"> 
									<br>Date Last Done: <input type="date" class="inside" name="lastDoneI"> 
									<br>Rating (0 to 10 with 0.5 intervals): <input type="number" class="inside" name="ratingI" 
										min="0" max="10" step="0.5"> 
									<br>Description: <input type="text" class="inside" name="descriptionI"> 
									<br><br>
		
									<input type="submit" class="inside" value="Add Item">
	
								</form>
				
							</td>
						</tr>
					</c:if>
				</c:forEach>
			
			</table>
			</td></tr>
			
			<c:set var="breakChooseLoop" value="false"/> <%-- breaks out of loop --%>
			</c:when>
			
			<c:otherwise>
			
			</c:otherwise>
			
			</c:choose>
			</c:if>
			</c:forEach>
			</c:when>
			
			</c:choose>
		
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
	
	function addform(formID) {
		
		var x = document.getElementById(formID);
		
	    if (x.style.display === "none") {
	        x.style.display = "block";
	    } else {
	        x.style.display = "none";
	    }
		
	}
	
	

</script>

</body>
</html>