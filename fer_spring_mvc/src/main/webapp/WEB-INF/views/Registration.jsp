<html>
<head>
<title>FER-Registration</title>
<script>
     function validateRegistrationForm(){
    	 var form = document.RegistrationForm;
    	 var errorMessages = '';
    	 if(form.firstName.value.trim() == ''){
    		 errorMessages += "Please enter FirstName<br>";
    	 }
    	 if(form.lastName.value.trim() == ''){
    		 errorMessages += "Please enter LastName<br>";
    	 }
    	 if(form.email.value.trim() == ''){
    		 errorMessages += "Please enter Email<br>";
    	 }
    	 if(form.username.value.trim() == ''){
    		 errorMessages += "Please Enter UserName<br>";
    	 }
    	 if(form.password.value.trim() == ''){
    		 errorMessages += "Please Enter Password<br>";
    	 }
    	 if(form.mobile.value.trim() == ''){
    		 errorMessages += "Please Enter Mobile<br>";
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
     
     
     function isEmailAvailable(email){
    	 var xhttp = new XMLHttpRequest();
    	 var url = "AJAX.jsp?emailAddress=" + email;
    	 
    	 xhttp.onload = function(){
    		 var status = '';
    		 var colorName = '';
    		 if(this.responseText.trim() == 'Y'){
    			 status =  "Email is available....!";
    			 colorName = 'green';
    		 }else {
    			 status = "Email is Not available...!";
    			 colorName = 'red';
    		 }
    		 
    		 var emailTdElement =document.getElementById('emailTdId');
    		 emailTdElement.innerHTML = status;
    		 
    		 var emailTrElement =document.getElementById('emailTrId');
    		 emailTrElement.style.color = colorName;
    		 
    		 emailTrElement.style.display = '';	 
    	 }
    	 
    	 xhttp.open("GET" ,url,true);
    	 xhttp.send();
     }
     
     
</script>

</head>
<body>
    <font color = 'red' >
    ${status}
    </font>
	<form action="registration" method='post' name = 'RegistrationForm'>
		<table align="center" border="4">
			<tr align='center'>
				<td colspan='2'>Registration</td>
			<tr align='left' style='display:none; color: red' id = 'errorTrId'>
				<td colspan='2' id='errorTdId'></td>
			</tr>
			<tr>
				<td>First Name <font color="red">*</font></td>
				<td><input type='text' name='firstName'></td>
			</tr>
			<tr>
				<td>Middle Name</td>
				<td><input type='text' name='middleName'></td>
			</tr>
			
			<tr>
				<td>Last Name <font color="red">*</font></td>
				<td><input type='text' name='lastName'></td>
			</tr>
			<tr>
				<td>Email <font color="red">*</font></td>
				<td><input type='text' name='email' onchange = "javascript: isEmailAvailable(this.value)"></td>
			</tr>
			<tr align='left' style='display:none' id = 'emailTrId'>
				<td colspan='2' id='emailTdId'></td>
			</tr>
			
			<tr>
				<td>User Name <font color="red">*</font></td>
				<td><input type='text' name='username'></td>
			</tr>
			<tr>
				<td>Password <font color="red">*</font></td>
				<td><input type='password' name='password'></td>
			</tr>
			<tr>
				<td>Mobile Number <font color="red">*</font></td>
				<td><input type='text' name='mobile'></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="button" value="Register" onclick = "javascript: validateRegistrationForm()" ></td>
			</tr>
		</table>

	</form>
</body>
</html>