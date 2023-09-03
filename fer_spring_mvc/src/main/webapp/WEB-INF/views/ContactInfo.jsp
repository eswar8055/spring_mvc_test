<jsp:include page="Layout/Header_LeftFrame.jsp" />

<%@page import="com.rs.fer.entity.User"%>
<script>
     function validateContactInfoForm(){
    	 var form = document.DashboardForm;
    	 var errorMessages = '';
    	 if(form.email.value.trim() == ''){
    		 errorMessages += "Please enter Email<br>";
    	 }
    	 if(form.mobile.value.trim() == ''){
    		 errorMessages += "Please enter Mobile<br>";
    	 }
    	  
    	 if(errorMessages != ''){
    		 
    		 var trElement = document.getElementById("errorTrId");
    		 trElement.style.display = '';
    		 
    		 var tdElement = document.getElementById("errorTdId");
    		 tdElement.innerHTML = errorMessages;
    		 
    	 }else {
    		 submitForm('showAddressInfo');
    	 }
     }
</script>


<%	
	User user = (User) session.getAttribute("user");
	
	user.setFirstName(request.getParameter("firstname"));
	user.setMiddleName(request.getParameter("middlename"));
	user.setLastName(request.getParameter("lastname"));
	
	
	out.println("<table align='center' border='4'>");
	out.println("<tr align='center'>");
	out.println("	<td colspan='2'>");
	out.println("	Contact Info");
	out.println("	</td>");
	out.println("</tr>");
	
	out.println("<tr align='left' style='display:none; color: red' id = 'errorTrId'>");
	out.println("<td colspan='2' id='errorTdId'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Email");
	out.println("<font color='red'>");
	out.println("*");
	out.println("</font>");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='email' value = '"+user.getEmail()+"'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Mobile");
	out.println("<font color='red'>");
	out.println("*");
	out.println("</font>");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='mobile' value = '"+user.getMobile()+"'>");
	out.println("</td>");
	out.println("</tr>");
	
	
	out.println("<tr align='center'>");
	out.println("	<td colspan='2'>");
	out.println("<input type='button' value='Next' onclick=\"javascript: validateContactInfoForm()\">");
	out.println("	</td>");
	out.println("</tr>");
	
	
	out.println("</table>");
%>

<jsp:include page="Layout/Footer.jsp" />