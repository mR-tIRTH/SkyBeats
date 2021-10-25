<%-- 
    Document   : logInDb
    Created on : Oct 7, 2020, 12:15:07 PM
    Author     : tirth
--%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%!
    String email = "null";
    String pass = "null";
    String dpass = "null";
    String mail = "null";

%>
<%@page import="java.sql.*"%>

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
            pass = request.getParameter("pass");
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection myconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats", "root", "");
                Statement mystatement = myconn.createStatement();
                ResultSet myresults = mystatement.executeQuery("Select name,password from adminauth where email='" + email + "'");
                if (myresults.next()) {
                    dpass = myresults.getString("password");
                    String name = myresults.getString("name");
                    if (dpass.equals(pass)) {
                        session.setAttribute("username",name);
                        response.sendRedirect("AdminDashboard.jsp");
                    } else {
        %>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

        <script type="text/javascript">
            function alertName() {
                Swal.fire({
                    icon: 'error',
                    title: 'Wrong Id Password',
                    text: 'Please Enter Correct Id Password!',
                })
            }
        </script>
        <script type="text/javascript"> window.onload = alertName;</script>
        <%
                        RequestDispatcher rd = request.getRequestDispatcher("Adminlogin.jsp");//requestdisptacher used as mam needed both type of response in proj
                        rd.include(request, response);
                    }
                }else{
        %>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

        <script type="text/javascript">
            function alertName() {
                Swal.fire({
                    icon: 'error',
                    title: 'Not Registered',
                    text: 'You Are not Authorized!',
                })
            }
        </script>
        <script type="text/javascript"> window.onload = alertName;</script>
        <%
                        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");//requestdisptacher used as mam needed both type of response in proj
                        rd.include(request, response);
                    }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        %>
    </body>
</html>
