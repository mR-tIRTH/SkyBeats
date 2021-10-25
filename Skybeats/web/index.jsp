<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Music</title>
        <script>
            function validateForm() {
                var pass = document.forms["myForm"]["pass"].value;

                if (pass.length !== 6) {
                    alert('password should be of 6 letters');
                    return false;
                }

            }
        </script>

        <style>
            .block {
                display: grid;
                grid-template-columns: auto auto;

                height: 500px;
                width: 70%;
                background-color: white;
                margin-left: 15%;
                margin-top: 7%;
                box-sizing: border-box;
                box-shadow: black;
                border-radius: 10px;
            }


            img {
                height: 360px;
                width: 360px;
                margin-left: 90px;
                margin-top: 5%;
            }

            form {
                margin-left: 20%;
                margin-top: 5%;

            }

            input[type=email],[type=password] {
                height: 20px;
                width: 230px;
                border: 1px solid #2014c7 ;
                display: inline-block;
                font-family: cursive;

                padding: 15px;
                font-size: 20px;
                margin: 8px 0;
                margin-top: 20px;
                -webkit-border-radius: 10px;
                -moz-border-radius: 10px;
            }
            input:focus {
                outline: none;
                border: 1px solid ;
                font-family: cursive;

                color: #2d9fd9;
            }

            .submit {
                height: 40px;
                width: 100px;
                border-radius: 6px;
                margin-left: 85px;
                margin-top: 20px;
                font-weight: bolder;
                font-family: cursive;
                background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003235) 68%, rgba(255, 206, 196, 0.5) 163%), linear-gradient(163deg, rgba(49, 146, 170, 0.0794448997) 86%, rgba(239, 112, 138, 0.5) 40%), linear-gradient(30deg, rgba(76, 79, 173, 0.6173675717) 22%, rgba(237, 106, 134, 0.5) 169%), linear-gradient(48deg, rgba(31, 85, 147, 0.7323890642) 64%, rgba(247, 126, 132, 0.5) 43%);
                background-blend-mode: overlay,multiply,color,normal;            color: white;
                font-size: small;
            }

            :placeholder-shown {
                align-content: center;
                text-align: center;
                font-size: 15px;
                color: black;
                font-family: cursive;

                font-weight:300;
                font-family: cursive;

            }

            a {
                padding-top: 20px;
                padding-left: 40px;
                padding-right: 40px;
                padding-bottom: 20px;
                width: 200px;
                font-family: cursive;

                border-radius: 6px;
                margin-left: 200px;
                font-weight: bolder;
                font-family: cursive;
                background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003235) 68%, rgba(255, 206, 196, 0.5) 163%), linear-gradient(163deg, rgba(49, 146, 170, 0.0794448997) 86%, rgba(239, 112, 138, 0.5) 40%), linear-gradient(30deg, rgba(76, 79, 173, 0.6173675717) 22%, rgba(237, 106, 134, 0.5) 169%), linear-gradient(48deg, rgba(31, 85, 147, 0.7323890642) 64%, rgba(247, 126, 132, 0.5) 43%);
                background-blend-mode: overlay,multiply,color,normal;
                color: white;
                font-size: small;
            }
        </style>
    </head>

    <body style="font-size: large; height: 84.5vh;position: relative; background-repeat: no-repeat;background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003235) 68%, rgba(255, 206, 196, 0.5) 163%), linear-gradient(163deg, rgba(49, 146, 170, 0.0794448997) 86%, rgba(239, 112, 138, 0.5) 40%), linear-gradient(30deg, rgba(76, 79, 173, 0.6173675717) 22%, rgba(237, 106, 134, 0.5) 169%), linear-gradient(48deg, rgba(31, 85, 147, 0.7323890642) 64%, rgba(247, 126, 132, 0.5) 43%);
          background-blend-mode: overlay,multiply,color,normal; ">

        <div class="block">

            <div style="margin-top: 50px;">
                <h1 style="margin-left: 7em;color: #3E4CB4 ;font-size: 50px">SKY BEATS</h1>

                <br><br><br><br><br><br><br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="text-decoration: none;font-size: 30px" href="login.jsp">User</a>

                <a style="text-decoration: none;font-size: 30px" href="Adminlogin.jsp">Admin</a>
            </div>


    </body>

</html>