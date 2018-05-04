<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*" %>
<%@ page import="DataBase.*" %>
<%  
	/* String projectName = (String) request.getAttribute("projectName"); */
	List<ProjectInvolve> projectInvolves = (List<ProjectInvolve>) request.getAttribute("membersInvolve");
	String userEmail =(String)request.getAttribute("userEmail");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
<title>editProject</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Main.css" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/editProject.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/editProject.js"></script>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>


</head>
<body>
		<div id="topbar">		
			<div id="name-div" class="topbar-section">
				<a id="projectName" class="navbar-brand" href="javascript:history.go(0);">Manage P&P </a>
			</div>
				
			<div class="topbar-section topbar-logIn">
				<a class="navbar-brand" href="homepage.jsp">Log Out</a>
			</div>
			
		</div>
		
		<div class="clear"></div>
		<div id="down-line-bar">
			<div id="name-bar ">
				<div id="page-name">
					<form id="myform" action="UserServlet" method="GET">
					<input id="var" type="hidden" name="command" value="turnToProject" />
					<input type="hidden" name="email" value="<%=userEmail%>" />
					<input type="hidden" name="projectName" value="<%=projectInvolves.get(0).getProjectName()%>" />
					<a href="#" onclick="goProject()">Projects</a> &gt;
					<a href="#" onclick="goDashboard()">Dashboard</a> &gt;
					<a href="#" >edit project</a>
				</form>
				</div>
			</div>
		</div>
		
		<div id="d1">
		<form id="form1" name="form1" class="form-signin" action="UserServlet" method="POST">
		<input type="hidden" name="projectName" value="<%=projectInvolves.get(0).getProjectName()%>" />
		
		<label id="editable_projectname" for="staticQustion" class="form-label-3"><%=projectInvolves.get(0).getProjectName()%></label>
		<div id="rename_button1">
					<input type="hidden" name="command" value="rename">
					<input type="hidden" name="email" value="<%=userEmail%>">
					<input type="button" id="rename_button" value="Rename" class="btn btn-primary" onclick="rename()">
					<input type="button" id="save_button" value="Save" class="btn btn-primary" onclick="save()" style="display: none;">

		</div> 
		</form>
		</div>
		<br>
		<br>
		<br>
		<br>
		
		<form id="form2" name="form2" class="form-signin" action="UserServlet" method="POST">
			<div class="bootstrap-iso" id="datepickers_container">
				<div class="container-fluid">
			  		<div class="row">
			   			<div class="form-group"> 
			      			<label>Add more members to this project!</label>
			        		<input title="xyz@something.com" class="form-control" name ="Email1" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"/>
			        		<input id="var2" type="hidden" name="projectName" value="<%=projectInvolves.get(0).getProjectName()%>" />
			        		<input id="token" type="hidden" name="token" value="1" />
			        		<input type="hidden" name="email" value="<%=projectInvolves.get(0).getUserEmail() %>" /> 
			   			</div>
			   			<div id="addbutton" class="col-md-4 col-md-4 col-xs-12"> 
			       			<div class="form-group"> 
			        			<button class="btn btn-primary " name="submit" type="submit">Add</button>
			        			<input type="hidden" name="command" value="addMember" />
			      			</div>
			      		</div>
			    	</div>
			    </div>    
			</div>
		</form> 
		
		<div id="memtable" class="">
			<div id="wrapper">
				<form name="form3" action="UserServlet" method="POST">
				<input id=token2 type="hidden" name="token" value="temp" />
				<input type="hidden" name="projectName" value="<%=projectInvolves.get(0).getProjectName()%>" />
					<table align='center'  id="data_table" border=0>
						<tr>
						<th>Members</th>
						</tr>
			
						<% for (int i=0;i<projectInvolves.size();i++) { %>
						<!-- user.size -->
						<tr>
							<td id="member<%=i+1%>"><%=projectInvolves.get(i).getUserEmail() %></td>
							<%-- <%= users.get(i).getEmail() %> --%>
							<td> 
								<input type="hidden" name="command" value="deleteMember" />
								<input type="hidden" name="email<%=i+1%>" value="<%=projectInvolves.get(i).getUserEmail() %>" />
								<input type="hidden" name="admin<%=i+1%>" value="<%=String.valueOf(projectInvolves.get(i).isAdmin())%>" />
								<input type="hidden" name="userEmail" value="<%=userEmail%>" />
								
								<input type="button" value="Delete" class="delete btn btn-danger" onclick="delete_member(<%=i+1%>)">
							</td>
						</tr>
						<% } %>
					</table>
				</form>
			</div>
		</div>	
</body>
</html>