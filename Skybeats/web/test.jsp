<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<form method="post">

<table border="2">
   <tr>
        <td>user ID</td>
        <td>Birthday</td>
        <td>Gender</td>
        <td>First Name</td>
        <td>Last Name</td>
   </tr>
   <%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");       
       String query="select * from auth";
       Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats?zeroDateTimeBehavior=convertToNull", "root", "");
       
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
   %>
           <tr><td><%= rs.getString("email") %></td></tr>
           <tr><td><%= rs.getString("name") %></td></tr>           

   <%
       }
   %>
   </table>
   <%
        rs.close();
        stmt.close();
        conn.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %>
</form>