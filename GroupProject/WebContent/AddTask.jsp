<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@ page import="DataBase.*" %>
<%
	String projectName = (String) request.getParameter("projectName");
	List<Task> tasks = (List<Task>)request.getAttribute("tasks");
%>
<html>
<head>

	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	

	<title>AddTask</title>

	<link rel="stylesheet" type="text/css" href="Main.css"> 
	  <!-- Bootstrap -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	 <!--  jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
</head>
<body>


	<!-- Top bars -->
			<div id="topbar">
		
				<div id="name-div" class="topbar-section">
				
				<a id="projectName" href="javascript:history.go(-1);">Manage P&P </a>
				
					
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
						<a   href="Dashboard.jsp" >Dashboard</a> &gt;
						<a   href="#" >Add Tasks</a>
					</div>
				</div>
			</div>

		<!-- Content of the page after the bars -->
		
		
	 		
			<!-- Date pickers -->
			<form Name="form" class="form-signin" action="UserServlet" method="POST">
			<div class="bootstrap-iso" id="datepickers_container">
			 <div class="container-fluid">
			  <div class="row">
			  
			  <!-- <div class="col-md-4 col-md-4 col-xs-12">
 -->			   <div class="form-group"> 
			        <label>Task Name</label>
			        <input class="form-control" name ="taskName"type="text"/>
			    </div>
			  <!--  </div>  -->
			   
	   <div class="col-md-4 col-md-4 col-xs-12"> 
			   
			
			    <!-- Form code begins -->
			    
			      <div class="form-group" id='datetimepicker6'> <!-- Date input -->
			        <label class="control-label" for="date">Start Date</label>
			        <input class="form-control" id="date" name="startDate" placeholder="YYYY/MM/DD" type="text"/>
			      </div>
			   
			     <!-- Form code ends --> 
		    </div> 
			    	<!-- test -->
			    	 <!-- Form code begins -->
			    
			      <div class="form-group" id='datetimepicker7'> <!-- Date input -->
			        <label class="control-label" for="date">End Date</label>
			        <input class="form-control" id="date" name="endDate" placeholder="YYYY/MM/DD" type="text"/>
			        <input id="vars" type="hidden" name="projectName" value="<%=projectName %>" />
			      </div>
			      <div class="col-md-4 col-md-4 col-xs-12"> 
			       
			       <div class="form-group"> 
			        <button class="btn btn-primary " name="submit" type="submit">Submit</button>
			        <input id="kk" type="hidden" name="command" value="addTask" />
			       
			      </div>
			      </div>
			     
			     
			     <!-- Form code ends --> 
			    </div>
			    	
			  </div>    
			  </div>
			
		
</form> 



<!-- This is NEW TEST TABLE -->
<div class="container-fluid task_table">
	<div id="wrapper">
	<form name="form1" action="UserServlet" method="POST">
		<table align='center' cellspacing=4 cellpadding=5 id="data_table" border=0>
			<tr>
				<th>Tasks</th>
				<th>Start Date</th>
				<th>End Date</th>
			</tr>
			
			<% for (int i=0;i<tasks.size();i++) { %>
			
			<tr id="row">
			
			
			 
				<td id="task_row<%=i+1%>"><%= tasks.get(i).getTaskName() %></td>
				<td id="startDate_row<%=i+1%>"><%=tasks.get(i).getStartDate()%></td>
				<td id="endDate_row<%=i+1%>"><%=tasks.get(i).getEndDate()%></td>
				<td>
				
				<input id="var" type="hidden" name="command" value="x" />
				<input id="token" type="hidden" name="token" value="temp" />
				<input type="hidden" name="projectName" value="<%=projectName %>" />
				<input type="hidden" name="taskName<%=i+1%>" value="<%= tasks.get(i).getTaskName() %>" />
				<input type="button" id="edit_button<%=i+1%>" value="Edit" class="edit btn btn-info" onclick="edit_row(<%=i+1%>)">
				<input type="button" id="save_button<%=i+1%>" value="Save" class="save btn btn-primary" onclick="save_row(<%=i+1%>)" style="display: none;">
				<input type="button" value="Delete" class="delete btn btn-danger" onclick="delete_row()">
				
				</td>
				
			</tr>
		
			<% } %>
			
			
		</table>
	    </form>
	</div>
</div>



<!-- THIS IS THE END OF THE NEW TEST TABLE -->

				
			<script type="text/javascript">
		
	
	
				
			function edit_row(no)
			{
						
				 document.getElementById("edit_button"+no).style.display="none";
				 document.getElementById("save_button"+no).style.display="block";
				 var task=document.getElementById("task_row"+no);
				 var startDate=document.getElementById("startDate_row"+no);
				 var endDate=document.getElementById("endDate_row"+no);
				 var task_data=task.innerHTML;
				 var startDate_data=startDate.innerHTML;
				 var endDate_data=endDate.innerHTML;
				 startDate.innerHTML="<input class='form-control' type='text' name='startDate' id='startDate_text"+no+"' value='"+startDate_data+"'>";
				 endDate.innerHTML="<input class='form-control' type='text' name='endDate' id='endDate_text"+no+"' value='"+endDate_data+"'>";
			}
			
			function save_row(i)
			{
				document.getElementById("var").value = "editTask";
				document.getElementById("token").value = i;
				document.form1.submit();
			}
			
			function delete_row()
			{
				
				document.getElementById("var").value = "deleteTask";
			
				document.form1.submit();
			}

			

			    
			    
			
			</script>
	

</body>
</html>