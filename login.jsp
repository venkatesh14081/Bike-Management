<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>


<%
  String username = request.getParameter("username");
  String password = request.getParameter("pwd");
  Connection connection = null;
  PreparedStatement preparedStatement = null;
  ResultSet resultSet = null;

  try {
    // Use a secure way to store and retrieve database credentials
    

    Class.forName("oracle.jdbc.driver.OracleDriver");
    connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");

    String query = "SELECT * FROM sansa WHERE uname = ? AND pass = ?";
    preparedStatement = connection.prepareStatement(query);
    preparedStatement.setString(1, username);
    preparedStatement.setString(2, password);

    resultSet = preparedStatement.executeQuery();

    if (resultSet.next()) {
      // Login successful
      

     session.setAttribute("user",username);
	 %>
      <jsp:forward page="index 1.html" />
      <%

    } else {
      // Login failed - provide specific error message
      String errorMessage = "Login failed. Username or password is incorrect.";
      out.print(errorMessage);
      %>
      <jsp:include page="login.html" />
      <%
    }
  } catch (Exception e) {
    out.print("An error occurred: " + e.getMessage());
  } finally {
    // Close resources in any case
    if (resultSet != null) {
      resultSet.close();
    }
    if (preparedStatement != null) {
      preparedStatement.close();
    }
    if (connection != null) {
      connection.close();
    }
  }
%>
