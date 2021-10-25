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
        String id = request.getParameter("id");
out.println(id);        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats?zeroDateTimeBehavior=convertToNull", "root", "");
        ResultSet op = null;
        Statement stm = con.createStatement();
//                op = stm.executeQuery(sql); 
//                op.first();
//                String title = op.getString("title");
//                sql = "insert into u2 values("+"'"+id+"'"+","+"'"+title+"'"+")";
        String validate = "select * from hits where songID = " + id;
        op = stm.executeQuery(validate);
        op.first();
%>

<html>
    <body>
        <%  if (!op.first()) {
                String sql = "select title,path from musiclibrary where id = " + id;
                op = stm.executeQuery(sql);
                op.first();
                String title = op.getString("title");
                String path = op.getString("path");
                sql = "insert into hits values(" + "'" + id + "'" + "," + "'" + title + "'" + "," + "'" + path + "'" + ")";
                if (stm.executeUpdate(sql) == 1) {
                    String site = new String("SongOperationsAdmin.jsp");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                } else {
                    //only for debugging purpose
                    out.print("Not Added any Data");
                }
            } else {
                String site = new String("SongOperationsAdmin.jsp");
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