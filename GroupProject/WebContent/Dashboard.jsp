<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	
</head>
<body>
	<!-- Top bars -->
			<div id="topbar">
		
				<div id="name-div" class="topbar-section">
			
					<span id="projectName">Manage P&P </span>
				</div>
				
				<div class="topbar-section topbar-logIn">
			<a class="navbar-brand" href="Homepage.jsp">Log Out</a>
			
				</div>
			
			</div>
			
			<!-- Div to clear the space between the bars-->
			<div class="clear"></div>
		
		
			<div id="down-line-bar">
			<div id="name-bar">
				
			<h1 id="page-name" class="navbar-brand" >DashBoard</h1>

			</div>
		</div>
		
		<!-- Content of the page after the bars -->
		
		<div class="container container-project-name">
		 
			<div class="dropdown project-members"> 
			  <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    Project 1
			  </button>
			  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			  	<a class="dropdown-item" href="#">Team Members</a>
			    <a class="dropdown-item" href="#">Member 1</a>
			    <a class="dropdown-item" href="#">Member 2</a>
			    <a class="dropdown-item" href="#">Member 3</a>
			    <a class="dropdown-item" href="#">Member 4</a>
			    <a class="dropdown-item" href="#">Member 5</a>
			  </div>
			</div>
		</div>
			
		<div class="container container-progress-bar">
			<div class="row justify-content-end">
				<div class="progress col col-9" style="height: 20px;">
  				<div class="progress-bar bg-success" role="progressbar" style="width: 35%;" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100">35%</div>
				</div>
			</div>
		</div>
		<!-- GANTT CHART -->
		 <div class="container container-gantt-chart">
			
			<div id="ganttChart"></div>
				<br/><br/>
				<div id="eventMessage"></div>
		</div>
				<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery_1.4.2.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath }/js/date.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery_ui_1.8.4.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.ganttView.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath }/js/data.js"></script>
				<script type="text/javascript">
					$(function () {
						$("#ganttChart").ganttView({ 
							data: ganttData,
							slideWidth: 1500,
							behavior: {
								onClick: function (data) { 
									var msg = "You clicked on an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
									$("#eventMessage").text(msg);
								},
								onResize: function (data) { 
									var msg = "You resized an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
									$("#eventMessage").text(msg);
								},
								onDrag: function (data) { 
									var msg = "You dragged an event: { start: " + data.start.toString("M/d/yyyy") + ", end: " + data.end.toString("M/d/yyyy") + " }";
									$("#eventMessage").text(msg);
								}
							}
						});
						
						// $("#ganttChart").ganttView("setSlideWidth", 600);
					});
				</script>
			
			
			
			
			
	
			
			
			
			
		 <!--Required JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>		

</body>
</html>