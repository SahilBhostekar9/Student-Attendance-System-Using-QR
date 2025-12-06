<%@ page import="java.sql.*" %>
<%
// Database connection parameters Use your own Credentials Mine is here for refernce.....
String dbURL = "jdbc:mysql://localhost:3306/attendance_db";
String dbUser = "root";
String dbPass = "sahil@2580";

Connection conn = null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
} catch (Exception e) {
    out.println("Database connection error: " + e.getMessage());
}
%>
