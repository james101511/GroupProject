<!doctype html>
<%@ page import="java.util.*"%>
<%@ page import="DataBase.*"%>
<%
	String projectName = (String) request.getParameter("projectName");
	String email=(String)request.getAttribute("email");
%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/inviteMembers.css" /> 
<script type="text/javascript" src="${pageContext.request.contextPath }/js/inviteMember.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Main.css" />
</head>
<body>

	<div id="topbar">

		<div id="name-div" class="topbar-section">

			<a id="projectName" class="navbar-brand" href="#">Manage P&P </a>
		</div>



	</div>

	<!-- Div to clear the space between the bars-->
	<div class="clear"></div>

	<div id="down-line-bar">
		
				<div id="name-bar ">
						<div id="page-name">
							<form id="myform" action="UserServlet" method="GET">
					<input id="var" type="hidden" name="command" value="turnToProject" />
					<input type="hidden" name="email" value="<%=email%>" />
					<a href="#" onclick="document.getElementById('myform').submit()">Projects</a>
					&gt;
					<a href="#">Invite Members</a>
				</form>
						
						</div>
			   </div>
			
	</div>



	<!--Log In window -->

	<div class="wrapper">

		<form Name="form1" class="form-signin" action="UserServlet" method="POST" >

			<%-- 	action="UserServlet" method="POST" action="${pageContext.request.contextPath }/LogInPage.jsp" --%>
			
			<div> 
				<label for="staticQustion" class="form-label-3"><%=projectName%></label>
			</div>
			
			
			<label for="staticQustion" class="form-label">So... who is in your team?</label>
			<label for="staticText" class="form-label-2">Now you can invite people to your team:</label>
			
			<div id="wrapper1">
			<div id="field_div">
			<input type="button" id="button_plus" value="+" onclick="add_field();">
			</div>
			</div>
			

			<!--The skip button will lead directly to dashboard without inviting members. -->
			<!-- TODO -->
			<input id="varx" type="hidden" name="command" value="var" />
			<div>
			<input type="hidden" name="email" value="<%= email %>" />
			<input id="var2" type="hidden" name="projectName" value="<%=projectName%>" />
			<input id="token" type="hidden" name="token" value="2" />
			<input id="skip"  class="button button3" type="submit" value="Skip" onClick="buttonSkip()">
			<input id="submit"  class="button button4" type="submit" value="Invite" onClick="buttonInvite()">
			</div>
			
			<!--The Invite button will send emails to the added email addresses, send notification on the screen
			that the emails were successfully sent and then will lead to the dashboard.  -->

		</form>


	</div>
</body>
</html>