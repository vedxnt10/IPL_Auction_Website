<%-- 
    Document   : dashboard
    Created on : May 21, 2023, 3:40:42 AM
    Author     : Yash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.js"
        integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    </head>
    <style>
        nav .nav-link {
            font-size: 1.2em;
        }

        body {
            background-image: url('https://i.ibb.co/DVbzkn1/Bg.jpg');

            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        .table{
            background: rgba(255, 255, 255, 0.5);
            border-radius: 20px;
        }
        thead th{
            color: yellow;
            font-size: 1.5em;
        }
        tbody tr{
            font-size: 1.2em;
        }
    </style>

    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-black">
                <div class="container">
                    <a class="ps-4" href="https://ibb.co/Fzb5C8R"><img src="https://i.ibb.co/m4C9ghf/x-1.jpg" alt=""
                                                                       width="300" border="0"></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                        <ul class="navbar-nav ms-auto m-2 mb-lg-0">
                            
                            
                            
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <h1 align="center" class="text-white mt-3 mb-3">The group_name you want is already taken!!!!</h1>
        <h1 align="center" class="text-white mt-3 mb-3">Try with another group name!!</h1>
        <a href="index">click here to register</a>
        

    </body>

</html>