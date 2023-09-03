<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="in.sp.backend.Task"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weekly Task Scheduler</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<header>
    <div class="header-container">
      <h1>Welcome, <%= session.getAttribute("user") %>!</h1>
			<%!public String getCurrentDate() {
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("EEEE, MMMM dd, yyyy");
		return dateFormat.format(date);
	}%>
			<div class="current-date">
            <%= getCurrentDate() %>
        </div>
    </div>
    <h2>Weekly Task Scheduler</h2>
    <nav>
       <ul class="tabs">
				<li><a href="ViewDataServlet?currentday=Sunday">Sunday</a></li>
				<li><a href="ViewDataServlet?currentday=Monday">Monday</a></li>
				<li><a href="ViewDataServlet?currentday=Tuesday">Tuesday</a></li>
				<li><a href="ViewDataServlet?currentday=Wednesday">Wednesday</a></li>
				<li><a href="ViewDataServlet?currentday=Thursday">Thursday</a></li>
				<li><a href="ViewDataServlet?currentday=Friday">Friday</a></li>
				<li><a href="ViewDataServlet?currentday=Saturday">Saturday</a></li>
                <li><a id="logouttab" href="logout">Logout</a></li> 
			
			</ul>
    </nav>
</header>

	<div class="container">
		<div class="tab" id="sunday">
			<h2><%= request.getParameter("currentday") %>
				Tasks
			</h2>
			<form action="InsertDataServlet" method="post">
				<input type="hidden" name="currentday"
					value="<%=request.getParameter("currentday")%>">
				<!--  <input type="date" id="taskName" placeholder="Date" required> -->
				<label for="taskName">Task :</label> <input type="text"
					name="taskName" placeholder="Task Name" required> <label
					for="startTime">From :</label> <input type="text" name="startTime"
					placeholder="Start Time" required> <label for="endTime">To
					:</label> <input type="text" name="endTime" placeholder="End Time" required>
				<button id="addtask" type="submit">Add Task <a href="ViewDataServlet"></a></button>
			</form>
			<!-- Table to display tasks -->
			<table>
				<thead>
					<tr>
						<th>Task Name</th>
						<th>Start Time</th>
						<th>End Time</th>
					</tr>
				</thead>

				<tbody>
					<%
					List<Task> deltasks = (List<Task>) request.getAttribute("usertasks");
					if (deltasks != null && !deltasks.isEmpty()) {
						for (Task task : deltasks) {
					%>
					<tr>
						<td><%=task.getTaskName()%></td>
						<td><%=task.getStartTime()%></td>
						<td><%=task.getEndTime()%></td>
						<td>
							<form action="DeleteTaskServlet" method="post">
								<input type="hidden" name="currentday"
									value="<%=request.getParameter("currentday")%>"> <input
									type="hidden" name="taskName" value="<%=task.getTaskName()%>">
								<button id="done" type="submit">Done</button>
							</form>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="4">No tasks available for <%=request.getParameter("currentday")%></td>
					</tr>
					<%
					}
					%>
				</tbody>


			</table>
		</div>
	</div>
	  <div class="indexfooter">
        <p>Simple Weekly Task Scheduler © 2023</p>
    </div>
</body>
</html>

