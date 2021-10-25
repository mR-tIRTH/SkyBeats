<%-- 
    Document   : banUserAdmin
    Created on : Oct 25, 2020, 12:30:14 PM
    Author     : Stark
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String id = request.getParameter("id");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats?zeroDateTimeBehavior=convertToNull", "root", "");    
    Statement stm = con.createStatement();
    String sqlBan = "Update auth set accstatus = 0 where id = " + id;
    if (stm.executeUpdate(sqlBan) == 1) {
%><jsp:forward page="AdminDashboard.jsp"/><%
    } else {
        out.println("not done ");
    }

%>