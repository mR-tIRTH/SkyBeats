<%-- 
    Document   : deleteUserAdmin
    Created on : Oct 25, 2020, 7:13:04 PM
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
        //this 2 ids are made to delete the playlist and download table of hte user
        String downloadID = "u" + id + "d" + id;
        String playListID = "u" + id + "p" + id;
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats?zeroDateTimeBehavior=convertToNull", "root", "");        
        Statement stm = con.createStatement();
        if (stm.executeUpdate("Delete from auth where id = " + id) == 1) {
            String sqlDownload = "Drop table " + downloadID;
            String sqlPlaylist = "Drop table " + playListID;
            //this was giving me NullPointerException (stm.executeUpdate(sqlDownload) == 1 && stm.executeUpdate(sqlPlaylist) == 1)        
        Statement deleteDownload = con.createStatement();    
            if (deleteDownload.executeUpdate(sqlDownload) == 1) {
                out.print("downloads deleted ");                
            }
            Statement deletePlaylist = con.createStatement();    
            if(deletePlaylist.executeUpdate(sqlPlaylist) == 1){
            out.print("Playlist deleted ");                }
        }
//        currentUser.next();
    } catch (Exception e) {
        out.println(e);
    }

%>
