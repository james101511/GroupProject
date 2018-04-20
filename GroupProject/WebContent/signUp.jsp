<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<link rel="stylesheet" type="text/css" href="Main.css"> 
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
		
		.account_link {
		
			font-size: 9pt;
		}
		
		#question_ac {
		
			font-size:9pt;
		
		}
		.container{
		backgroung-color: green;
		height: 100%;
		weight: 100%;
		margin:o;
		
		}

	</style>
  </head>
  
  <body>
  
  <div id="topbar">
		
		<div id="name-div" class="topbar-section">
			
			<a id="projectName" class="navbar-brand" href="Homepage.jsp">Manage P&P </a>
		</div>
				
		<div class="topbar-section topbar-logIn">
			
			<a class="navbar-brand" href="LogInPage.jsp">Log In</a>			
			
		</div>
			
	</div>
			
			<!-- Div to clear the space between the bars-->
		<div class="clear"></div>
		
		<div id="down-line-bar">
		
			<div id="name-bar ">
				<div id="page-name">
				
					<a   href="Homepage.jsp" >Home</a> &gt;
					<a   href="#" >Sign Up</a>
				</div>
			</div>
		
		
		</div>
		
		<!--Log In window -->
  <div class="container">
    <div class="wrapper">
        <form class="form-signin" action="UserServlet" method="POST" action="${pageContext.request.contextPath }/LogInPage.jsp">
			<input type="hidden" name="command" value="createAccount"/>
			<h3 class="form-signin-heading">Personal Details</h3>
			<input type="text" class="form-control" pattern="[A-Za-z]+" title="only letters" name="firstName" placeholder="First Name" required/>   
			<input type="text" class="form-control" pattern="[A-Za-z]+" title="only letters" name="lastName" placeholder="Last Name" required/> 
			<input type="email" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="xyz@something.com" name="email" placeholder="Email Address" required autofocus="" />
			<input type="password" class="form-control" pattern=".{8,}" title="eight or more characters" name="password" placeholder="Password (at least 8 characters)" required/>   
			<button class="btn btn-lg btn-primary btn-block" type="submit" >Sign Up</button>  
       </form>
    </div>
   </div>
</body>
</html>