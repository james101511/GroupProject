<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<style type="text/css">
	
		body {
			background: #eee !important;	
		}

		.wrapper {	
			margin-top: 80px;
			margin-bottom: 80px;
		}

		.form-signin {
			max-width: 380px;
			padding: 15px 35px 45px;
			margin: 0 auto;
			background-color: #fff;
			border: 1px solid rgba(0,0,0,0.1);  

		.form-signin-heading,
		.checkbox {
			margin-bottom: 30px;
			font-size: 10pt;
		}

		.checkbox {
			font-weight: normal;
		}

		.form-control {
			 position: relative;
			 font-size: 16px;
			 height: auto;
			 padding: 10px;
			@include box-sizing(border-box);
			

			&:focus {
			  z-index: 2;
			}
		}

		input[type="text"] {
		  margin-bottom: -1px;
		  border-bottom-left-radius: 0;
		  border-bottom-right-radius: 0;
		}

		input[type="password"] {
		  margin-bottom: 20px;
		  border-top-left-radius: 0;
		  border-top-right-radius: 0;
		}
	}
		#topbar {
				
			width:100%;
			margin:0 auto;
			height:80px;
			background-color: #2C3F50;
				}
			
			
		#projectName {
			
			color:white;
			font-size:36px;
			padding: 10px -50px 10px 10px;
			
			
			}
			
		#page-name {
			
			color:white;
			font-size: 15px;
			padding: 10px -20px 10px 10px;
			text-decoration: none; 
			margin-top: 5px;
			margin-left: 4px;

		}
			
		.topbar-section{
		
			float:left;
			padding-top:10px;
			}
			


		.topbar-menu{

			font-weight: bold;
			font-size:20px;
			height: 27px;
			color:white;
			float:right;
			padding: 30px 80px 10px 10px;	
			margin-left: 0;
			}
			
		#down-line-bar {

			background-color: #FC4349;
			width:100%;
			height:40px;
			}
		.account_link {
		
			font-size: 9pt;
		}
		
		#question_ac {
		
			font-size:9pt;
		
		}
		#submit-button {
		
			margin-left:205px;
			margin-top:10px;
		}
		
		#skip-button {
		
			margin-top:8px;
		}
		#name-bar {
		
			margin: 0px;
			padding: 0px;
			width: auto;
		}
		
		#text-container {
		
		width: 1000px;
		margin: 0 auto;
		padding:auto;
		text-align:center;
		margin-top: 100px;
		padding-bottom: 20px;
		height: 30px;
		
		}
		
		.form-label {
			
			font-size: 18px;
			font-weight: bold;
			
		}
		
		.form-label-2 {
			
			font-size:14px;
			font-weight: normal;
		}
		
		.navbar-brand {
		
		color:white;
		}
		

	</style>
  </head>
  <body>
  
  <div id="topbar">
		
		<div id="name-div" class="topbar-section">
			
			<a id="projectName" class="navbar-brand" href="#">Manage P&P </a>
		</div>
				
		<div class="topbar-section topbar-menu">
			
			<a class="navbar-brand" href="#">Menu</a>			
			
		</div>
			
	</div>
			
			<!-- Div to clear the space between the bars-->
		<div class="clear"></div>
		
		<div id="down-line-bar">
			<div id="name-bar">
				
			<h1 id="page-name" class="navbar-brand" >Invite Team Members</h1>

			</div>
		</div>
		
		
		
		<!--Log In window -->
  
    <div class="wrapper">
	
        <form class="form-signin" action="UserServlet" method="POST" action="${pageContext.request.contextPath }/LogInPage.jsp">
			
			<label for="staticQustion" class="form-label">Who is on your team?</label>
			<label for="staticText" class="form-label-2">Add people to your team:</label>
			<input type="text" class="form-control" name="email" placeholder="email" required=""/>   
			<input type="text" class="form-control" name="email" placeholder="email" required=""/> 
			<input type="text" class="form-control" name="email" placeholder="email" required=""/> 
			<input type="text" class="form-control" name="email" placeholder="email" required=""/> 
			<!--The skip button will lead directly to dashboard without inviting members. -->
			<a id="skip-button" class="btn btn-lg btn-basic btn-sm" type="submit" href="Dashboard.jsp" >Skip</a>  
			<!--The Invite button will send emails to the added email addresses, send notification on the screen
			that the emails were successfully sent and then will lead to the dashboard.  -->
			<button id="submit-button" class="btn btn-lg btn-primary btn-sm" type="submit" >Invite</button>  
		
		</form>
 
  </div>
   </body>
</html>