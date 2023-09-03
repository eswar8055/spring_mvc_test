<jsp:include page="Layout/Header_LeftFrame.jsp" />

<%@page import="com.rs.fer.entity.User"%>

<script>
	function validateNameInfoForm() {
		var form = document.DashboardForm;
		var errorMessages = '';
		if (form.firstname.value.trim() == '') {
			errorMessages += "Please enter FirstName<br>";
		}
		if (form.lastname.value.trim() == '') {
			errorMessages += "Please enter LastName<br>";
		}

		if (errorMessages != '') {

			var trElement = document.getElementById("errorTrId");
			trElement.style.display = '';

			var tdElement = document.getElementById("errorTdId");
			tdElement.innerHTML = errorMessages;

		} else {
			submitForm('showContactInfo');
		}
	}
</script>


<%

		User user = (User)session.getAttribute("user");
		session.setAttribute("user", user);
		
		out.println("<table align='center' border='4'>");
		out.println("<tr align='center'>");
		out.println("	<td colspan='2'>");
		out.println("	Name Info");
		out.println("	</td>");
		out.println("</tr>");
		
		out.println("<tr align='left' style='display:none; color: red' id = 'errorTrId'>");
		out.println("<td colspan='2' id='errorTdId'>");
		out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("	<td>");
		out.println("     First Name");
		out.println("<font color='red'>");
		out.println("*");
		out.println("</font>");
		out.println("     </td>");
		out.println("	<td>");
		out.println("	<input type='text' name='firstname' value = '" + user.getFirstName() + "'>");
		out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("	<td>");
		out.println("     Middle Name");
		out.println("     </td>");
		out.println("	<td>");
		out.println("	<input type='text' name='middlename' value = '" + user.getMiddleName() + "'>");
		out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("	<td>");
		out.println("     LastName");
		out.println("<font color='red'>");
		out.println("*");
		out.println("</font>");
		out.println("     </td>");
		out.println("	<td>");
		out.println("	<input type='text' name='lastname' value = '" + user.getLastName() + "'>");
		out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr align='center'>");
		out.println("	<td colspan='2'>");
		out.println("<input type='button' value='Next' onclick=\"javascript: validateNameInfoForm()\">");
		out.println("	</td>");
		out.println("</tr>");
		
		out.println("</table>");
%>

<jsp:include page="Layout/Footer.jsp" />
