<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@ page import="DataBase.*" %>
<%
	String projectName = (String) request.getParameter("projectName");
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
				
				<h1 id="page-name" class="navbar-brand" >Add Tasks</h1>

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
			        <input class="form-control" name ="TaskName"type="text"/>
			    </div>
			  <!--  </div>  -->
			   
	   <div class="col-md-4 col-md-4 col-xs-12"> 
			   
			
			    <!-- Form code begins -->
			    
			      <div class="form-group" id='datetimepicker6'> <!-- Date input -->
			        <label class="control-label" for="date">Start Date</label>
			        <input class="form-control" id="date" name="StartDate" placeholder="MM/DD/YYY" type="text"/>
			      </div>
			   
			     <!-- Form code ends --> 
		    </div> 
			    	<!-- test -->
			    	 <!-- Form code begins -->
			    
			      <div class="form-group" id='datetimepicker7'> <!-- Date input -->
			        <label class="control-label" for="date">End Date</label>
			        <input class="form-control" id="date" name="EndDate" placeholder="MM/DD/YYY" type="text"/>
			        <input id="vars" type="hidden" name="projectName" value="<%=projectName %>" />
			      </div>
			      <div class="col-md-4 col-md-4 col-xs-12"> 
			       <div class="form-group"> 
			        <button class="btn btn-primary " name="submit" type="submit">Submit</button>
			        <input id="var" type="hidden" name="command" value="ADDTASK" />
			       
			      </div>
			      </div>
			     
			     
			     <!-- Form code ends --> 
			    </div>
			    	
			  </div>    
			  </div>
			
		
</form>
			
			
			<script type="text/javascript">
		
				
			function myFunction() {
				var node = document.createElement("TR");
				var textnode = document.createTextNode(" New Task");
				node.appendChild(textnode);
				document.getElementById("bootstrap-iso").appendChild(node);
	}
			$(document).ready(function(){
			      var date_input=$('input[name="date"]'); //our date input has the name "date"
			      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
			      var options={
			        format: 'mm/dd/yyyy',
			        container: container,
			        todayHighlight: true,
			        autoclose: true,
			      };
			      date_input.datepicker(options);
			    })
			    
			    
			
			</script>
	

</body>
</html>