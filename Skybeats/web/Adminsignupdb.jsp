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
<%
    String uid = (String) session.getAttribute("username");
    if (uid == null) {
%>
<jsp:forward page="index.jsp"/>
<%
    }%> 


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
                String sql = "SELECT * FROM adminauth WHERE email = ? AND password = ?";
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats", "root", "");

                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, pass);
                Statement s = connection.createStatement();
                rs = preparedStatement.executeQuery();
                if (rs.next()) {
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
        <%
            RequestDispatcher rd = request.getRequestDispatcher("AdminDashboard.jsp");//requestdisptacher used as mam needed both type of response in proj
            rd.include(request, response);

        } else {
            int i = s.executeUpdate("INSERT INTO adminauth(email,name,password) values('" + email + "','" + "Admin "+user + "','" + pass + "')");
            if (i > 0) {
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
                        RequestDispatcher rd = request.getRequestDispatcher("AdminDashboard.jsp");//requestdisptacher used as mam needed both type of response in proj
                        rd.include(request, response);
                    }

                }
            } catch (SQLException e) {
                out.print(e);
            }
        %>
    </body>
</html>
