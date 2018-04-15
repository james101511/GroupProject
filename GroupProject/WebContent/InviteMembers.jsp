<!doctype html>
<%@ page import="java.util.*"%>
<%@ page import="DataBase.*"%>
<%
	String projectName = (String) request.getParameter("projectName");
%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
	border: 1px solid rgba(0, 0, 0, 0.1); . form-signin-heading , .checkbox
	{ margin-bottom : 30px;
	font-size: 10pt;
}

.checkbox {
	font-weight: normal;
}

.form-control {
	
	position: relative;
	font-size: 16px;
	height: auto;
	width: 50px;
	margin: 10px;
	padding: 0px;
	@
	include
	box-sizing(border-box);
	&:
	focus
	{
	z-index
	:
	2;
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
	font-size: 9pt;
}

#submit-button {
	margin-left: 205px;
	margin-top: 10px;
}

#skip-button {
	margin-top: 8px;
}

#name-bar {
	margin: 0px;
	padding: 0px;
	width: auto;
}

#text-container {
	width: 1000px;
	margin: 0 auto;
	padding: auto;
	text-align: center;
	margin-top: 100px;
	padding-bottom: 20px;
	height: 30px;
}


#wrapper1
{
  padding:0px;
  margin:0px auto;
  font-family:helvetica;
  text-align:center;
}

#button_plus
{
  margin-left: -12px;
  background:none;
  color:white;
  border:none;
  width:35px;
  height:35px;
  border-radius:3px;
  background-color:#06c852;
  font-size:18px;
}
#button_minus
{
  background:none;
  color:white;
  border:none;
  width:35px;
  height:35px;
  border-radius:3px;
  background-color:#e03d39;
  font-size:18px;
}

.form-label {
	font-size: 14px;
	font-weight: normal;
}

.form-label-2 {
	font-size: 14px;
	font-weight: normal;
}

.form-label-3 {
	font-size: 30px;
	font-weight: bold;
	color: #7b74aa;
}

.navbar-brand {
	color: white;
}
input[type="text"]
{
  width:200px;
  height:35px;
  margin-right:2px;
  padding:5px;
}

.button {
	width: 140px;
	height: 30px;
    background-color: #6f72db; /* Green */

    color: white;

   
    text-decoration: none;

    margin: 4px 2px;
    cursor: pointer;
}
.button3 {border-radius: 8px;}
.button4 {border-radius: 8px}
</style>
</head>
<body>

	<div id="topbar">

		<div id="name-div" class="topbar-section">

			<a id="projectName" class="navbar-brand" href="#">Manage P&P </a>
		</div>

		<div class="topbar-section topbar-logIn">

			<a class="navbar-brand" href="#">Menu</a>

		</div>

	</div>

	<!-- Div to clear the space between the bars-->
	<div class="clear"></div>

	<div id="down-line-bar">
		
				<div id="name-bar ">
						<div id="page-name">
							<a   href="CreateProject.jsp" >Projects</a> &gt;
							<a   href="#" >Invite Members</a>
						</div>
					</div>
			
	</div>



	<!--Log In window -->

	<div class="wrapper">

		<form Name="form1" class="form-signin" action="UserServlet" method="POST" action="${pageContext.request.contextPath }/Dashboard.jsp">

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
			<input id="var" type="hidden" name="command" value="var" />
			<div>
			<input id="var2" type="hidden" name="projectName" value="<%=projectName%>" />
			<input id="skip"  class="button button3" type="submit" value="Skip" onClick="buttonSkip()">
			<input id="submit"  class="button button4" type="submit" value="Invite" onClick="buttonInvite()">
			</div>
			
			<!--The Invite button will send emails to the added email addresses, send notification on the screen
			that the emails were successfully sent and then will lead to the dashboard.  -->


			<SCRIPT LANGUAGE="JavaScript">
				function buttonSkip() {
					document.getElementById("var").value = "skip";
					document.form1.submit();
				}
				
				function buttonInvite() {
					document.getElementById("var").value = "invite";
					document.form1.submit();
				}
				
				function add_field() {
					var total_text=document.getElementsByClassName("input_text");
					total_text=total_text.length+1;
					document.getElementById("field_div").innerHTML=document.getElementById("field_div").innerHTML+
					"<p id='input_text"+total_text+"_wrapper'><input type='text' class='input_text'  id='input_text"+total_text+"' name='Email"+total_text+"' placeholder='Email'><input type='button' id='button_minus' value='-' onclick=remove_field('input_text"+total_text+"');></p>";
				}
				
				function remove_field(id) {
					  document.getElementById(id+"_wrapper").innerHTML="";
				}
				
			</SCRIPT>

		</form>


	</div>
</body>
</html>