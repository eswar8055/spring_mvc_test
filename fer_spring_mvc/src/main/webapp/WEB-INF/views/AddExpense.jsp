<jsp:include page = "Layout/Header_LeftFrame.jsp" />

<script>
     function validateAddExpenseForm(){
    	 var form = document.DashboardForm;
    	 var errorMessages = '';
    	 if(form.type.value == ''){
    		 errorMessages += "Please enter Expense Type<br>";
    	 }
    	 if(form.date.value.trim() == ''){
    		 errorMessages += "Please enter Date<br>";
    	 }
    	 if(form.price.value.trim() == ''){
    		 errorMessages += "Please enter Price<br>";
    	 }
    	 if(form.numberOfItems.value.trim() == ''){
    		 errorMessages += "Please enter Number Of Items<br>";
    	 }
    	 if(form.total.value.trim() == ''){
    		 errorMessages += "Please enter Total<br>";
    	 }
    	 if(form.byWhom.value.trim() == ''){
    		 errorMessages += "Please enter ByWhom<br>";
    	 }
    	 
    	 if(errorMessages != ''){
    		 
    		 var trElement = document.getElementById("errorTrId");
    		 trElement.style.display = '';
    		 
    		 var tdElement = document.getElementById("errorTdId");
    		 tdElement.innerHTML = errorMessages;
    		 
    	 }else {
    		 submitForm('addExpense');
    	 }
     }
</script>



<table align="center" border="4">
	<tr align='center'>
		<td colspan='2'>Add Expense</td>
	</tr>
	<tr align='left' style='display:none; color: red' id = 'errorTrId'>
		<td colspan='2' id='errorTdId'></td>
	</tr>
	<tr>
		<td>Expense Type <font color="red">*</font></td>
		<td><input type='text' name='type'></td>
	</tr>
	<tr>
		<td>Date <font color="red">*</font></td>
		<td><input type='text' name='date'></td>
	</tr>
	<tr>
		<td>Price <font color="red">*</font></td>
		<td><input type='text' name='price'></td>
	</tr>
	<tr>
		<td>Number Of Items <font color="red">*</font></td>
		<td><input type='text' name='numberOfItems'></td>
	</tr>
	<tr>
		<td>Total <font color="red">*</font></td>
		<td><input type='text' name='total'></td>
	</tr>
	<tr>
		<td>By Whom <font color="red">*</font></td>
		<td><input type='text' name='byWhom'></td>
	</tr>
	<tr align="center">
		<td colspan="2"><input type="button" value="SaveExpense"
			onclick="javascript: validateAddExpenseForm()"></td>
	</tr>
</table>
<jsp:include page = "Layout/Footer.jsp" />

