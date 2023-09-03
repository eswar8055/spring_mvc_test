<jsp:include page = "Layout/Header_LeftFrame.jsp" />
<%@page import="com.rs.fer.entity.Address"%>
<%@page import="com.rs.fer.entity.User"%>

<%
	User user = (User) session.getAttribute("user");
	Address address = user.getAddress();
	
	address.setLineOne(request.getParameter("lineOne"));
	address.setLineTwo(request.getParameter("lineTwo"));
	address.setCity(request.getParameter("city"));
	address.setState(request.getParameter("state"));
	address.setPincode(request.getParameter("pincode"));
	address.setCountry(request.getParameter("country"));
	
	out.println("<table align='center' border='4'>");
	out.println("<tr align='center'>");
	out.println("	<td colspan='2'>");
	out.println("	Profile Review");
	out.println("	</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     First Name");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='firstname' value = '"+user.getFirstName()+"' disabled = 'true'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Middle Name");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='middlename' value = '"+user.getMiddleName()+"' disabled = 'true'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     LastName");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='lastname' value = '"+user.getLastName()+"' disabled = 'true'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Email");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='email' value = '"+user.getEmail()+"' disabled = 'true'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Mobile");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='middlename' value = '"+user.getMobile()+"' disabled = 'true'>");
	out.println("</td>");
	out.println("</tr>");
	
	
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Line1");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='lineOne' value = '"+address.getLineOne()+"' disabled = 'true'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Line2");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='lineTwo' value = '"+address.getLineTwo()+"' disabled = 'true'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     City");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='city' value = '"+address.getCity()+"' disabled = 'true'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     State");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='state' value = '"+address.getState()+"' disabled = 'true'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     PinCode");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='pincode' value = '"+address.getPincode()+"' disabled = 'true'>");
	out.println("</td>");
	out.println("</tr>");
	
	out.println("<tr>");
	out.println("	<td>");
	out.println("     Country");
	out.println("     </td>");
	out.println("	<td>");
	out.println("	<input type='text' name='country' value = '"+address.getCountry()+"' disabled = 'true'>");
	out.println("</td>");
	out.println("</tr>");
	
	
	out.println("<tr align='center'>");
	out.println("	<td colspan='2'>");
	out.println("<input type='submit' value='UpdateProfile' onclick=\"javascript: submitForm('updateProfile')\">");
	out.println("	</td>");
	out.println("</tr>");
	
	
	out.println("</table>");

%>
<jsp:include page = "Layout/Footer.jsp" />