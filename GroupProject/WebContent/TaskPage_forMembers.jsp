<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@ page import="DataBase.*" %>

<html>
<head>

<!-- This page is only for the team members. This page will show a task and list of members working on this task. Every member can edit his progress on this page.  -->

	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	

	<title>TaskPage_forMembers</title>

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
				
				<h1 id="page-name" class="navbar-brand" >Task - Members Page</h1>

				</div>
			</div>

		<!-- Content of the page after the bars -->
		
		<div class="container container-project-name">
		<h3>Task 5 </h3>
		<h7 id="desc_heading">Team members - edit your progress!</h7>	
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
								<th>#Percentage done</th>
							</tr>
								
							<tr id="row1">
								<td id="name_row1">Tom</td>
								<td id="progress_row1">Working on it</td>
								<td id="percentage_row1">20%</td>
								<td>
								<input type="button" id="edit_button1" value="Edit" class="edit btn btn-info" onclick="edit_row('1')">
								<input type="button" id="save_button1" value="Save" class="save btn btn-success" onclick="save_row('1')">
								</td>
							</tr>
								
							<tr id="row2">
								<td id="name_row2">Shawn</td>
								<td id="progress_row2">Stuck</td>
								<td id="percentage_row2">6%</td>
								<td>
									<input type="button" id="edit_button2" value="Edit" class="edit btn btn-info" onclick="edit_row('2')">
									<input type="button" id="save_button2" value="Save" class="save btn btn-success" onclick="save_row('2')">
								</td>
							</tr>
								
							<tr id="row3">
								<td id="name_row3">Rahul</td>
								<td id="progress_row3">Done</td>
								<td id="percentage_row3">100%</td>
								<td>
									<input type="button" id="edit_button3" value="Edit" class="edit btn btn-info" onclick="edit_row('3')">
									<input type="button" id="save_button3" value="Save" class="save btn btn-success" onclick="save_row('3')">
								</td>
							</tr>
								
							
																				
						</table>
					</div>
				</div>
			</div>
		</div>
			
			<script type="text/javascript">
			
			function edit_row(no)
			{
			 document.getElementById("edit_button"+no).style.display="none";
			 document.getElementById("save_button"+no).style.display="block";
				
			 //var name=document.getElementById("name_row"+no);
			 var country=document.getElementById("progress_row"+no);
			 var age=document.getElementById("percentage_row"+no);
				
			 //var name_data=name.innerHTML;
			 var country_data=country.innerHTML;
			 var age_data=age.innerHTML;
				
			 //name.innerHTML="<input type='text' id='name_text"+no+"' value='"+name_data+"'>";
			 country.innerHTML="<input type='text' id='country_text"+no+"' value='"+country_data+"'>";
			 age.innerHTML="<input type='text' id='age_text"+no+"' value='"+age_data+"'>";
			}

			function save_row(no)
			{
			 //var name_val=document.getElementById("name_text"+no).value;
			 var country_val=document.getElementById("country_text"+no).value;
			 var age_val=document.getElementById("age_text"+no).value;

			 //document.getElementById("name_row"+no).innerHTML=name_val;
			 document.getElementById("progress_row"+no).innerHTML=country_val;
			 document.getElementById("percentage_row"+no).innerHTML=age_val;

			 document.getElementById("edit_button"+no).style.display="block";
			 document.getElementById("save_button"+no).style.display="none";
			}

				
			
			
			</script>
	

</body>
</html>