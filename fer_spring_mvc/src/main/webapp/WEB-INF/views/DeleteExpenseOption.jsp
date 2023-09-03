<%@page import="com.rs.fer.entity.Expense"%>
<%@page import="java.util.List"%>

<jsp:include page = "Layout/Header_LeftFrame.jsp" />

<script>
     function validateDeleteExpenseOptionsForm(){
    	 var form = document.DashboardForm;
    	 var errorMessages = '';
    	 if(form.expenseId.value.trim() == ''){
    		 errorMessages += "Please enter ExpenseID<br>";
    	 }
    	  
    	 if(errorMessages != ''){
    		 var errorEl = document.getElementById("errorId");
    		 
    		 errorEl.innerHTML = errorMessages;
    		 
    	 }else {
    		 submitForm('deleteExpense');
    	 }
     }
</script>

<span id = 'errorId' style = 'color:red'></span>
<%
	
	List<Expense> expenseOptions = (List<Expense>) session.getAttribute("deleteExpenseOptions");
	
	if (expenseOptions.isEmpty()) {	
		out.println("No Expense found to delete...");
	} else {
		out.println("Expense ID <font style = 'color:red'>*</font> :");
		out.println("&nbsp;&nbsp;&nbsp");
		out.println("<select name='expenseId'>");
		out.println("<option value=''>");
		out.println("Please Select Expense ID");
		
	
		int value = 0;
		String text = null;
		for (Expense expense : expenseOptions) {
			value = expense.getId();
			text = value + "," + expense.getType() + "," + expense.getDate() + ","
					+ expense.getTotal() + "and" + expense.getByWhom();
			out.println("<option value="+value+">"+text+"</option>");
		}
		
	
		out.println("</select>");
		out.println("&nbsp;&nbsp");
		out.println("<input type='button' value='DeleteExpense' onclick=\"javascript: validateDeleteExpenseOptionsForm()\">");
		out.println("<BR>");
		
	}
	
	
%>
<jsp:include page = "Layout/Footer.jsp" />