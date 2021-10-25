<%-- 
    Document   : removeHitsAdmin
    Created on : Oct 25, 2020, 3:29:11 AM
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
        ResultSet currentSong = null;
        Statement stm = con.createStatement();
        stm.executeUpdate("Delete from hits where songId = " + id);
        String site = new String("SongOperationsAdmin.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
        currentSong.next();
    } catch (Exception e) {

    }

%>
