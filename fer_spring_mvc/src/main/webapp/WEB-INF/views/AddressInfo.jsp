<%@page import="com.rs.fer.entity.Address"%>
<%@page import="com.rs.fer.entity.User"%>
<jsp:include page="Layout/Header_LeftFrame.jsp" />


<script>
     function validateAddressInfoForm(){
    	 var form = document.DashboardForm;
    	 var errorMessages = '';
    	 if(form.lineOne.value.trim() == ''){
    		 errorMessages += "Please enter Line1<br>";
    	 }
    	 if(form.city.value.trim() == ''){
    		 errorMessages += "Please enter City<br>";
    	 }
    	 if(form.state.value.trim() == ''){
    		 errorMessages += "Please enter State<br>";
    	 }
    	 if(form.pincode.value.trim() == ''){
    		 errorMessages += "Please enter Pincode<br>";
    	 }
    	 if(form.country.value.trim() == ''){
    		 errorMessages += "Please enter Country<br>";
    	 }
    	  
    	 if(errorMessages != ''){
    		 
    		 var trElement = document.getElementById("errorTrId");
    		 trElement.style.display = '';
    		 
    		 var tdElement = document.getElementById("errorTdId");
    		 tdElement.innerHTML = errorMessages;
    		 
    	 }else {
    		 submitForm('showReview');
    	 }
     }
</script>


<% 	
	User user = (User) session.getAttribute("user");
	Address address = user.getAddress();
	
	user.setEmail(request.getParameter("email"));
	user.setMobile(request.getParameter("mobile"));
	
	
	out.println("<table align='center' border='4'>");
	out.println("<tr align='center'>");
	out.println("	<td colspan='2'>");
	out.println("	Addreess Info");
	out.println("	</td>");
	out.println("</tr>");
	
	out.println("<tr align='left' style='display:none; color: red' id = 'errorTrId'>");
	out.println("<td colspan='2' id='errorTdId'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Line1");
	out.println("<font color='red'>");
	out.println("*");
	out.println("</font>");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='lineOne' value = '"+address.getLineOne()+"'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Line2");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='lineTwo' value = '"+address.getLineTwo()+"'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     City");
	out.println("<font color='red'>");
	out.println("*");
	out.println("</font>");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='city' value = '"+address.getCity()+"'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     State");
	out.println("<font color='red'>");
	out.println("*");
	out.println("</font>");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='state' value = '"+address.getState()+"'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     PinCode");
	out.println("<font color='red'>");
	out.println("*");
	out.println("</font>");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='pincode' value = '"+address.getPincode()+"'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Country");
	out.println("<font color='red'>");
	out.println("*");
	out.println("</font>");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='country' value = '"+address.getCountry()+"'>");
	out.println("</td>");
	out.println("</tr>");
	
	
	out.println("<tr align='center'>");
	out.println("	<td colspan='2'>");
	out.println("<input type='button' value='Review' onclick=\"javascript: validateAddressInfoForm()\">");
	out.println("	</td>");
	out.println("</tr>");
	
	
	out.println("</table>");

%>
<jsp:include page="Layout/Footer.jsp" />