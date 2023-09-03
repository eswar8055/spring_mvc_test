<%@page import="com.rs.fer.service.impl.FERServiceImpl"%>
<%@page import="com.rs.fer.service.FERService"%>
<%! FERService ferService = new FERServiceImpl(); %>

<% 

   String email = request.getParameter("emailAddress");

   boolean isEmailAvailable = ferService.isEmailAvailable(email);
   
   if(isEmailAvailable){
	   out.println("Y");
   }else{
	   out.println("N");
   }

%>