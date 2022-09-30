<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% 
try{
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String roll = request.getParameter("roll");
	String course = request.getParameter("course");
	String year = request.getParameter("year");
	String redirectUrl = "adminstudent.jsp";
	final String url="jdbc:mysql://localhost/data";
	final String user="root";
	final String pass="";
	final String Query="insert into student_details(fname,lname,roll,course,year) values(?,?,?,?,?)";
//this code is to register the mysql connector
Class.forName("com.mysql.cj.jdbc.Driver");
//this code is to establish the connection
Connection conn=DriverManager.getConnection(url,user,pass);
PreparedStatement pst = conn.prepareStatement(Query);
pst.setString(1, fname);
pst.setString(2, lname);
pst.setString(3, roll);
pst.setString(4, course);
pst.setString(5, year);
pst.executeUpdate();
response.sendRedirect(redirectUrl);
}catch(Exception e)
{
	System.out.println(e);
	e.printStackTrace();
}
%>