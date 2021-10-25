<%-- 
    Document   : addSongToPlaylist
    Created on : Oct 20, 2020, 11:46:33 AM
    Author     : Stark
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    try {
        String userId = (String) session.getAttribute("userid");
        String downloadID = "u" + userId + "d" + userId;
        String id = request.getParameter("id");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats?zeroDateTimeBehavior=convertToNull", "root", "");
        ResultSet op = null;
        Statement stm = con.createStatement();
//                op = stm.executeQuery(sql); 
//                op.first();
//                String title = op.getString("title");
//                sql = "insert into u2 values("+"'"+id+"'"+","+"'"+title+"'"+")";
        String validate = "select songId from " + downloadID + " where songId = " + id;
        op = stm.executeQuery(validate);
        op.first();
%>

<html>
    <body>
        <%  if (!op.first()) {
                String sql = "select title,path from musiclibrary where id = " + id;
                op = stm.executeQuery(sql);
                op.first();
                String songTitle = op.getString("title");
                String songPath = op.getString("path");
                sql = "insert into " + downloadID + " values(" + "'" + id + "'" + "," + "'" + songTitle + "'" + "," + "'" + songPath + "'" + ")";
                if (stm.executeUpdate(sql) == 1) {
                    String site = new String("Download.jsp");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                } else {
                    out.print("not");
                }
            } else {
                String site = new String("Download.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }
        %>
    </body>
</html>
<%
} catch (Exception e) {
%>

<html>
    <body>
        <%= e.toString()%>
    </body>
</html>
<%
    }
%>