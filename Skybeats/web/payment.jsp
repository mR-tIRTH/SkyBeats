<%-- 
    Document   : payment
    Created on : Oct 20, 2020, 9:58:23 PM
    Author     : tirth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <script>
            function validateForm() {
                var cv = document.forms["myForm"]["cv"].value;

                if (cv.length !== 3) {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Password Should be of 6 letters',
                        text: 'Please Login Again!',
                    })
                    return false;
                }

            }
            
            
        </script>

        <style>
            #card{
                white-space: initial;
            }
            
            .block {
                display: grid;
                grid-template-columns: auto auto;
                
                height: 550px;
                width: 40%;
                background-color: white;
                margin-left: 33%;
                margin-top: 5%;
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

            input[type=text],[type=password] , [type=tel] {
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
                padding-top: 10px;
                padding-left: 20px;
                padding-right: 20px;
                padding-bottom: 10px;
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
   <body style="font-size: large; height: 88.6vh;position: relative; background-repeat: no-repeat;background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003235) 68%, rgba(255, 206, 196, 0.5) 163%), linear-gradient(163deg, rgba(49, 146, 170, 0.0794448997) 86%, rgba(239, 112, 138, 0.5) 40%), linear-gradient(30deg, rgba(76, 79, 173, 0.6173675717) 22%, rgba(237, 106, 134, 0.5) 169%), linear-gradient(48deg, rgba(31, 85, 147, 0.7323890642) 64%, rgba(247, 126, 132, 0.5) 43%);
          background-blend-mode: overlay,multiply,color,normal; ">
       <div class="block">
           
           <form action="upgrade.jsp" name="myForm" onsubmit="return validateForm() method="post">
                            <div style="margin-top: 50px; margin-left: 95px;                font-family: cursive;
                     font-weight: bold;">Payment details!!</div>
                <br> <br> 
               <input style="width: 52px" type="password" autofocus="true" name="card1" maxlength="4" placeholder="****" required>
               <input style="width: 52px" type="password" autofocus="true" name="card2" maxlength="4" placeholder="****" required>
               <input style="width: 52px" type="password" autofocus="true" name="card3" maxlength="4" placeholder="****" required>
               <input style="width: 52px" type="password" autofocus="true" name="card4" maxlength="4" placeholder="****" required>

               <br >
               <input style="width: 16em" type="text" autofocus="true" name="name" placeholder="Name on card" required>
                <br >
                 <input style="width: 16em" type="text" autofocus="true" name="phone" placeholder="Phone no" required>
                <br >
                <input style="width: 21.5em" type="password" autofocus="true" maxlength="3" name="cv" placeholder="Cvv No" required>
                <br>
                <input style="margin-left: 10em" class="submit" type="submit" value="submit">

        </form>

       </div>
   </body>
</html>
