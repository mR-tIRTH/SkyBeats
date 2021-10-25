<%-- 
    Document   : removeSongToPlaylist.jsp
    Created on : Oct 20, 2020, 4:40:40 PM
    Author     : Stark
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    try {
        String userId = (String) session.getAttribute("userid");
        String playListID = "u" + userId + "p" + userId;
        String id = request.getParameter("id");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats?zeroDateTimeBehavior=convertToNull", "root", "");
        ResultSet currentSong = null;
        Statement stm = con.createStatement();
        stm.executeUpdate("Delete from "+playListID+" where songId = " + id);
        String site = new String("PlayList.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
        currentSong.next();
    } catch (Exception e) {

    }

%>
