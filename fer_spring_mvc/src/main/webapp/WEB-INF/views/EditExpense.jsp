.
<%@page import="com.rs.fer.entity.Expense"%>
 
<jsp:include page = "Layout/Header_LeftFrame.jsp" />

<script>
     function validateEditExpenseForm(){
    	 var form = document.DashboardForm;
    	 var errorMessages = '';
    	 if(form.type.value.trim() == ''){
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
    		 submitForm('editExpense');
    	 }
     }
</script>

 
<%	
	
	Expense expense = (Expense) session.getAttribute("expense");
	
	out.println("<table align='center' border='4'>");
	out.println("<tr align='center'>");
	out.println("	<td colspan='2'>");
	out.println("	Edit Expense ");
	out.println("	</td>");
	out.println("</tr>");
	
	out.println("<tr align='left' style='display:none; color: red' id = 'errorTrId'>");
	out.println("<td colspan='2' id='errorTdId'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Expense Type");
	out.println("<font color='red'>");
	out.println("*");
	out.println("</font>");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='type' value = '"+expense.getType()+"'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Date");
	out.println("<font color='red'>");
	out.println("*");
	out.println("</font>");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='date' value = '"+expense.getDate()+"'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Price");
	out.println("<font color='red'>");
	out.println("*");
	out.println("</font>");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='price' value = '"+expense.getPrice()+"'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     NumberOfItems");
	out.println("<font color='red'>");
	out.println("*");
	out.println("</font>");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='numberOfItems' value = '"+expense.getNumberOfItems()+"'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Total");
	out.println("<font color='red'>");
	out.println("*");
	out.println("</font>");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='total' value = '"+expense.getTotal()+"'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     ByWhom");
	out.println("<font color='red'>");
	out.println("*");
	out.println("</font>");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='byWhom' value = '"+expense.getByWhom()+"'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr align='center'>");
	out.println("	<td colspan='2'>");
	out.println("<input type='button' value='EditExpense' onclick=\"javascript: validateEditExpenseForm()\">");
	out.println("	</td>");
	out.println("</tr>");
	
	
	out.println("</table>");	

%>

<jsp:include page="Layout/Footer.jsp" />