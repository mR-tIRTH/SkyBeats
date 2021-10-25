<%-- 
    Document   : removeSong
    Created on : Oct 24, 2020, 7:10:52 PM
    Author     : Stark
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        
File song = new File("C:\\Users\\Stark\\Documents\\NetBeansProjects\\SkyBeats\\web\\Music\\1.mp3");

if(song.delete())
out.println("Sucessfully deleted file");
else
out.println("Error in deleting file");
%>