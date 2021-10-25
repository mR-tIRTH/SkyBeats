<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Music</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
      <%
                            String uid = (String) session.getAttribute("username");
                            if (uid == null) {
                        %>
                        <jsp:forward page="index.jsp"/>
                        <%
                        }%> 
            
        <script>
            function validateForm() {
                var pass = document.forms["myForm"]["pass"].value;
                var repass = document.forms["myForm"]["repass"].value;

                if (pass.length !== 6) {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Password Should be of 6 letters',
                        text: 'Please Login Again!',
                    })
                    return false;
                }
                if (pass !== repass) {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Password Should match to confirm password',
                        text: 'Try To write Same Password!',
                    })
                    return false;
                }
            }
        </script>

        <style>
            .block {
                display: grid;
                grid-template-columns: auto auto;

                height: 550px;
                width: 70%;
                background-color: white;
                margin-left: 15%;
                margin-top: 4%;
                box-sizing: border-box;
                box-shadow: black;
                border-radius: 2%;
            }


            img {
                height: 360px;
                width: 360px;
                margin-left: 90px;
                margin-top: 10%;
            }

            form {
                margin-left: 20%;
                margin-top: 5%;

            }
            input[type=file] {
                padding: 5px  
            }
            input[type=password],[type=email],[type=text] {
                height: 20px;
                width: 230px;
                border: 1px solid #2014c7 ;
                padding: 15px;
                font-size: 15px;
                margin: 10px 60px;
                border-radius: 6px;
                margin-top: 20px;
                -webkit-border-radius: 10px;
                -moz-border-radius: 10px;
            }
            input:focus {
                outline: none;
                border: 1px solid ;
                color: #2d9fd9;
            }
            .submit {
                height: 40px;
                width: 100px;
                border-radius: 6px;
                margin-left: 145px;
                margin-top: 15px;

                font-weight: bolder;
                font-family: 'Montserrat';
                background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003235) 68%, rgba(255, 206, 196, 0.5) 163%), linear-gradient(163deg, rgba(49, 146, 170, 0.0794448997) 86%, rgba(239, 112, 138, 0.5) 40%), linear-gradient(30deg, rgba(76, 79, 173, 0.6173675717) 22%, rgba(237, 106, 134, 0.5) 169%), linear-gradient(48deg, rgba(31, 85, 147, 0.7323890642) 64%, rgba(247, 126, 132, 0.5) 43%);
                background-blend-mode: overlay,multiply,color,normal;                color: white;
                font-size: small;
            }

            :placeholder-shown {
                align-content: center;
                text-align: center;
                font-size: 15px;
                color: black;
                font-weight:300;
                font-family: 'Montserrat';
            }

            a {
                padding-top: 10px;
                padding-left: 20px;
                padding-right: 20px;
                padding-bottom: 10px;
                border-radius: 6px;
                width: 200px;

                margin-left: 260px;
                font-weight: bolder;
                font-family: 'Montserrat';
                background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003235) 68%, rgba(255, 206, 196, 0.5) 163%), linear-gradient(163deg, rgba(49, 146, 170, 0.0794448997) 86%, rgba(239, 112, 138, 0.5) 40%), linear-gradient(30deg, rgba(76, 79, 173, 0.6173675717) 22%, rgba(237, 106, 134, 0.5) 169%), linear-gradient(48deg, rgba(31, 85, 147, 0.7323890642) 64%, rgba(247, 126, 132, 0.5) 43%);
                background-blend-mode: overlay,multiply,color,normal;                color: white;
                font-size: small;
            }
        </style>
    </head>

    <body style="font-size: large; height: 587px; background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003235) 68%, rgba(255, 206, 196, 0.5) 163%), linear-gradient(163deg, rgba(49, 146, 170, 0.0794448997) 86%, rgba(239, 112, 138, 0.5) 40%), linear-gradient(30deg, rgba(76, 79, 173, 0.6173675717) 22%, rgba(237, 106, 134, 0.5) 169%), linear-gradient(48deg, rgba(31, 85, 147, 0.7323890642) 64%, rgba(247, 126, 132, 0.5) 43%);
          background-blend-mode: overlay,multiply,color,normal; ">

        <div class="block">

            <div style="margin-top: 50px;">
                <img src="undraw_authentication_fsn5.svg" alt=""></div>

            <form action="Adminsignupdb.jsp" method="post" name="myForm" onsubmit="return validateForm()">
                <div style="margin-top: 10px; font-family:'Montserrat';font-weight: bold;">Join Us!!</div>
                <br> <br> 
                <input type="email" autofocus="true" name="email" placeholder="Email" required>
                <input type="text" autofocus="true" name="user" placeholder="Username" required>
                <input type="password" autofocus="true" name="pass" placeholder="password" required>
                <input type="password" autofocus="true" name="repass" placeholder="confirm password" required>

                <input class="submit" type="submit" value=SignUp>
            </form>
        </div>


    </body>

</html>