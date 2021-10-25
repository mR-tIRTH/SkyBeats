<%-- 
    Document   : Dashboard
    Created on : Oct 13, 2020, 10:28:05 PM
    Author     : Stark
--%>

<%@page import="java.util.Random"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Playlist</title>
        <link rel="stylesheet" href="./DashboardStyle.css">
        <style>
            a {
                text-decoration: none;
                color: black;
            }

            a:active {
                color: purple;
                font-size: 10px;
            }

            input[type=text] {
                padding: 8px;
                margin-left: 40px;
                margin-bottom: 10px;
                align-content: center;
                border-radius: 10px;
                border-color: bisque
            }

            input[type=submit] {
                margin-left: 5px;
                padding: 8px;
                border-radius: 10px;
                border-color: bisque;
                background-color: bisque
            }
            input[type=button] {
                margin-top: 20px;
                padding: 10px;
                border-radius: 10px;

                border-color: bisque;
                background-color: bisque
            }

            .footer {
                font-size: 15px;
                color: var(--main-text-color);
                margin-top: 15px;
            }
        </style>
    </head>

    <body>

        <!-- partial:index.partial.html -->
        <link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet">
        <div class="task-manager">
            <div class="left-bar">
                <div class="upper-part">
                    <div class="actions">
                        <div class="circle"></div>
                        <div class="circle-2"></div>
                    </div>
                    <center><a href="profilePage.jsp"><img src="https://img.icons8.com/ios/50/000000/user-male-circle.png"/></a>
                            <%
                                String username = (String) session.getAttribute("username");
                                String userId = (String) session.getAttribute("userid");
                                String playListID = "u" + userId + "p" + userId;

                                if (username == null) {
                            %>
                            <jsp:forward page="index.jsp"/>
                            <%
                            } else {
                            %><br><div style="font-size: 20px;font-family: cursive"><% out.print(username); %></div><%}%> 
                    </center>
                </div>                        
                <div class="left-content">
                    <ul class="action-list">
                        <li class="item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
                                 stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-inbox"
                                 viewBox="0 0 24 24">
                            <path d="M22 12h-6l-2 3h-4l-2-3H2" />
                            <path
                                d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z" />
                            </svg>
                            <a  href="Dashboard.jsp" ><span>Home</span></a>


                        </li>
                        <li class="item">
                            <img src="playlist.svg" style="height: 14px;width: 14px;margin-right: 8px;opacity:0.6;"/>
                            <a style="text-decoration: none"  href="PlayList.jsp"><span>Playlist</span></a>
                        </li>
                        <li class="item">        
                            <img src="download.svg" style="height: 14px;width: 14px;margin-right: 8px;opacity:0.7;"/>
                            <a style="text-decoration: none"  href="Download.jsp"><span>Downloads</span></a>
                        </li>                        
                        <li class="item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                 stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                 class="feather feather-star">
                            <polygon
                                points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
                            </svg>
                            <a style="text-decoration: none" href="proPage.jsp"><span>Upgrade</span></a>
                        </li>
                        <li class="item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
                                 stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-calendar"
                                 viewBox="0 0 24 24">
                            <rect width="18" height="18" x="3" y="4" rx="2" ry="2" />
                            <path d="M16 2v4M8 2v4m-5 4h18" />
                            </svg>

                            <a style="text-decoration: none"  href="uploadPage.jsp"><span>Add Song</span></a>
                        </li>                        
                        <li class="item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
                                 stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-trash"
                                 viewBox="0 0 24 24">
                            <path d="M3 6h18m-2 0v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
                            </svg>
                            <a style="text-decoration: none"  href="#"><span>Recently Play Songs</span></a>
                        </li>
                    </ul>
                    <ul class="category-list">
                        <li class="item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                 stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                 class="feather feather-users">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
                            <circle cx="9" cy="7" r="4" />
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
                            <path d="M16 3.13a4 4 0 0 1 0 7.75" /></svg>
                            <a style="text-decoration: none"  href="#"><span>Fav Artist</span></a>
                        </li>
                        <li class="item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
                                 stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-sun"
                                 viewBox="0 0 24 24">
                            <circle cx="12" cy="12" r="5" />
                            <path
                                d="M12 1v2m0 18v2M4.22 4.22l1.42 1.42m12.72 12.72l1.42 1.42M1 12h2m18 0h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42" />
                            </svg>
                            <a style="text-decoration: none"  href="#"><span>Album</span></a>
                        </li>
                        <li class="item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                 stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                 class="feather feather-trending-up">
                            <polyline points="23 6 13.5 15.5 8.5 10.5 1 18" />
                            <polyline points="17 6 23 6 23 12" /></svg>
                            <a style="text-decoration: none"  href="#"><span>Radio</span></a>
                        </li>
                        <li class="item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                 stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                 class="feather feather-zap">
                            <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2" /></svg>
                            <a style="text-decoration: none"  href="downloadPage.jsp"><span>Concert</span></a>
                        </li>
                    </ul>
                    <a href="logout.jsp"><input type="button" value="Logout"></a>
                </div>
            </div>
            <div class="page-content">
                <div class="header">Your Playlist</div>
                <div class="content-categories">
                    <div class="label-wrapper">
                        <input class="nav-item" name="nav" type="radio" id="opt-1">
                        <label class="category" for="opt-1" onclick="allSongs();">All</label>
                    </div>
                    <div class="label-wrapper">
                        <input class="nav-item" name="nav" type="radio" id="opt-2" checked>
                        <label class="category" for="opt-2" onclick="PlayListing();">Playlist</label>
                    </div>
                    <div class="label-wrapper" onclick="">
                        <input class="nav-item" name="nav" type="radio" id="opt-3">
                        <label class="category" for="opt-3" onclick="recommendation();">Recommedations</label>
                    </div>
                    <!--        <div class="label-wrapper" onclick="">
                              <input class="nav-item" name="nav" type="radio" id="opt-4">
                              <label class="category" for="opt-4">Links</label>
                            </div>-->
                </div>
                <div class="tasks-wrapper" id ='-2'>
                    <%
                        try {
                            int i = 0;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skybeats?zeroDateTimeBehavior=convertToNull", "root", "");
                            ResultSet songs = null;
                            Statement stm = con.createStatement();
                            songs = stm.executeQuery("Select * from " + playListID);
                            while (songs.next()) {
                                if (i == 7) {
                    %>
                    <div class="header upcoming">Upcoming Songs</div>
                    <%
                        }
                    %>
                    <div class="task" id='-1' onclick="window.location = 'Player.jsp?id=<%= songs.getString("songId")%>'">
                        <label for="item-2">
                            <span class="label-text" id=" <%= i%>"> <%=songs.getString("SongName")%> </span>
                        </label>
                        <span class="tag progress"><a href= "removeSongToPlaylist.jsp?id=<%=songs.getString("songId")%>" >Remove</a></span>
                    </div>
                    <%
                            i++;
                        }
                    %>
                </div>
            </div>

            <div class="right-bar">
                <div class="top-part">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-users">
                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
                    <circle cx="9" cy="7" r="4" />
                    <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
                    <path d="M16 3.13a4 4 0 0 1 0 7.75" /></svg>

                </div>
                <div class="header">&nbsp;&nbsp;&nbsp;Comments</div>

                <div class="right-content">

        <%                     
                        Statement mystatement = con.createStatement();
                        ResultSet comments = mystatement.executeQuery("Select * from skybeatscomments");

                        try {

                            out.print("<h4>");
                                                        while (comments.next()) {
                                String color = comments.getString("color");
                                String com = comments.getString("comdata");
                                String comname = comments.getString("name");
                                if (com != null) {
                    %> <div class="task-box <%=color%>"><%
                        %> <div class="description-task"><%
                            %><div class="task-name"><%                                
                                out.print(comname+" : ");
                                out.print(com);
                                %></div><%

                                %> <div class="time"><%                                    out.print(comments.getString("time"));
                                %></div><%
                                %><%
                                %></div><%
                        %><div class="members">
                            <img
                                src="https://images.unsplash.com/photo-1484688493527-670f98f9b195?ixlib=rb-1.2.1&auto=format&fit=crop&w=2230&q=80"
                                alt="member">
                            <img
                                src="https://images.unsplash.com/photo-1469334031218-e382a71b716b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80"
                                alt="member-2">
                            <img
                                src="https://images.unsplash.com/photo-1455504490126-80ed4d83b3b9?ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80"
                                alt="member-3">
                        </div><%
                        %></div><%                                    } else {
                                        break;
                                    }

                                }
                                out.print("</h4>");

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                </div>
                <form class="footer" action="comdb.jsp">
                    <input type="text" name="comment" required="true">
                    <input type="submit" name="submit" value="Send">
                </form>
            </div>
        </div>
        <!-- partial -->
        <script type="text/javascript">
            function allSongs() {
                var ele = document.getElementById('-2');
                ele.querySelectorAll('*').forEach(n => n.remove());
      //        ele.parentNode.removeChild(ele);
      //        var ele = document.getElementById('-1');
      //        ele.parentNode.removeChild(ele);
                var songsName = [];
                var songId = [];
            <%
              try {
                  ResultSet PlayList = null;
                  Statement s = con.createStatement();
                  PlayList = s.executeQuery("Select title,id from musiclibrary");
                  while (PlayList.next()) {
            %> songsName.push('<%= PlayList.getString("title")%>');<%
            %> songId.push('<%= PlayList.getString("id")%>');<%
                              }
                          } catch (Exception e) {
            %>consol.log(<% out.print(e); %>)<%
                      }
            %>
                for (var i = 0; i < songsName.length; i++) {
                    if (i === 7) {
                        document.getElementById("-2").innerHTML += '<div class="header upcoming">Upcoming Songs</div>';
                    }
      //            console.log(i);
      //        document.getElementById(" "+i).innerHTML = songsName[i];
                    document.getElementById("-2").innerHTML +=
                            '<div class="task" id="-1" onclick="window.location = ' + "'" + 'Player.jsp?id=' + songId[i] + "'" + '"><label for="item-2"><span class="label-text" id="0">' + songsName[i] + '</span></label><span class="tag progress" ><a href= ' + "'" + 'addSongToPlaylist.jsp?id=' + songId[i] + "'" + '" >Add</a></span></div>';
                }
      //      console.log("done");
            }
        </script>
        <script>
            function PlayListing() {
                var ele = document.getElementById('-2');
                ele.querySelectorAll('*').forEach(n => n.remove());
    //        var ele = document.getElementById('-1');
    //        ele.parentNode.removeChild(ele);
    //        var ele = document.getElementById('-1');
    //        ele.parentNode.removeChild(ele);
    //        var ele = document.getElementById('-1');
    //        ele.parentNode.removeChild(ele);

    //   $('.task').remove();
                var pl = [];
                var songid = [];
            <%
            try {
                ResultSet PlayList = null;
                Statement s = con.createStatement();
                PlayList = s.executeQuery("Select * from " + playListID);
                while (PlayList.next()) {
            %> pl.push('<%= PlayList.getString("SongName")%>');<%
            %> songid.push('<%= PlayList.getString("songId")%>');<%
                            }
                        } catch (Exception e) {
            %>consol.log(<% out.print(e); %>)<%
                    }
            %>
                for (var i = 0; i < pl.length; i++) {
                    if (i === 7) {
                        document.getElementById("-2").innerHTML += '<div class="header upcoming">Upcoming Songs</div>';
                    }
    //            console.log( '<div class="task" id="-1" onclick="window.location = '+"'"+'Player.jsp?id='+songid[i]+"'"+'"><label for="item-2"><span class="label-text" id="0">'+pl[i]+'</span></label><span class="tag progress">In Progress</span></div>');
                    document.getElementById("-2").innerHTML +=
                            '<div class="task" id="-1" onclick="window.location = ' + "'" + 'Player.jsp?id=' + songid[i] + "'" + '"><label for="item-2"><span class="label-text" id="0">' + pl[i] + '</span></label><span class="tag progress">Remove</span></div>';

                }
            }
        </script>
        <script>
            function recommendation() {
                var ele = document.getElementById('-2');
                ele.querySelectorAll('*').forEach(n => n.remove());

                var recSong = [];
                var recSongId = [];
            <%
                  try {
                      Random randNum = new Random();
                      ResultSet PlayList = null;
                      Statement s = con.createStatement();
                      String sqls = "Select id,title from musiclibrary where id in (" + (randNum.nextInt(9) + 1) + "," + (randNum.nextInt(9) + 1) + "," + (randNum.nextInt(9) + 1) + "," + (randNum.nextInt(9) + 1) + "," + (randNum.nextInt(9) + 1) + "," + (randNum.nextInt(9) + 1) + "," + (randNum.nextInt(9) + 1) + "," + (randNum.nextInt(9) + 1) + "," + (randNum.nextInt(9) + 1) + "," + (randNum.nextInt(9) + 1) + ")";
                      PlayList = s.executeQuery(sqls);
            %> console.log('<%= sqls%>');
                <%
                        while (PlayList.next()) {
            %> recSong.push('<%= PlayList.getString("title")%>');<%
            %> recSongId.push('<%= PlayList.getString("id")%>');<%
                              }
                          } catch (Exception e) {
            %>consol.log(<% out.print(e); %>)<%
                      }
            %>
                for (var i = 0; i < recSong.length; i++) {
                    if (i === 7) {
                        document.getElementById("-2").innerHTML += '<div class="header upcoming">Upcoming Songs</div>';
                    }
                    document.getElementById("-2").innerHTML +=
                            '<div class="task" id="-1" onclick="window.location = ' + "'" + 'Player.jsp?id=' + recSongId[i] + "'" + '"><label for="item-2"><span class="label-text" id="0">' + recSong[i] + '</span></label><span class="tag progress"><a href= ' + "'" + 'addSongToPlaylist.jsp?id=' + recSongId[i] + "'" + '" >Add</a></span></div>';
                }
            }

        </script>

    </body>

</html>
<%
    } catch (Exception e) {

    }

%>



<!--//Work queries 
/*

ALTER TABLE auth MODIFY id int NOT NULL AUTO_INCREMENT;
select * from auth
INSERT INTO auth(email,name,password) values('Some@Someware.com','Mahesh','123456')

delete from auth

INSERT INTO auth(email,name,password) values('someone@somewhere.com','NoOne','123456')

*/-->