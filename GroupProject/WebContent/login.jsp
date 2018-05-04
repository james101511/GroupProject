<!doctype html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/login.css" /> 

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Main.css" />

</head>
<body>
	
	<div id="topbar">
		<div id="name-div" class="topbar-section">
			
			<a id="projectName" class="navbar-brand" href="javascript:history.go(0);">Manage P&P </a>
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