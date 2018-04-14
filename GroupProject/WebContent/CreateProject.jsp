<!DOCTYPE html>

<%@ page import="java.util.*" %>
<%@ page import="DataBase.*" %>
<%
	User user =(User)request.getAttribute("user");
	String email=(String)request.getAttribute("email");
%>
<%
	List<Involve> Involves = (List<Involve>) request.getAttribute("Involve");
%>

	<html>
	
		<head>
		 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="Main.css"> 
			<title>Create Project</title>
		
		
			<style type="text/css">
				
				
				
				#text-container {
		
				width: 1000px;
				margin-bottom: 40px;
				padding:auto;
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
							<a   href="#" >Projects</a>
						</div>
					</div>
				
				</div>
				<!-- Page content -->
				
				<div class="container">
					<div id="text-container">
		
						<h1 class="create-project-heading">Create new project to get started</h1>
					</div>
					
						
						Hello <%=user.getFirstName()+","+user.getLastName() %>
					<table class="table">
						<thead>
							<tr>
								<th><a href ="#">ProjectYouManage</a></th>
							</tr>
						</thead>
				
				<% for (int i=0;i<Involves.size();i++) { %>
					
					<tr>
						<form class="form-signin" action="UserServlet" method="POST" >
				<input type="hidden" name="command" value="checkProject"/>
				<input type="hidden" name="email" value="<%=user.getEmail() %>" />
						 
						 <%if(Involves.get(i).isAdmin() == true){ %> 
						<td><input type="submit" value="<%= Involves.get(i).getProjectName() %>" name="projectName"/> </td>
						 <% } %> 
						
						</form>
					</tr>
					
			
				<% } %>
				
			</table>
			<table class="table">
						<thead>
							<tr>
								<th><a href ="#">ProjectYouInvolve</a></th>
							</tr>
						</thead>
				
				<% for (int i=0;i<Involves.size();i++) { %>
					
					<tr>
						<form class="form-signin" action="UserServlet" method="POST" >
				<input type="hidden" name="command" value="checkProject"/>
				<input type="hidden" name="email" value="<%= user.getEmail() %>" />
		
						<%if(Involves.get(i).isAdmin() == false){ %>
						<td><input type="submit" value="<%= Involves.get(i).getProjectName() %>" name="projectName"/> </td>
						
						<% } %> 

						
						</form>
					</tr>
					
			
				<% } %>
				
			</table>
		
						
						
						
						<form class="form-inline" action="UserServlet" method="POST" >
				 		<input type="hidden" name="command" value="ADDPROJECT"/>
				 		<input type="hidden" name="Email" value="<%= user.getEmail() %>" />
						<div class="form-group mx-sm-3 mb-2">
						<label for="ProjectName" class="sr-only">Project name</label>
						<input class="form-control" type="text" name="ProjectName" placeholder="ProjectName"  required=""/> 
						</div>
						
						<button type="submit" class="btn btn-primary mb-2"> + Add</button>
						</form>
	
				</div>
	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
		

		</body>
	
	</html>

	