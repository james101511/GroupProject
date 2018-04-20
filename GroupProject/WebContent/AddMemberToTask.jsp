<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@ page import="DataBase.*" %>
<%
	String projectName =(String)request.getParameter("projectName");
	String taskName =(String)request.getParameter("taskName");
	List<TaskInvolve> taskInvolves = (List<TaskInvolve>) request.getAttribute("taskInvolves");
%>

<html>
<head>

<!-- This is page which will be available only to the manager. The manager will be able to assign 
members of the team to a specific task. He also will be able to see who is already working on this task and the progress that every member has done.->

	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	

	<title>AddMemberToTask</title>

	<link rel="stylesheet" type="text/css" href="Main.css"> 
	  <!-- Bootstrap -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	 
	 <style type="text/css">

h7{
color: #2C3F50;
 padding: 15px;

}
</head>
<body>


	<!-- Top bars -->
			<div id="topbar">
		
				<div id="name-div" class="topbar-section">
			
					<a id="projectName"  href="Dashboard.jsp">Manage P&P </a>
				</div>
				
				<div class="topbar-section topbar-logIn">
					<a class="navbar-brand" href="Homepage.jsp">Log Out</a>
				</div>
			
			</div>
			
			<!-- Div to clear the space between the bars-->
			<div class="clear"></div>
		
			<div id="down-line-bar">
				<div id="name-bar ">
					<div id="page-name">
					
						<a   href="CreateProject.jsp" >Projects</a> &gt;
						<a   href="Dashboard.jsp" >Dashboard</a> &gt;
						<a   href="#" >Add Members To Task</a>
					</div>
				</div>
			</div>

		<!-- Content of the page after the bars -->
		
		<div class="container container-project-name">
		<h3><%=taskName %> </h3>
		<h7 id="desc_heading">Members involved in this task</h7>
		
		</div>
			
			<!-- TABLE  -->
			<div class="container">
			  <div class="row">
			  	<div class="col align-self-center">
					<div id="wrapper">
					<form Name="form2" class="form-signin" action="UserServlet" method="GET">
					<input id="var" type="hidden" name="command" value="addTaskMember" />
					<input type="hidden" name="projectName" value="<%=projectName %>" />
					<input type="hidden" name="taskName" value="<%=taskName %>" />
						<table class="table table-bordered" align='center' cellspacing=2 cellpadding=5 id="data_table" border=0>
							<tr>
								<th>#Name</th>
								<th>#Progress</th>
							</tr>
							<% for (int i=0;i<taskInvolves.size();i++) { %>
							<tr id="row1">
							
								<td id="name_row1"><%=taskInvolves.get(i).getUserEmail() %></td>
								
								<td id="progress_row1"><%=taskInvolves.get(i).getProgress() %></td>
							
								<td>
									<input type="button" value="Delete" class="delete btn btn-danger" onclick="delete_row(<%=i+1%>)">
									<input id ="delete<%=i+1%>" type="hidden" name="userEmailx" value="<%=taskInvolves.get(i).getUserEmail() %>" />
								</td>
								
							</tr>
							 <% } %>
							<tr>
							
								<td><input type="text" class="form-control" name="userEmail" id="new_name"></td>
								<td><p></p></td>
								<!--<input type="text" id="new_progress">  -->
								<td><input type="button" class="add btn btn-info" onclick="add_row();" value="Add Member"></td>
							
							</tr>
							
							
							
						</table>
						</form>
					</div>
				</div>
			</div>
		</div>
						

			

			
			
			<script type="text/javascript">
			
			//This is function to delete team member and the row connected with him/her
	
			function delete_row(i)
			{
				document.getElementById("delete"+i).name= "deleteUserEmail";
			 	document.getElementById("var").value = "deleteTaskMember";

				document.form2.submit();
			}

			 function add_row()
			{
			 
				document.getElementById("var").value = "addTaskMember";

				document.form2.submit();
			 
			} 
		
				
			
			
			</script>
	

</body>
</html>