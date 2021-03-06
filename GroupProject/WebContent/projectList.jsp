<!DOCTYPE html>

<%@ page import="java.util.*"%>
<%@ page import="DataBase.*"%>
<%
User user = (User) request.getAttribute("user");
/* String email=(String)request.getAttribute("email"); */
List<Project> projects = (List<Project>) request.getAttribute("projects");
%>


<html>

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Main.css" />
	<title>Create Project</title>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/projectList.css" /> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/projectList.js"></script>


</head>

<body>

	<div id="topbar">

		<div id="name-div" class="topbar-section">

			<a id="projectName" class="navbar-brand" href="#">Manage P&P </a>

		</div>

		<div class="topbar-section topbar-logIn">

			<a class="navbar-brand" href="homepage.jsp">Log Out</a>

		</div>

	</div>

	<!-- Div to clear the space between the bars-->
	<div class="clear"></div>

	<div id="down-line-bar">

		<!--div to align the page name-->
		<div id="name-bar ">
			<div id="page-name">
				<a href="#">Projects</a>
			</div>
		</div>

	</div>
	<!-- Page content -->
	<div id="greeting-user">
		<h4><i class="fas fa-address-card"></i><%="  "%>Hello, <%=user.getFirstName() + " " + user.getLastName()%></h4>
	</div>



	<div id="text-container">

		<h1 class="create-project-heading">Pick or Create Project</h1>
	</div>

	<div class="container">
		
		<table class="table table-borderless table-hover" id="project_in_manage">
			<thead>
				<tr>
					<th>
						<a href="#">Projects You Manage</a>
					</th>
				</tr>
			</thead>


			<form name="form1" class="form-signin" action="UserServlet" method="POST">
				<input id="var" type="hidden" name="command" value="temp" />
				<input type="hidden" name="email" value="<%=user.getEmail()%>" />
				<input id="token" type="hidden" name="token" value="temp" />
				<%
				for (int i = 0; i < projects.size(); i++) {
				%>

				
				
				<input type="hidden" name="projectName<%=i+1%>" value="<%=projects.get(i).getProjectName()%>" />
				<tr id=row <%=i + 1%>>
					
					
					
					<%
					if (projects.get(i).isProjectAdmin() == true) {
					%>



					<td>
						
						<input id="projectname<%=i+1%>" type="button" class='btn btn-primary mb-2' value="<%=projects.get(i).getProjectName()%>" name='projectName' onclick='dashboard(<%=i+1%>)' />
					</td>

					<td>
						<input type='button' value='Delete' class='btn btn-danger' onclick='delete_row(<%=i+1%>)'>
					</td>
					<%}%>
					
				</tr>
				<%}%>
			</form>
		</table>





		<table class="table">
			<thead>
				<tr>
					<th>
						<a href="#">Projects You are Involved in</a>
					</th>
				</tr>
			</thead>

			<%
			for (int i = 0; i < projects.size(); i++) {
			%>
			
			<tr>
				<form class="form-signin" action="UserServlet" method="POST">
					<input type="hidden" name="command" value="checkProject" />
					<input type="hidden" name="email" value="<%=user.getEmail()%>" />

					<%
					if (projects.get(i).isProjectAdmin() == false) {
					%>
					<td>
						<input type="submit" class='btn btn-primary mb-2' value="<%=projects.get(i).getProjectName()%>" name="projectName" />
					</td>

					<%
				}
				%>


			</form>
		</tr>


		<%
	}
	%>

</table>


<div class="create-project-form">
	<p>Create Project</p>
	<form class="form-inline" action="UserServlet" method="POST">
		<input type="hidden" name="command" value="addProject" />
		<input type="hidden" name="email" value="<%=user.getEmail()%>" />



		<div class="form-group mx-sm-3 mb-2">
			<input style="width:130%;" class="form-control" id="new_project_name" type="text" name="projectName" placeholder="project name" required="" />

		</div>

		<button style="margin-left:30px;margin-top:8px;" type="submit" class="btn btn-primary mb-3">+ Add</button>
	</form>
</div>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>




