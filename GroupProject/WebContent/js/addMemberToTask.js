/**
 * 
 */

			function delete_row(i)
			{
				document.getElementById("delete"+i).name= "deleteUserEmail";
			 	document.getElementById("var").value = "deleteTaskMember";

				document.form2.submit();
			}

			 function add_row()
			{
			 
				document.getElementById("var").value = "addTaskMember";

				document.form2.submit();
			 
			} 
			 function goDashboard()
			{
				document.getElementById("var2").value = "turnToDashboard";
				document.getElementById('myform').submit()
			}
			function goProject()
			{
				document.getElementById('myform').submit()
			}