<jsp:include page = "Layout/Header_LeftFrame.jsp" />

<script>
     function validateExpenseReportForm(){
    	 var form = document.DashboardForm;
    	 var errorMessages = '';
    	 if(form.type.value.trim() == ''){
    		 errorMessages += "Please enter Expense Type<br>";
    	 }
    	 if(form.fromDate.value.trim() == ''){
    		 errorMessages += "Please enter FromDate<br>";
    	 }
    	 if(form.toDate.value.trim() == ''){
    		 errorMessages += "Please enter Todate<br>";
    	 }
    	  
    	 if(errorMessages != ''){
    		 
    		 var trElement = document.getElementById("errorTrId");
    		 trElement.style.display = '';
    		 
    		 var tdElement = document.getElementById("errorTdId");
    		 tdElement.innerHTML = errorMessages;
    		 
    	 }else {
    		 submitForm('expenseReport');
    	 }
     }
</script>

					<table align="center" border="4">
						<tr align='center'>
							<td colspan='2'>Expense Report</td>
						</tr>
						<tr align='left' style='display:none; color: red' id = 'errorTrId'>
		                    <td colspan='2' id='errorTdId'></td>
	                    </tr>
						<tr>
							<td>Expense Type <font color="red">*</font></td>
							<td><input type='text' name='type'></td>
						</tr>
						<tr>
							<td>From Date <font color="red">*</font></td>
							<td><input type='text' name='fromDate'></td>
						</tr>
						<tr>
							<td>To Date <font color="red">*</font></td>
							<td><input type='text' name='toDate'></td>
						</tr>
						<tr align="center">
							<td colspan="2">
							<input type="button" value="Expense Report" onclick = "javascript: validateExpenseReportForm()">
									</td>
						</tr>
					</table>

<jsp:include page = "Layout/Footer.jsp" />