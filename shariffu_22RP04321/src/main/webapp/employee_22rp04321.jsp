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
<button><a href="employ.jsp" style="text-decoration:nome;" class="active"> add New employee</a>
</button>
<button><a href="retrieve.jsp" style="text-decoration:nome;" class="active"> Retrieve</a>
</button>
<button><a href="dashboard_22rp04321.jsp" style="text-decoration:nome;" class="active"> Home</a>
</button><br>
<center>
<p><b>
List of Recorded employee
</p></b>
<table border="1">
<tr>
<th>id</th>
<th>name</th>
<th>email</th>
<th colspan="2">Action</th>
</tr>

<%

String url = "jdbc:mysql://localhost:3306/emp_22rp04321";
String user = "root";
String pass = "";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, pass);
	stmt = conn.createStatement();
	String spl = "SELECT * FROM employee";
	rs = stmt.executeQuery(sql);
		
		%>
           <tr>
           <td>id</td>
           <td>name</td>
           <td>age</td>
           <td>contact</td>
           <td><a href="Updateemployee.jsp? employecode=<%= id%>">Update</a></td>
	       <td><a href="deleteemployee.jsp? employecode=<%= id%>">Delete</a></td>
	       </tr>
	       
	       <%
	       
	}
}catch (EXception e) {
	e.printStackTrace();
}finally {
	try {
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}catch (SQLException e) {
		e.printStackTrace();
	}

}}

%>
</table>
</center>

</body>
</html>