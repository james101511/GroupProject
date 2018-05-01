/**
 * 
 */
	function dashboard(i){
		document.getElementById("var").value = "checkProject";
		document.getElementById("token").value = i;
		document.form1.submit();
	}
	function delete_row(i){
		document.getElementById("var").value = "deleteProject";
		document.getElementById("token").value = i;
		document.form1.submit();
	}
