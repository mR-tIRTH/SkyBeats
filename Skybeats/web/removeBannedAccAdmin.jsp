<%-- 
    Document   : removeBannedAccAdmin
    Created on : Oct 25, 2020, 6:15:23 PM
    Author     : Stark
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    try {
        String id = request.getParameter("id");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats?zeroDateTimeBehavior=convertToNull", "root", "");
        ResultSet currentUser = null;
        Statement stm = con.createStatement();
        stm.executeUpdate("Update auth set accstatus = 1 where id = " + id);
        String site = new String("AdminDashboard.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
        currentUser.next();
    } catch (Exception e) {

    }

%>
