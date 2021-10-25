<%-- 
    Document   : Player
    Created on : Oct 6, 2020, 10:36:03 PM
    Author     : Mahesh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <!DOCTYPE html>
    <html lang="en" >
        <head>
            <meta chacurrentSonget="UTF-8">
            <title>Sky Beats</title>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
            <link rel="stylesheet" href="./style.css">
            <link rel="stylesheet" href="./PlayerStyle.css">
            <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.0.10/css/all.css'>
            <link rel="stylesheet" href="./Cards.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
        </head>
        <body>            
            <%

                String id = request.getParameter("id");                
                try {
                    if (Integer.parseInt(id) <= 0) {
                        id = "1";
                    }
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats?zeroDateTimeBehavior=convertToNull", "root", "");
                    ResultSet currentSong = null;
                    Statement stm = con.createStatement();
                    currentSong = stm.executeQuery("Select * from musiclibrary where id = " + id);
                    currentSong.first();
            %>            

        <center>
            <div onclick="window.location = 'Player.jsp?id=4<%//next1.getString("id");%>'" class="card" style="margin-top: 50px;background: url('Everything or Nothing.jpg');background-size: 100%;">
                <div class="card-bg">
                    <div class="card-block">
                        <h3 class="card-title"><% //next1.getString("title");%> Everything OR Nothing <br> Willyecho <% //next1.getString("auth_name");%></h3>
                        <!--<p class="card-text">Role, Spring 2017</p>-->
                    </div>
                </div>
            </div>
            <div onclick="window.location = 'Player.jsp?id=3'" class="card" style="margin-top: 250px;background: url('Whatever it Takes.jpg');background-size: 100%;">
                <div class="card-bg">
                    <div class="card-block">
                        <h3 class="card-title">Whatever It Takes<br> Imagine Dragons</h3>
                        <!--<p class="card-text">Role, Spring 2017</p>-->
                    </div>
                </div>
            </div>
            <div onclick="window.location = 'Player.jsp?id=4'" class="card" style="margin-top: 450px;background: url('Legends Never Die.jpg');background-size: 100%;">
                <div class="card-bg">
                    <div class="card-block">
                        <h3 class="card-title">Legends Never Die<br> Against The Current</h3>
                        <!--<p class="card-text">Role, Spring 2017</p>-->
                    </div>
                </div>
            </div>
            <div id="player">
                <div class="album" style="background: linear-gradient(rgba(54, 79, 60, 0.25), rgba(73, 101, 77, 0.55)), url('AlbumImage.jpg');">
                    <div class="heart"><i class="fas fa-heart"></i></div>
                </div>
                <div class="info">
                    <div class="progress-bar">
                        <div class="time--current">1:25</div>
                        <div class="time--total">-3:15</div>
                        <div class="fill"></div>
                    </div>
                    <div class="currently-playing">
                        <h2 class="song-name"><%=currentSong.getString("title")%></h2>
                        <h3 class="artist-name"><%=currentSong.getString("auth_name")%></h3>
                    </div>
                    <div class="controls">
                        <div class="option"><i class="fas fa-bacurrentSong"></i></div>
                        <div class="volume" ><i class="fas fa-volume-up"></i></div>
                        <div class="previous" onclick="window.location = 'Player.jsp?id=<%= Integer.parseInt(request.getParameter("id")) - 1%>'"><i class="fas fa-backward"></i></div>
                        <div class="play"><i class="fas fa-play"></i></div>
                        <div class="pause"><i class="fas fa-pause"></i></div>
                        <div class="next" onclick="window.location = 'Player.jsp?id=<%= Integer.parseInt(request.getParameter("id")) + 1%>'"><i class="fas fa-forward"></i></div>
                        <div class="shuffle"><i class="fas fa-random"></i></div>
                        <div class="add"><i class="fas fa-plus"></i></div>
                    </div>
                </div>
            </div>
        </center>
        <section>

            <div class="tbl-header">
                <table cellpadding="0" cellspacing="0" border="0">
                    <thead>
                        <tr>
                            <th>Top 100 hits</th>          
                        </tr>
                    </thead>
                </table>
            </div>
            <div class="tbl-content">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tbody>
                        <%
                            try {
                                 Statement st = con.createStatement();
                                ResultSet song=  null;
                                song = st.executeQuery("Select * from musiclibrary");
                                while (song.next()) {
                        %>
                        <tr>
                            <td><%= song.getString("title") %></td>          
                        </tr>
                        <%
                        }
                        %>                               
                    </tbody>
                </table>
            </div>
        </section>
        <%
            }catch(Exception e){
                    
                }
        %>

       
        

        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
        
        <script>
                            //like & shuffle button
                            $('.heart').click(function () {
                                $(this).toggleClass('clicked');
                            });

                            $('.shuffle').click(function () {
                                $(this).toggleClass('clicked');
                            });

//show info box on hover
                            $('#player').hover(function () {
                                $('.info').toggleClass('up');
                                console.log("triggred");
                            });

//music player settings

                            let audio = new Audio('Music/' + '<%=currentSong.getString("path")%>');

                            $('.pause').hide(); //hide pause button until clicked

//play button
                            $('.play').click(function () {
                                audio.play();
                                $('.play').hide();
                                $('.pause').show();
                            });
                            //pause button
                            $('.pause').click(function () {                                
                                audio.pause();
                                $('.play').show();
                                $('.pause').hide();
                            });

        </script>
        <%
            } catch (Exception e) {
                out.print(e);
            }

        %>
    </body>
</html>

