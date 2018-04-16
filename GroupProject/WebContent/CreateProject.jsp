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

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="Main.css">
<title>Create Project</title>


<style type="text/css">
#text-container {
	width: 1000px;
	margin-bottom: 40px;
	padding: auto;
	margin-top: 100px;
	padding-bottom: 80px;
	height: 30px;
}

.create-project-heading {
	font-size: 25px;
	font-weight: regular;
	padding-bottom: 20px;
}
</style>
</head>

<body>

	<div id="topbar">

		<div id="name-div" class="topbar-section">

			<a id="projectName" class="navbar-brand" href="#">Manage P&P </a>

		</div>

		<div class="topbar-section topbar-logIn">

			<a class="navbar-brand" href="LogInPage.jsp">Log Out</a>

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

	<div class="container">
		<div id="text-container">

			<h1 class="create-project-heading">Create new project to get started</h1>
		</div>


		Hello
		<%=user.getFirstName() + "," + user.getLastName()%>




		<table class="table" id="project_in_manage">
			<thead>
				<tr>
					<th>
						<a href="#">ProjectYouManage</a>
					</th>
				</tr>
			</thead>

			<%
				for (int i = 0; i < projects.size(); i++) {
			%>

			<tr id=row <%=i + 1%>>
				<form Name="form1" class="form-signin" action="UserServlet" method="POST">
					<input id="var" type="hidden" name="command" value="checkProject" />
					<input type="hidden" name="email" value="<%=user.getEmail()%>" />
					<%
						if (projects.get(i).isProjectAdmin() == true) {
					%>



					<td>
						<input id="projectname<%=i + 1%>" type="submit" value="<%=projects.get(i).getProjectName()%>" name="projectName" />
					</td>

					<td>

						<input type="hidden" name="projectName" value="<%=projects.get(i).getProjectName()%>" />
						<input type='button' id='edit_button<%=i + 1%>' value='Edit' class='edit' onclick='edit_row(<%=i + 1%>)'>
						<input type='button' id='save_button<%=i + 1%>' value='Save' class='save' onclick='save_row()'>
						<input type='button' value='Delete' class='delete' onclick='delete_row()'>
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





		<table class="table">
			<thead>
				<tr>
					<th>
						<a href="#">ProjectYouInvolve</a>
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
						<input type="submit" value="<%=projects.get(i).getProjectName()%>" name="projectName" />
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




		<form class="form-inline" action="UserServlet" method="POST">
			<input type="hidden" name="command" value="addProject" />
			<input type="hidden" name="email" value="<%=user.getEmail()%>" />

			<div class="form-group mx-sm-3 mb-2">

				<input class="form-control" id="new_project_name" type="text" name="projectName" placeholder="ProjectName" required="" />
			</div>

			<button type="submit" class="btn btn-primary mb-2">+ Add</button>
		</form>

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script type="text/javascript">
  		
  	
  	function edit_row(no){
  			document.getElementById("edit_button"+no).style.display="none";
			document.getElementById("save_button"+no).style.display="block";
			var projectname = document.getElementById("projectname"+no);
			var projectname_data = projectname.value;
			projectname = "<input type='text' name='newProjectName' id='projectname"+no+"' value='"+projectname_data+"'>";
			////fuck!!! mark this shit  can not change the innerHTML. why???
			
			
			
  		}
  		function save_row(){
  			
  			//when save ,make the text input become a submit button 
			document.getElementById("var").value = "editProject";
			
			document.form1.submit();
  		}
  		function delete_row(){
			document.getElementById("var").value = "deleteProject";
			
			document.form1.submit();
  		}

  	</script>
</body>
</html>




