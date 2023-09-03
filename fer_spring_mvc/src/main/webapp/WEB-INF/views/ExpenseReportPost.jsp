<jsp:include page = "Layout/Header_LeftFrame.jsp" /> 


<%@page import="com.rs.fer.entity.Expense"%>
<%@page import="java.util.List"%>

<%	
	
	
	List<Expense> expenses = (List<Expense>) session.getAttribute("expenses");
	
	if (expenses.isEmpty()) {
		out.println("No record found.....");
	} else {
		out.println("<table border='4' width='200px'>");
		out.println("<tr align='center'>");
		out.println("	<td colspan='7'>");
		out.println("Expense Report");
		out.println("</td>");
		out.println("</tr>");
	
		out.println("<tr>");
		out.println("<td>");
		out.println("Expense Type");
		out.println("</td>");
		out.println("<td>");
		out.println("From Date");
		out.println("</td>");
		out.println("<td>");
		out.println("To Date");
		out.println("</td>");
		out.println("<td>");
		out.println("Price");
		out.println("</td>");
		out.println("<td>");
		out.println("No of Items");
		out.println("</td>");
		out.println("<td>");
		out.println("Total");
		out.println("</td>");
		out.println("<td>");
		out.println("By Whom");
		out.println("</td>");
		out.println("</tr>");
	
		for (Expense expense : expenses) {
			out.println("<tr>");
			out.println("<td>");
			out.println("<input type='text' value='" + expense.getType() + "' name='type'>");
			out.println("</td>");
			out.println("<td>");
			out.println("<input type='text' value=" + expense.getDate() + " name='fromDate'>");
			out.println("</td>");
			out.println("<td>");
			out.println("<input type='text' value=" + expense.getDate() + " name='toDate'>");
			out.println("</td>");
			out.println("<td>");
			out.println("<input type='text' value=" + expense.getPrice() + " name='price'>");
			out.println("</td>");
			out.println("<td>");
			out.println("<input type='text' value=" + expense.getNumberOfItems() + " name='numberOfItems'>");
			out.println("</td>");
			out.println("<td>");
			out.println("<input type='text' value=" + expense.getTotal() + " name='fromDate'>");
			out.println("</td>");
			out.println("<td>");
			out.println("<input type='text' value=" + expense.getByWhom() + " name='byWhom'>");
			out.println("</td>");
	
			out.println("</tr>");
		}
	
			out.println("<tr align='center'>");
			out.println("	<td colspan='7'>");
			out.println("<input type='submit' value='Print'>");
			out.println("</td>");
			out.println("</tr>");
	
			out.println("</table>");
	
	}
%>

<jsp:include page = "Layout/Footer.jsp" />
