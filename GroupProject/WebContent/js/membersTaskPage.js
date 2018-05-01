/**
 * 
 */
function edit_row(i)
			{
			 document.getElementById("edit_button").style.display="none";
			 document.getElementById("save_button").style.display="block";
				
			 //var name=document.getElementById("name_row"+no);
			 var progress=document.getElementById("progress_row" + i);
			 var percentage=document.getElementById("percentage_row" + i);
				
			 //var name_data=name.innerHTML;
			 var progress_data=progress.innerHTML;

				
			 //name.innerHTML="<input type='text' id='name_text"+no+"' value='"+name_data+"'>";
			 progress.innerHTML="<input type='text' name='progress' id='progress_text' value='"+progress_data+"'>";
			 
			 percentage.innerHTML="<input id='working' type='radio' name='percentage' value='0' required>  Working <br> <input id='finished' type='radio' name='percentage' value='100' required>  Finished";
 
			}

			function save_row()
			{
				
				document.form1.submit();
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
				
			