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
<form method="POST">
   	<h2>Signin</h2>
		  <hr>
	<input type="email" name="email" placeholder="Enter  Email Here"><br><br>
	<input type="password" name="password" placeholder="Enter Password Here"><br><br>
	 <input type="checkbox" name="Remember Me" value="value1">Remember Me <br><br>
   	<button  name="submit">signin</button>
   	<p>I don't Have Any Account <a href="signup.jsp">SignUp Here</a></p>
 
   </form>
    <%
            if (request.getParameter("submit") != null) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                String url = "jdbc:mysql://localhost:3306/emp_22rp04321";
                String user = "root"; 
                String pass = "";

                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                 
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    // Establish connection
                    conn = DriverManager.getConnection(url, user, pass);
                    
                    // Query to check user credentials
                    String sql = "SELECT * FROM user WHERE email = ? AND password = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, email);
                    pstmt.setString(2, password); // In a real application, hash the password
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        out.println("<h3>signin Successful!</h3>");
                        out.println("<p>Welcome, " + email + "!</p>");
                        response.sendRedirect("dashboard_22rp04321.jsp");
                        
                    } else {
                        out.println("<h3>Invalid email or password!</h3>");
                    }
                } catch (Exception e) {
                    out.println("<h3>Error: " + e.getMessage() + "</h3>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) {}
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
                }
            }
        %>
</body>
</html>