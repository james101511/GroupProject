<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Main.css" />
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

	</style>
  </head>
  <body>
  
   <div id="topbar">
		<div id="name-div" class="topbar-section">
			
			<a id="projectName" class="navbar-brand" href="homepage.jsp">Manage P&P </a>
		</div>
  </div>
			
			<!-- Div to clear the space between the bars-->
		<div class="clear"></div>
		
		<div id="down-line-bar">
			<div id="name-bar ">
				<div id="page-name">
				
					<a   href="homepage.jsp" >Home</a> &gt;
					<a   href="#" >Log In</a>
				</div>
			</div>
		
		
		
		</div>
  


    <div class="wrapper">
    <form class="form-signin" action="${pageContext.request.contextPath }/UserServlet" method="POST">
    	<input type="hidden" name="command" value="login"/>   
    	<label for="staticText" class=class="form-signin-heading">Enter your account and password</label>  
		<input type="email" id="username" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="xyz@something.com" name="email" placeholder="Email Address" required="" autofocus="" />
		<input type="password" id="password" class="form-control" name="password" placeholder="Password" required=""/>      
		<button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>  
		<p id="question_ac">Don't have an account yet?</p><a class="account_link" href="signUp.jsp"> Create new account</a>
    </form>
    </div>
    

   </body>
</html>