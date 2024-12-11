<%@ page import="java.sql.*" %>
<%
			String name=request.getParameter("name");
			
			String uname=request.getParameter("email");
			String pass=request.getParameter("password");
			int age=Integer.parseInt(request.getParameter("age"));
			String gender=request.getParameter("gender");
			String busno=request.getParameter("busno");
			String persontype=request.getParameter("persontype");
			String lknown=request.getParameter("languages");
			String addr=request.getParameter("address");
			
			//out.print(sid+""+sname+""+suname+""+spwd+""+sgender+""+saddr+""+sphno);
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
				String qry="insert into stark values(?,?,?,?,?,?,?,?,?)";
				PreparedStatement pstmt=con.prepareStatement(qry);
				pstmt.setString(1,name);
				pstmt.setString(2,uname);
				pstmt.setString(3,pass);
				pstmt.setInt(4,age);
				pstmt.setString(5,gender);
				pstmt.setString(6,busno);
				pstmt.setString(7,persontype);
				pstmt.setString(8,lknown);
				pstmt.setString(9,addr);



				pstmt.executeUpdate();
				out.print("1 row inserted successfully");
					out.print("<h3> Login here <a href='login.html'>Login</a></h3>");
				con.close();
			
				
				
			}
			catch (Exception e)
			{
				out.print(e);
			}


			

	

%>