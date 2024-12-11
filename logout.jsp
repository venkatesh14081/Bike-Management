<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    session.removeAttribute("user");

    response.sendRedirect("login.html");
%>
