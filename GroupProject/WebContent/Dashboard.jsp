<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>DashBoard</title>
	  <link rel="stylesheet" type="text/css" href="Main.css"> 
	  <!-- Bootstrap -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	  

	
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
		
		<div class="container-fluid">
		
			<div class="dropdown project-members">
			  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
			
		 <!--Required JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>		

</body>
</html>