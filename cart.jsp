<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
			
			String cid=request.getParameter("id");
			String uname = (String)session.getAttribute("user");
		if(uname != null)
		{
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
				String qry="select * from guna where id=?";
				PreparedStatement pstmt=con.prepareStatement(qry);
				pstmt.setString(1,cid);

				ResultSet rs = pstmt.executeQuery();
				while(rs.next())
				{
					
					out.print("Added to the cart successfully");
					out.print("Here are the details of your cart");
					
					%>
							<tr>
								<td><%= rs.getString(1) %></td>
							</tr>
							<tr>
								<td><%= rs.getString(2) %></td>
							</tr>
							<tr>
								<td><%= rs.getString(3) %></td>
							</tr>
							<tr>
								<td><%= rs.getString(4) %></td>
							</tr>

							<tr>

								<td><img src='<%= rs.getString(5) %>'></td>
							</tr>
				<% 
				}
				
				
				con.close();
			
				
				
			}
			catch (Exception e)
			{
				out.print(e);
			}
		}
		else
		{
			out.println("please login first");
		%>
		<jsp:include page="login.html" />

		

		<%
		}


			

	

%>