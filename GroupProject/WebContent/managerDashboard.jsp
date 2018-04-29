<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*" %>
<%@ page import="DataBase.*" %>
<%
	String projectName =(String)request.getAttribute("projectName");
	List<Task> tasks = (List<Task>)request.getAttribute("tasks");
	/* List<Project> projects = (List<Project>) request.getAttribute("projects"); */
	String userEmail =(String)request.getAttribute("userEmail");
	String projectProgress = (String)request.getAttribute("projectProgress");

%>
<html lang="en">
<head>
<!-- Required meta tags -->
	
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,400italic,600italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/step-progress.min.css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>DashBoard</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Main.css" />
	  <!-- Bootstrap -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	 
	 <!-- Links for the Gantt chart -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
 <style type="text/css">

h1{
color: #2C3F50;
 padding: 15px;

}

#projectProgress {
	color: #01dd00;
}
</style>
 
 
 <script type="text/javascript">  
 	google.charts.load('current', {'packages':['gantt']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Task ID');
      data.addColumn('string', 'Task Name');
/*       data.addColumn('string', 'Resource'); */
      data.addColumn('date', 'Start Date');
      data.addColumn('date', 'End Date');
      data.addColumn('number', 'Duration');
      data.addColumn('number', 'Percent Complete');
      data.addColumn('string', 'Dependencies');
      var rows = [];
      <% for (int i=0;i<tasks.size();i++) { %>
      	data.addRows(
      				 [
			      		['<%=String.valueOf(i+5)%> ','<%=tasks.get(i).getTaskName()%>',
			      		  new Date(<%=tasks.get(i).getStartDate().substring(6,10)%>, <%=tasks.get(i).getStartDate().substring(0,2)%>-1, <%=tasks.get(i).getStartDate().substring(3,5)%>), 
			      		  new Date(<%=tasks.get(i).getEndDate().substring(6,10)%>,   <%=tasks.get(i).getEndDate().substring(0,2)%>-1, <%=tasks.get(i).getEndDate().substring(3,5)%>), 
			      		  null, <%=tasks.get(i).getTaskProgress()%>, null
			      		],
        				
        				 ]
      				);
      	<% } %> 
      	

      var options = {
        height: 400,
        gantt: {
          trackHeight: 30
        }
      };

      var chart = new google.visualization.Gantt(document.getElementById('chart_div'));
     /*  if (rows[0]==null)
		{
    	  	
		} */
     
      chart.draw(data, options);
    	 
		 
		
      
    }

     
</script>




</head>
<body>
	<!-- Top bars -->
			<div id="topbar">
		
				<div id="name-div" class="topbar-section">
			
			<!-- need to fix -->
					<a id="projectName"  href="javascript:history.go(0);">Manage P&P </a>
				</div>
				
				<div class="topbar-section topbar-logIn">
			<a class="navbar-brand" href="homepage.jsp">Log Out</a>
			
				</div>
			
			</div>
			
			<!-- Div to clear the space between the bars-->
			<div class="clear"></div>
		
		
			<div id="down-line-bar">
			<div id="name-bar">


				<div id="name-bar ">
						<div id="page-name">
						<form id="myform" action="UserServlet" method="GET">
							<input id="var" type="hidden" name="command" value="turnToProject" />
							<input type="hidden" name="email" value="<%=userEmail%>" />
							<a   href="#" onclick="document.getElementById('myform').submit()">Projects</a> &gt;
							<a   href="#" >Dashboard</a> 
						</form>
						
						</div>
					</div>
			</div>
		</div>
		<div id="greeting-user">
			<h5 class="greeting-user" ><%=projectName %></h5>
			<h5  class="greeting-user" >Hello,  <%=userEmail%></h5>
		</div>
		
<%-- 		<table id="projectProgress" class="table table-bordered" align='center' cellspacing=2 cellpadding=5 id="data_table" border=0>
			<tr>
				<th>#Project_Progress</th>
				<th> <%=projectProgress %>% </th>
			</tr>														
		</table> --%>
		<section>
                <div class="steps">
                    <ul class="steps-container">
                    
                    <li style="width:100%;">
                        <div class="step" >

                            <div class="step-current">#Project Progress</div>
                            <div class="step-description"><%=projectProgress %>%</div>
                        </div>
                    </li>
                    <div class="step-bar" style="width: <%=projectProgress%>%;"></div>
                </div>
		</section>

		<!-- Content of the page after the bars -->
		
	<div class="container container-project-name">	
			<!-- <div class="dropdown project-members">  -->
			
			 <div class="row ">
    			<div class="col-6 col-md-2">
					  <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    Tasks
					  </button>
			
					  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					  	<a class="dropdown-item" href="#"></a>
						<% for (int i=0;i<tasks.size();i++) { %>
						<form Name="form1" class="form-signin" action="UserServlet" method="GET">
						<input id="var" type="hidden" name="command" value="checkTaskDetail" />
						<input type="hidden" name="userEmail" value="<%=userEmail%>" />
						<input type="hidden" name="projectName" value="<%=projectName %>" />
					   <button class="dropdown-item" name="taskName" value="<%=tasks.get(i).getTaskName()%>" ><%=tasks.get(i).getTaskName()%></button> 
					   </form>
						 <% } %>
			  		</div>
				</div>
	</div>
	</div>
	
	
	<br>
	<br>
	<br>
		

		<form Name="form2" class="form-signin" action="UserServlet" method="POST">
		<input type="hidden" name="projectName" value="<%=projectName%>" />
		<input type="hidden" name="userEmail" value="<%=userEmail%>" />
		<input id="var2" type="hidden" name="command" value="temp"  />
		<input type="button" class="btn btn-primary mb-2" value="EditTasks"onclick='show()' >
		<input type="button" class="btn btn-primary mb-2" value="EditProject"onclick='edit()' >
		</form>

		<!-- GANTT CHART -->
		 <div id="chart_div"></div>
			
			
			
			
	
			
			
			
			
		 <!--Required JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>		
	<script type="text/javascript">
  		
  	

  		function edit(){
  			
  			//when save ,make the text input become a submit button 
			document.getElementById("var2").value = "listMembersInProject";
			
			document.form2.submit();
  		}
  		function show(){
			document.getElementById("var2").value = "getAllTask";
			
			document.form2.submit();
  		}

  	</script>
</body>
</html>