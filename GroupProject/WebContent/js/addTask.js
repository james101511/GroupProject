/**
 * 
 */


			 $( function() {
				 $( "#datepickerx" ).datepicker();
			 } );
			 $( function() {
				 $( "#datepickery" ).datepicker();
			 } );
			
			function edit_row(no)
			{
					
				 document.getElementById("edit_button"+no).style.display="none";
				 document.getElementById("save_button"+no).style.display="block";
				 var task=document.getElementById("task_row"+no);
				 var startDate=document.getElementById("startDate_row"+no);
				 var endDate=document.getElementById("endDate_row"+no);
				 var task_data=task.innerHTML;
				 var startDate_data=startDate.innerHTML;
				 var endDate_data=endDate.innerHTML;
				 startDate.innerHTML="<input pattern='\d{1,2}/\d{1,2}/\d{4}' id='datepicker1' class='form-control' type='text' name='startDate' id='startDate_text"+no+"' value='"+startDate_data+"'>";
				 endDate.innerHTML="<input pattern='\d{1,2}/\d{1,2}/\d{4}' id='datepicker2' class='form-control' type='text' name='endDate' id='endDate_text"+no+"' value='"+endDate_data+"'>";
				 $( function() {	
						$( "#datepicker1" ).datepicker();
					  } );
				 $( function() {	
						$( "#datepicker2" ).datepicker();
					  } );
			} 
			
			function save_row(i)
			{
				document.getElementById("var").value = "editTask";
				document.getElementById("token").value = i;
				document.form1.submit();
			}
			
			function delete_row(i)
			{
				
				document.getElementById("var").value = "deleteTask";
				document.getElementById("token").value = i;
				document.form1.submit();
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