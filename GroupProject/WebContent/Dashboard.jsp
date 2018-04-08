<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.util.*" %>
<%@ page import="DataBase.*" %>
<%
	String projectName =(String)request.getParameter("projectName");
	List<Task> tasks = (List<Task>)request.getAttribute("tasks");
	List<Involve> Involves = (List<Involve>) request.getAttribute("Involve");
%>
<html lang="en">
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>DashBoard</title>
	  <link rel="stylesheet" type="text/css" href="Main.css"> 
	  <!-- Bootstrap -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	 
	 <!-- Links for the Gantt chart -->
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jquery_ui_1.8.4.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jquery.ganttView.css" />
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script type="text/javascript">  
 	google.charts.load('current', {'packages':['gantt']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Task ID');
      data.addColumn('string', 'Task Name');
      data.addColumn('string', 'Resource');
      data.addColumn('date', 'Start Date');
      data.addColumn('date', 'End Date');
      data.addColumn('number', 'Duration');
      data.addColumn('number', 'Percent Complete');
      data.addColumn('string', 'Dependencies');
      var rows = [];
      
      	data.addRows([
      		<% for (int i=0;i<tasks.size();i++) { %>
      		
     ['<%=String.valueOf(i+5)%>',  '<%= tasks.get(i).getTaskName() %>','winter',
               		new Date(<%=tasks.get(i).getStartDate().substring(0,4)%>, <%=tasks.get(i).getStartDate().substring(4,6)%>-1, <%=tasks.get(i).getStartDate().substring(6,8)%>), new Date(<%=tasks.get(i).getEndDate().substring(0,4)%>, <%=tasks.get(i).getEndDate().substring(4,6)%>-1, <%=tasks.get(i).getEndDate().substring(6,8)%>), null, 100, null],
            <% } %>
           ]
        );
      	/* data.addRows([
            ['2014Spring', 'Spring 2014', 'spring',
             new Date(2014, 2, 22), new Date(2014, 5, 20), null, 100, null],
            ['2014Summer', 'Summer 2014', 'summer',
             new Date(2014, 5, 21), new Date(2014, 8, 20), null, 100, null],
            ['2014Autumn', 'Autumn 2014', 'autumn',
             new Date(2014, 8, 21), new Date(2014, 11, 20), null, 100, null],
            ['2014Winter', 'Winter 2014', 'winter',
             new Date(2014, 11, 21), new Date(2015, 2, 21), null, 100, null],
            ['2015Spring', 'Spring 2015', 'spring',
             new Date(2015, 2, 22), new Date(2015, 5, 20), null, 50, null],
            ['2015Summer', 'Summer 2015', 'summer',
             new Date(2015, 5, 21), new Date(2015, 8, 20), null, 0, null],
            ['2015Autumn', 'Autumn 2015', 'autumn',
             new Date(2015, 8, 21), new Date(2015, 11, 20), null, 0, null],
            ['2015Winter', 'Winter 2015', 'winter',
             new Date(2015, 11, 21), new Date(2016, 2, 21), null, 0, null],
            ['Football', 'Football Season', 'sports',
             new Date(2014, 8, 4), new Date(2015, 1, 1), null, 100, null],
            ['Baseball', 'Baseball Season', 'sports',
             new Date(2015, 2, 31), new Date(2015, 9, 20), null, 14, null],
            ['Basketball', 'Basketball Season', 'sports',
             new Date(2014, 9, 28), new Date(2015, 5, 20), null, 86, null],
            ['Hockey', 'Hockey Season', 'sports',
             new Date(2014, 9, 8), new Date(2015, 5, 21), null, 89, null]
          ]);
  */
      

      var options = {
        height: 400,
        gantt: {
          trackHeight: 30
        }
      };

      var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

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
			<a class="navbar-brand" href="Homepage.jsp">Log Out</a>
			
				</div>
			
			</div>
			
			<!-- Div to clear the space between the bars-->
			<div class="clear"></div>
		
		
			<div id="down-line-bar">
			<div id="name-bar">
				
			<h1 id="page-name" class="navbar-brand" ><%=projectName %></h1>

			</div>
		</div>
		
		<!-- Content of the page after the bars -->
		
		<div class="container container-project-name">
		 
			<div class="dropdown project-members"> 
			
			  <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    Tasks
			  </button>
			  
			   
			  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			  
			   
			  	<a class="dropdown-item" href="#"></a>
				<% for (int i=0;i<tasks.size();i++) { %>
				<form Name="form1" class="form-signin" action="UserServlet" method="GET">
				<input id="var" type="hidden" name="command" value="CHECKTASKINVOLVE" />
			   <button class="dropdown-item" name="taskName" value="<%=tasks.get(i).getTaskName()%>" ><%=tasks.get(i).getTaskName()%></button> 
			   </form>
			 <% } %>
			 
			 
			<SCRIPT LANGUAGE="JavaScript">
				function buttonSkip() {
					document.getElementById("var").value = "Skip";

					document.form1.submit();

				}
				
			</SCRIPT> 
				
		
			
				
			  </div>
			
			</div>
				
				
			
		</div>
		<br>
			
		<div class="container container-progress-bar">
			<div class="row justify-content-end ">
				<div class=col-sm-9>
					<div class="progress " style="height: 20px;">
  					<div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 35%;" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100">35%</div>
					</div>
				</div>
			</div>
		</div>
		<button value="addTask" onclick="javascript:location.href='AddTask.jsp?projectName=<%=projectName%>'" >Edit Task</button>
		<!-- GANTT CHART -->
		 <div id="chart_div"></div>
			
			
			
			
	
			
			
			
			
		 <!--Required JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>		

</body>
</html>