<%-- 
    Document   : upgrade
    Created on : Oct 20, 2020, 8:11:51 PM
    Author     : tirth
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            String card;
            String card1;
            String card2;
            String card3;
            String card4;
            String name;
            String phone;
            String cv;
        %>
        <%
            card1 = request.getParameter("card1");
            card2 = request.getParameter("card2");
            card3 = request.getParameter("card3");
            card4 = request.getParameter("card4");
            card=card1+card2+card3+card4;
            name = request.getParameter("name");
            phone = request.getParameter("phone");
            cv = request.getParameter("cv");
         try{

     
     Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats?zeroDateTimeBehavior=convertToNull", "root", "");
    Statement mystatement = con.createStatement();
     
      int i = mystatement.executeUpdate("INSERT INTO payment(card,name,phone,cv,user) values('"+card+"','"+name+"','"+phone+"','"+cv+"','"+session.getAttribute("username")+"')");
    if(i>0){
                Statement myst = con.createStatement();
                int j = myst.executeUpdate("UPDATE `auth` SET `status`='Premium' WHERE id='" + session.getAttribute("userid") + "'");
                if (j > 0) {
                    response.sendRedirect("proPage.jsp");
                }
    }
     }catch(Exception e){
%><div><%out.print(e);%></div><%
     }
        %>
    </body>
</html>
  