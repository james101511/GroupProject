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
	String taskProgress = (String)request.getAttribute("taskProgress");
%>

<html>
<head>

<!-- This page is only for the team members. This page will show a task and list of members working on this task. Every member can edit his progress on this page.  -->

	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	

	<title>TaskPage_forMembers</title>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Main.css" />
	  <!-- Bootstrap -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/membersTaskPage.css" /> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/membersTaskPage.js"></script>

</head>
<body>


	<!-- Top bars -->
			<div id="topbar">
		
				<div id="name-div" class="topbar-section">

					<a id="projectName" class="navbar-brand" href="javascript:history.go(0);">Manage P&P </a>
				</div>
				
				<div class="topbar-section topbar-logIn">
					<a class="navbar-brand" href="homepage.jsp">Log Out</a>
				</div>
			
			</div>
			
			<!-- Div to clear the space between the bars-->
			<div class="clear"></div>
		
			<div id="down-line-bar">
				<div id="name-bar ">
					<div id="page-name">
					<form id="myform" action="UserServlet" method="GET">
					<input id="var" type="hidden" name="command" value="turnToProject" />
					<input type="hidden" name="email" value="<%=userEmail%>" />
					<input type="hidden" name="projectName" value="<%=projectName%>" />
					<a href="#" onclick="goProject()">Projects</a> &gt;
					<a href="#" onclick="goDashboard()">Dashboard</a> &gt;
					<a href="#" >Task</a>
				</form>
					
						
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
								<th>#Progress comment</th>
								<th>#Percentage done</th>
							</tr>
								
								<% for (int i=0;i<membersInvolve.size();i++) { %>
							<tr id="row">
								<td id="name_row<%=i+1%>"><%=membersInvolve.get(i).getUserEmail() %></td>
								<td id="progress_row<%=i+1%>"><%=membersInvolve.get(i).getProgress() %></td>
								<td id="percentage_row<%=i+1%>"><%=membersInvolve.get(i).getPercentage() %>%</td>
								<td>
								<%-- <% int peronalPercentage = Integer.parseInt(membersInvolve.get(i).getPercentage()); %> --%>
								
								<%if(membersInvolve.get(i).getUserEmail().equals(userEmail)){ %> 
								<input id="var" type="hidden" name="command" value="editProgress" />
								<input type="hidden" name="userEmail" value="<%=userEmail %>" />
								<input type="hidden" name="projectName" value="<%=projectName %>" />
								<input type="hidden" name="taskName" value="<%=taskName %>" />
								<input type="hidden" name="taskProgress" value="<%=taskProgress%>" />
								<input type="button" id="edit_button" value="Edit" class="edit btn btn-info" onclick="edit_row(<%=i+1%>)">
								<input type="button" id="save_button" value="Save" class="save btn btn-success" onclick="save_row()" style="display: none;">
								<% } %>
								</td>
							</tr>
							<% } %>
								
					
								
							
																				
						</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="container">
			  <div class="row">
			  	<div class="col align-self-center">
					<div id="wrapper11">
						<table class="table table-bordered" align='center' cellspacing=2 cellpadding=5 id="data_table" border=0>
							<tr>
								<th>#Task_Progress</th>
								<th> <%=taskProgress  %>% </th>
							</tr>														
						</table>
					</div>
				</div>
			</div>
		</div>

</body>
</html>