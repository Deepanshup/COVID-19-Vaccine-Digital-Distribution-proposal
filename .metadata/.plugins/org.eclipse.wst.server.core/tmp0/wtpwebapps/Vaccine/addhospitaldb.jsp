<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
try
{
if(session.getAttribute("username") == null) {
response.sendRedirect("login.jsp");
return ;
}

String ssel=request.getParameter("sel");
String sname=request.getParameter("name");
String sward=request.getParameter("wn");
String spopulation=request.getParameter("population");
String stcp=request.getParameter("tcp");
String stcw=request.getParameter("tcw");
String srp=request.getParameter("rp");

if(sname.equals("")){
out.write("alert('Enter State name !!')");
}
if(spopulation.equals("")){
out.write("alert('Enter population  !!')");
}
if(stcp.equals("")){
out.write("alert('Enter Total Covid Patients  !!')");
}
if(stcw.equals("")){
out.write("alert('Enter Total Covid Warriors  !!')");
}
if(srp.equals("")){
out.write("alert('Enter Remaining Pople  !!')");
}

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/covid","root",""); 

Statement stmt=con.createStatement(); 
Statement stmt1=con.createStatement();

String sql="Select id from city where name='"+ssel+"'"; 
ResultSet rs= stmt.executeQuery(sql);
while(rs.next()){
String cityid=rs.getString("id");
String sqll="insert into hospital(name,ward,population,cp,cw,op,c_id) values('"+sname+"','"+sward+"','"+spopulation+"','"+stcp+"','"+stcw+"','"+srp+"','"+cityid+"') ";
stmt.executeUpdate(sqll);
response.sendRedirect("./addhospital.jsp");
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>