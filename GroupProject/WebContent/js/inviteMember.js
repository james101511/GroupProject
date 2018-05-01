/**
 * 
 */



				function buttonSkip() {
					document.getElementById("varx").value = "skip";
					document.form1.submit();
				}
				
				function buttonInvite() {
					document.getElementById("varx").value = "invite";
					document.form1.submit();
				}
				
				function add_field() {
					var total_text=document.getElementsByClassName("input_text");
					total_text=total_text.length+1;
					document.getElementById("field_div").innerHTML=document.getElementById("field_div").innerHTML+
					"<p id='input_text"+total_text+"_wrapper'><input type='email' class='input_text' pattern='[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$' title='xyz@something.com' id='input_text"+total_text+"' name='Email"+total_text+"' placeholder='Email' required><input type='button' id='button_minus' value='-' onclick=remove_field('input_text"+total_text+"');></p>";
				}
				
				function remove_field(id) {
					  document.getElementById(id+"_wrapper").innerHTML="";
				}