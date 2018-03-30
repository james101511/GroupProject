<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	

	<title>Task</title>

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
				<div id="name-bar">
				
				<h1 id="page-name" class="navbar-brand" >Task</h1>

				</div>
			</div>

		<!-- Content of the page after the bars -->
		
		<div class="container container-project-name">
		<h3>Taks1 </h3>
		
			<table class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col">Members currently working on this task</th>
			    </tr>
			  </thead>
			  <tbody id="myList">
			    <tr>
			      <td><a href="#">Mark</a></td>
			    </tr>
			    <tr>
			      <td>Jacob</td>
			    </tr>
			    <tr>
			      <td>Larry</td>
			    </tr>
			  </tbody>
			</table>
			
			<!-- FOR ADDING ELEMENT ON EMPTY SPACE-->
					<p id="emptyParagraph"></p>


					<button type="button" class="btn btn-light" onclick="myFunction()">+</button>
			
			</div>
			
			
			
			<script type="text/javascript">
		
				
			function myFunction() {
				var node = document.createElement("TR");
				var textnode = document.createTextNode(" New Member");
				node.appendChild(textnode);
				document.getElementById("myList").appendChild(node);
	}
			
			
			
			</script>
	

</body>
</html>