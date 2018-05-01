function rename()
	{
 		document.getElementById("rename_button").style.display="none";
 		document.getElementById("save_button").style.display="block";
	
 		var ProjectName = document.getElementById("editable_projectname");
 		var newProjectName = ProjectName.innerHTML;

 		ProjectName.innerHTML="<input type='text' name='newProjectName' id='editable_projectname' value='"+newProjectName+"'>";
 		

	}
	function save()
	{
		document.form1.submit();
	}
	function delete_member(i)
	{
		document.getElementById("token2").value = i;
		document.form3.submit();
		
	}
	function goDashboard()
	{
		document.getElementById("var").value = "turnToDashboard";
		document.getElementById('myform').submit()
	}
	function goProject()
	{
		
		document.getElementById('myform').submit()
	}