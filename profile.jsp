<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
			
			String un=(String)session.getAttribute("user");
			if(un!=null)
			{
				out.print("Welcome  "+un+"  this is your profile");
				try
					{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
						String qry="select * from sansa where uname=?";
						PreparedStatement pstmt=con.prepareStatement(qry);
						pstmt.setString(1,un);

						ResultSet rs = pstmt.executeQuery();
						while(rs.next())
						{
					
							out.print("Details of the profile");
							out.print("welcome to Profile");
							out.print(rs.getString(1)+""+rs.getString(2)+""+rs.getString(3)+""+rs.getString(4)+""+rs.getInt(5)+""+rs.getString(6)+""+rs.getLong(7)+""+rs.getString(8));
					
					
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
					%>
						<jsp:include page="login.html" />
					<%
							
				}
			
		
			
			
		

			

	

%>