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
     try{
     String color[]={"blue","green","red","yellow"};
     Class.forName("com.mysql.jdbc.Driver");
     String timeStamp = new SimpleDateFormat("HH.mm.ss").format(new java.util.Date());
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats?zeroDateTimeBehavior=convertToNull", "root", "");
    Statement mystatement = con.createStatement();
    
    String comment = request.getParameter("comment");
        int i = mystatement.executeUpdate("INSERT INTO skybeatscomments(comdata,time,color,name) values('"+comment+"',now(),'"+color[new Random().nextInt(color.length)]+"','"+session.getAttribute("username")+"')");
    
    if(i>0){
    response.sendRedirect("AdminDashboard.jsp");
    }
     }catch(Exception e){
%><div><%out.print(e);%></div><%
     }
%>



//ALTER TABLE skybeatscomments MODIFY id int NOT NULL AUTO_INCREMENT;