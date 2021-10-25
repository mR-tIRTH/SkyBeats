<%-- 
    Document   : removeSongAdmin
    Created on : Oct 25, 2020, 2:08:29 AM
    Author     : Stark
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String id = request.getParameter("id");  
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats?zeroDateTimeBehavior=convertToNull", "root", "");
    ResultSet song = null;
    Statement stm = con.createStatement();
    song = stm.executeQuery("Select * from musiclibrary where id = "+id);
    song.next();
    String path = "C:\\Users\\Stark\\Documents\\NetBeansProjects\\SkyBeats\\web\\Music\\"+song.getString("path");
    out.print(path);
    File songPath = new File(path);

    if (songPath.delete()) {
        String sql = "Delete from musiclibrary where id = "+id;
        if(stm.executeUpdate(sql) == 1){
            %><jsp:forward page="SongOperationsAdmin.jsp"/><%
        }
    } else {
        out.println("Error in deleting file");
    }
%>