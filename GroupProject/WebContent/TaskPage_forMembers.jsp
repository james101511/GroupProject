<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@ page import="DataBase.*" %>
<%
	String projectName =(String)request.getParameter("projectName");
	String taskName =(String)request.getParameter("taskName");
	List<TaskInvolve> membersInvolve = (List<TaskInvolve>) request.getAttribute("membersInvolve");
	String userEmail =(String)request.getAttribute("userEmail");
%>

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
				<div id="name-bar ">
					<div id="page-name">
					
						<a   href="CreateProject.jsp" >Projects</a> &gt;
						<a   href="Dashboard2.jsp" >Dashboard</a> &gt;
						<a   href="#" >Task</a>
					</div>
				</div>
			</div>

		<!-- Content of the page after the bars -->
		
		<div class="container container-project-name">
		<h3><%=taskName %> </h3>
		<h7 id="desc_heading">Team members - edit your progress!</h7>	
		</div>
			
			<!-- TABLE  -->
			<div class="container">
			  <div class="row">
			  	<div class="col align-self-center">
			  	
					<div id="wrapper">
					<form Name="form1" action="UserServlet" method="POST">
						<table class="table table-bordered" align='center' cellspacing=2 cellpadding=5 id="data_table" border=0>
							
							<tr>
								<th>#Name</th>
								<th>#Progress</th>
								<th>#Percentage done</th>
							</tr>
								<% for (int i=0;i<membersInvolve.size();i++) { %>
							<tr id="row1">
								<td id="name_row"><%=membersInvolve.get(i).getUserEmail() %></td>
								<td id="progress_row"><%=membersInvolve.get(i).getProgress() %></td>
								<td id="percentage_row"><%=membersInvolve.get(i).getPercentage() %></td>
								<td>
								<%if(membersInvolve.get(i).getUserEmail().equals(userEmail)){ %>
								<input id="var" type="hidden" name="command" value="editProgress" />
								<input type="hidden" name="userEmail" value="<%=userEmail %>" />
								<input type="hidden" name="projectName" value="<%=projectName %>" />
								<input type="hidden" name="taskName" value="<%=taskName %>" />
								<input type="button" id="edit_button" value="Edit" class="edit btn btn-info" onclick="edit_row()">
								<input type="button" id="save_button" value="Save" class="save btn btn-success" onclick="save_row()">
								<%} %>
								</td>
							</tr>
							<% } %>
								
					
								
							
																				
						</table>
						</form>
					</div>
				</div>
			</div>
		</div>
			
			<script type="text/javascript">
			
			function edit_row()
			{
			 document.getElementById("edit_button").style.display="none";
			 document.getElementById("save_button").style.display="block";
				
			 //var name=document.getElementById("name_row"+no);
			 var progress=document.getElementById("progress_row");
			 var percentage=document.getElementById("percentage_row");
				
			 //var name_data=name.innerHTML;
			 var progress_data=progress.innerHTML;
			 var percentage_data=percentage.innerHTML;
				
			 //name.innerHTML="<input type='text' id='name_text"+no+"' value='"+name_data+"'>";
			 progress.innerHTML="<input type='text'name='progress' id='progress_text' value='"+progress_data+"'>";
			 percentage.innerHTML="<input type='text' name='percentage' id='percentage_text' value='"+percentage_data+"'>";
			}

			function save_row(no)
			{
			/*  //var name_val=document.getElementById("name_text"+no).value;
			 var country_val=document.getElementById("country_text"+no).value;
			 var age_val=document.getElementById("age_text"+no).value;

			 //document.getElementById("name_row"+no).innerHTML=name_val;
			 document.getElementById("progress_row"+no).innerHTML=country_val;
			 document.getElementById("percentage_row"+no).innerHTML=age_val;

			 document.getElementById("edit_button"+no).style.display="block";
			 document.getElementById("save_button"+no).style.display="none"; */
				/* document.getElementById("var").value = "EDITTASK";
 */
				document.form1.submit();
			}

				
			
			
			</script>
	

</body>
</html>