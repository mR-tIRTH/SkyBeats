<%-- 
    Document   : comdb
    Created on : Oct 14, 2020, 12:30:17 PM
    Author     : tirth
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String fname=null;
   String title=null;
   
     try{

     
     Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats?zeroDateTimeBehavior=convertToNull", "root", "");
    Statement mystatement = con.createStatement();
      Cookie[] cookies = null;
      cookies = request.getCookies();
      fname=session.getAttribute("filename").toString();
      title=session.getAttribute("title").toString();

      int i = mystatement.executeUpdate("INSERT INTO musiclibrary(title,path,auth_name,directory) values('"+title+"','"+fname+"','"+session.getAttribute("username")+"','Music')");
    if(i>0){
        response.sendRedirect("uploadPage.jsp");
    }
     }catch(Exception e){
%><div><%out.print(e);%></div><%
     }
%>


