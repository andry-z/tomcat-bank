<%@page import="javax.servlet.http.HttpSession" %>
<%
HttpSession mySession = request.getSession();
mySession.invalidate();
response.sendRedirect("index.jsp");
%>