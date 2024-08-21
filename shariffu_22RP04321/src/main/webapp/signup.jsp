<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
<form method="POST">
<h2>signup</h2>
<hr>
name:<input type="text" name="name" placeholder="enter name"><br><br>
email:<input type="email" name="email" placeholder="enter email"><br><br>
password:<input type="password" name="password" placeholder="enter password"><br><br>
<button name="submit">signup</button>
</form>
</div>
<%
if (request.getParameter("submit") != null) {
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	
	
	String url = "jdbc:mysql://localhost:3306/emp_22rp04321";
	String user = "root";
	String pass = "";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "INSERT INTO user (name, email, password)VALUES (?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, email);
	pstmt.setString(3, password);
	pstmt.executeUpdate();
	
	out.println("<h3>signup Successful!</h3>");
	response.sendRedirect("signin_22RP04321.jsp");
	} catch (Exception e) {
		out.println("<h3>Error: " + e.getMessage() + "</h3>");
	} finally {
		if (pstmt != null) try { pstmt.close(); } catch (SQLException e){}
		if (pstmt != null) try { pstmt.close(); } catch (SQLException e){}
	}
}
%>
</body>
</html>