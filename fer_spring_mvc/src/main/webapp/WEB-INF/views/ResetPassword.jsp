<jsp:include page = "Layout/Header_LeftFrame.jsp" />

<script>
     function validateResetPasswordForm(){
    	 var form = document.DashboardForm;
    	 var errorMessages = '';
    	 if(form.currentPassword.value.trim() == ''){
    		 errorMessages += "Please enter CurrentPassword<br>";
    	 }
    	 if(form.newPassword.value.trim() == ''){
    		 errorMessages += "Please enter NewPassword<br>";
    	 }
    	 if(form.confirmNewPassword.value.trim() == ''){
    		 errorMessages += "Please enter ConfirmNewPassword<br>";
    	 }
    	  
    	 if(errorMessages != ''){
    		 
    		 var trElement = document.getElementById("errorTrId");
    		 trElement.style.display = '';
    		 
    		 var tdElement = document.getElementById("errorTdId");
    		 tdElement.innerHTML = errorMessages;
    		 
    	 }else {
    		 submitForm('resetPassword');
    	 }
     }
</script>

<table align="center" border="4">
	<tr align='center'>
		<td colspan='2'>Update password</td>
	</tr>
	<tr align='left' style='display:none; color: red' id = 'errorTrId'>
		  <td colspan='2' id='errorTdId'></td>
	</tr>
	<tr>
		<td>Current Password <font color="red">*</font></td>
		<td><input type='password' name='currentPassword'></td>
	</tr>
	<tr>
		<td>New Password <font color="red">*</font></td>
		<td><input type='password' name='newPassword'></td>
	</tr>
	<tr>
		<td>Confirm New Password <font color="red">*</font></td>
		<td><input type='password' name='confirmNewPassword'></td>
	</tr>
	<tr align="center">
		<td colspan="2"><input type="button" value="Update" onclick="javascript: validateResetPasswordForm()"></td>
	</tr>
</table>

<jsp:include page = "Layout/Footer.jsp" />
