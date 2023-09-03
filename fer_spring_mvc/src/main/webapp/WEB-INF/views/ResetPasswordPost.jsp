<%@page import="com.rs.fer.service.FERService"%>
<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%! FERService ferService = new FERServiceImpl(); %>

<% 


String newPassword = request.getParameter("newPassword");

int id = Integer.parseInt(session.getAttribute("userId").toString());

String currentPassword = request.getParameter("currentPassword");

boolean isResetPassword = ferService.resetPassword(newPassword, id, currentPassword);

if (isResetPassword) {
	session.setAttribute("status", "Password is successfully updated....");
} else {
	session.setAttribute("status","password is not updated");
}

%>

<jsp:include page = "Dashboard.jsp" />