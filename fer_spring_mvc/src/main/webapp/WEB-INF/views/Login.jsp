<html>
<head>
<title>FER-Login</title>
<script>
function validateLoginForm(){
    	 var form = document.LoginForm;
    	 var errorMessages = '';
    	 if(form.username.value.trim() == ''){
    		 errorMessages += "Please enter UserName<br>";
    	 }
    	 if(form.password.value.trim() == ''){
    		 errorMessages += "Please Enter Password<br>";
    	 }
    	 
    	 if(errorMessages != ''){
    		 
    		 var trElement = document.getElementById("errorTrId");
    		 trElement.style.display = '';
    		 
    		 var tdElement = document.getElementById("errorTdId");
    		 tdElement.innerHTML = errorMessages;
    		 
    	 }else {
    		 form.submit();
    	 }
     }
</script>

</head>

<body>
    <font color = 'red'>${status}</font>
	<form action='login' method= 'post' name = 'LoginForm'>
		<table align='center' border='4'>

			<tr align='center'>
				<td colspan='2'>Login</td>
			</tr>
			<tr align='left' style='display:none; color: red' id = 'errorTrId'>
				<td colspan='2' id='errorTdId'></td>
			</tr>
			<tr>
				<td>User name</td>
				<td><input type='text' name='username'></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type='password' name='password'></td>
			</tr>
			<tr align='center'>
				<td colspan='2'><input type='button' value='login' onclick = "javascript: validateLoginForm()">
					&nbsp;&nbsp;&nbsp; <a href="showRegistration">Registration</a></td>
			</tr>


		</table>

	</form>
</body>
</html>