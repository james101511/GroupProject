<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	

	<link rel="stylesheet" type="text/css" href="Main.css"> 
	  <!-- Bootstrap -->
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	 <!--jQuery-->	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<title>Task New Version</title>
		
		
		<style type="text/css">
		
		
		.table-bordered th, .table-bordered td { 
		border: 1px solid #ddd!important 
		
		}
	
		
		
		</style>
		
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
		
		<h1><%=request.getParameter("test")%></h1>
			
			
			<!--ADD MEMBERS FROM DROP DOWN-->
		
		<div id="dropDownMembers">
			<div class="container">
				<div class="row">
				
				<div class="col-auto mr-auto"><h3>Team Members involved with the Task</h3></div>
				<div class="col-auto"></div>
	
					
					</div>
				</div>
			</div>
	
			
			
			
		<!--DROPDOWN SELECT MEMBER	-->
		<select id="myMembersOption">
		  <option value="">Add Member</option>
		  <option value="25">Member1</option>
		  <option value="35">Member2</option>
		  <option value="40">Member3</option>
		  <option value="45">Member4</option>
		</select>
		
		<p> </p>

			 
			<!--NEW TABLE!-->
		<div id="test_table" >
			<div class="container">
				<div class="row">
					<div class="col col-6 align-self-center">
						<table class="table table-bordered col " >
			
							<tbody id="MembersList">
					
								<tr>
						
									<td>Team Members </td>
								<!--	<td class="table-success colspan="1" style="text-align: center;" id="heloText" >Heloo</td>
									<td><input type="text" class="form-control" /> </td>
								-->
								</tr>
					
							</tbody>
						</table>
					</div>
					<div id="disappears">
						<div class="col col-sm-2">
					
						<button id='btn' type="button" value='REMOVE' class="btn btn-primary" > Delete </button>
					
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
			
		<script type="text/javascript">
		
		
		
		
		//ADDING TEAM MEMBER TO A LIST
		$('#myMembersOption').on('change', function() {

			var val = $(this).val(),
				text = $(this).find("option:selected").text();

		$('#MembersList').append(new Option(text, val));

		});
		
		//REMOVING TEAM MEMBER FROM LIST has to be done! so far the whole table is removed.
		
		var btn = document.getElementById('btn');
				btn.onclick = function () {
					document.getElementById('MembersList').remove();
					this.remove();
				};

		
			//Making our table disappear!
		
			document.getElementById("delete_button").onclick = function() {
			
				document.getElementById("disappears").innerHTML ="<br/>" + "";
				//document.getElementById("my-input").style.display = "none";
				
			}
			
			document.getElementById("btn").onclick = function() {
			
				document.getElementById("test_table").style.display = "none";
			
			}		
			
			
		</script>
		
		 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
		</body>
		
		</html>
		
		