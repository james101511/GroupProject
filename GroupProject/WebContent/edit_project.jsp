<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*" %>
<%@ page import="DataBase.*" %>
<%  
	String projectName = (String) request.getParameter("projectName");
	List<ProjectInvolve> projectInvolves = (List<ProjectInvolve>) request.getAttribute("membersInvolve");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
<title>editProject</title>

<link rel="stylesheet" type="text/css" href="Main.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<style type="text/css">
.form-label-3 {
	margin-top:50px;
	margin-left: 100px;
	font-size: 30px;
	font-weight: bold;
	color: #7b74aa;
}
#rename_button1 {
	margin-top:-45px;
	margin-left:600px;
}
#d1 {
	margin-left: auto;
	margin-right: auto;
}
</style>

<script type="text/javascript">
	function rename()
	{
 		document.getElementById("rename_button").style.display="none";
 		document.getElementById("save_button").style.display="block";
	
 		var projectName = document.getElementById("editable_projectname");
 		var projectName_data = projectName.innerHTML;

 		projectName.innerHTML="<input type='text' id='editable_projectname' value='"+projectName_data+"'>";

	}
	function save()
	{
		document.form1.submit();
	}
	function delete_member(i)
	{
		document.getElementById("token2").value = i;
		document.form3.submit();
	}
</script>
</head>
<body>
		<div id="topbar">		
			<div id="name-div" class="topbar-section">
				<a id="projectName" href="javascript:history.go(-1);">Manage P&P </a>
			</div>
				
			<div class="topbar-section topbar-logIn">
				<a class="navbar-brand" href="Homepage.jsp">Log Out</a>
			</div>
			
		</div>
		
		<div class="clear"></div>
		<div id="down-line-bar">
			<div id="name-bar ">
				<div id="page-name">
					<a   href="CreateProject.jsp" >Projects</a> &gt;
					<a   href="Dashboard.jsp" >edit project</a>
				</div>
			</div>
		</div>
		
		<div id="d1">
		<form id="form1" name="form1" class="form-signin" action="UserServlet" method="POST">
		<label id="editable_projectname" for="staticQustion" class="form-label-3"><%=projectName%></label>
		<div id="rename_button1">
			<tr>
				<td>
					<input type="hidden" name="command" value="renameProject">
					<input type="button" id="rename_button" value="Rename" class="btn btn-primary" onclick="rename()">
					<input type="button" id="save_button" value="Save" class="btn btn-primary" onclick="save()" style="display: none;">
				</td>
			</tr>
		</div>
		</form>
		</div>
		
		<form id="form2" name="form2" class="form-signin" action="UserServlet" method="POST">
			<div class="bootstrap-iso" id="datepickers_container">
				<div class="container-fluid">
			  		<div class="row">
			   			<div class="form-group"> 
			      			<label>Add more members to this project!</label>
			        		<input class="form-control" name ="Email1"type="text"/>
			        		<input id="var2" type="hidden" name="projectName" value="<%=projectName%>" />
			        		<input id="token" type="hidden" name="token" value="1" />
			        		<input type="hidden" name="email" value="<%=projectInvolves.get(0).getUserEmail() %>" /> 
			   			</div>
			   			<div class="col-md-4 col-md-4 col-xs-12"> 
			       			<div class="form-group"> 
			        			<button class="btn btn-primary " name="submit" type="submit">Add</button>
			        			
			        			<input type="hidden" name="command" value="addMember" />
			      			</div>
			      		</div>
			    	</div>
			    </div>    
			</div>
		</form> 
		
		<div class="">
			<div id="wrapper">
				<form name="form3" action="UserServlet" method="POST">
				<input id=token2 type="hidden" name="token" value="temp" />
				<input type="hidden" name="projectName" value="<%=projectName%>" />
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