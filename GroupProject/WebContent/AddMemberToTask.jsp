<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@ page import="DataBase.*" %>

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
	 
</head>
<body>


	<!-- Top bars -->
			<div id="topbar">
		
				<div id="name-div" class="topbar-section">
			
					<a id="projectName"  href="Dashboard.jsp">Manage P&P </a>
				</div>
				
				<div class="topbar-section topbar-logIn">
					<a class="navbar-brand" href="ManagePeople.jsp">Manage People</a>
					<a class="navbar-brand" href="Homepage.jsp">Log Out</a>
				</div>
			
			</div>
			
			<!-- Div to clear the space between the bars-->
			<div class="clear"></div>
		
			<div id="down-line-bar">
				<div id="name-bar">
				
				<h1 id="page-name" class="navbar-brand" >Assign Members to a Task</h1>

				</div>
			</div>

		<!-- Content of the page after the bars -->
		
		<div class="container container-project-name">
		<h3>Task 5 </h3>
		<h7 id="desc_heading">Members involved in this task</h7>
		</div>
			
			<!-- TABLE  -->
			<div class="container">
			  <div class="row">
			  	<div class="col align-self-center">
					<div id="wrapper">
						<table class="table table-bordered" align='center' cellspacing=2 cellpadding=5 id="data_table" border=0>
							<tr>
								<th>#Name</th>
								<th>#Progress</th>
							</tr>
							
							<tr id="row1">
								<td id="name_row1">Tom</td>
								<td id="progress_row1"></td>
							
								<td>
									<input type="button" value="Delete" class="delete btn btn-danger" onclick="delete_row('1')">
								</td>
								</tr>
							
							<tr id="row2">
								<td id="name_row2">Jane</td>
								<td id="progress_row2"></td>
							
								<td>
									<input type="button" value="Delete" class="delete btn btn-danger" onclick="delete_row('2')">
								</td>
							</tr>
							
							<tr id="row3">
								<td id="name_row3">Ted</td>
								<td id="progress_row3"></td>
								
								<td>
									<input type="button" value="Delete" class="delete btn btn-danger" onclick="delete_row('3')">
								</td>
							</tr>
							
							<tr>
								<td><input type="text" class="form-control" id="new_name"></td>
								<td><p></p></td>
								<!--<input type="text" id="new_progress">  -->
								<td><input type="button" class="add btn btn-info" onclick="add_row();" value="Add Member"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
						

			

			
			
			<script type="text/javascript">
			
			//This is function to delete team member and the row connected with him/her
	
			function delete_row(no)
			{
			 document.getElementById("row"+no+"").outerHTML="";
			}

			function add_row()
			{
			 var new_name=document.getElementById("new_name").value;
			 //var new_progress=document.getElementById("new_progress").value;
			 
				
			 var table=document.getElementById("data_table");
			 var table_len=(table.rows.length)-1;
			 var row = table.insertRow(table_len).outerHTML="<tr id='row"+table_len+"'><td id='name_row"+table_len+"'>"+new_name+"</td><td><p></p><td><input type='button' value='Delete' class='delete btn btn-danger' onclick='delete_row("+table_len+")'></td></tr>";

			 document.getElementById("new_name").value="";
			 //document.getElementById("new_progress").value="";
			 
			}
		
				
			
			
			</script>
	

</body>
</html>