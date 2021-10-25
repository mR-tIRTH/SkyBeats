<%-- 
    Document   : SignUpDb
    Created on : Oct 7, 2020, 12:15:19 PM
    Author     : tirth
--%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.*"%>

<%!
    String email;
    String user;
    String pass;
    String repass;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            email = request.getParameter("email");
            user = request.getParameter("user");
            pass = request.getParameter("pass");
            repass = request.getParameter("repass");
            Connection connection = null;
            ResultSet rs;

            try {
                String sql = "SELECT * FROM auth WHERE email = ? AND password = ?";
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats", "root", "");

                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, pass);
                Statement s = connection.createStatement();
                rs = preparedStatement.executeQuery();
                if (rs.next()) {

                    //if user already exist then go to login page and login todo list Toast msg
        %>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script type="text/javascript">
            function alertName1() {
                Swal.fire({
                    icon: 'warning',
                    title: 'Already registered',
                    text: 'Enter Your Registered Email password!',
                })
            }
        </script>
        <script type="text/javascript"> window.onload = alertName1;</script>
        <%            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");//requestdisptacher used as mam needed both type of response in proj
            rd.include(request, response);

        } else {

            int i = s.executeUpdate("INSERT INTO auth(email,name,password,status) values('" + email + "','" + user + "','" + pass + "','Basic')");
            if (i > 0) {
                try {
                    ResultSet crtTable = null;
                    String st = "select id from auth where email = '" + email + "'";
                    crtTable = s.executeQuery(st);
                    crtTable.first();
                    String usrTable = "u" + crtTable.getString("id") + "d" + crtTable.getString("id");
                    String sqlToCreateTable = "CREATE TABLE " + usrTable + " (`songId` INT NOT NULL, `songName` VARCHAR(32) NOT NULL, `songPath` VARCHAR(100) NOT NULL,Foreign key (songId) references musiclibrary(id) on delete Cascade on Update cascade);";
                    int done = s.executeUpdate(sqlToCreateTable);
                    crtTable = null;
                    st = "select id from auth where email = '" + email + "'";
                    crtTable = s.executeQuery(st);
                    crtTable.first();
                    usrTable = "u" + crtTable.getString("id") + "p" + crtTable.getString("id");
                    sqlToCreateTable = "CREATE TABLE " + usrTable + " (`songId` INT NOT NULL, `songName` VARCHAR(32) NOT NULL, `songPath` VARCHAR(100) NOT NULL,Foreign key (songId) references musiclibrary(id) on delete Cascade on Update cascade);";
                    done = s.executeUpdate(sqlToCreateTable);
                } catch (Exception e) {
        %> <div><% out.println(e);%></div><%                }
            //if inserted then go to login page and login again todo list Toast msg
        %>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

        <script type="text/javascript">
            function alertName() {
                Swal.fire({
                    icon: 'success',
                    title: 'Login',
                    text: 'Get entry With the Registered Login Password!',
                })
            }
        </script>
        <script type="text/javascript"> window.onload = alertName;</script>
        <%
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");//requestdisptacher used as mam needed both type of response in proj
                    rd.include(request, response);
                }

            }

        } catch (Exception e) {
        %> <div><% out.println(e);%></div><%
            }
        %>
    </body>
</html>
