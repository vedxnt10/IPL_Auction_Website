<%-- 
    Document   : login
    Created on : May 21, 2023, 3:05:55 AM
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
        .rlbtn{
            background: none;
            border: none;
            color:yellow;
            
        }
        .rlbtn:hover{
            transition:0.3s;
            color:white;
        }
    </style>
<body>
    
    <section class="h-100 h-custom" style="">
            <div class="container py-5 h-100">
              <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-lg-8 col-xl-6">
                  <div style="background-color: rgba(255, 255, 255, 0.34);" class="card text-white rounded-3">
                    <img src="https://i.ibb.co/m4C9ghf/x-1.jpg"
                      class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
                      alt="Sample photo">
                    <div class="card-body p-4 p-md-5">
                      <h3 class="mb-4 pb-1 pb-md-0 mb-md-5 px-md-2">Login Here</h3>
          
                      <form action="login" method="post"  class="px-md-2">
          
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example1q">Team Name</label>
                            <input name="team_name" type="text" id="form3Example1q" class="form-control" placeholder="Eg. Immortals, playes, winnners, etc." required />
                        </div>
          
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example1q">Passwod</label>
                            <input name="password" type="password" id="form3Example1q" class="form-control" placeholder="********" required/>
                        </div>
          
                        <button type="submit" class="btn btn-success btn-lg mb-1">Login</button>
                        
                        
                      </form>
                      
                        <form action="register" align="right">
                            If not registered <button type="submit" class="rlbtn" value=""><u> Register here </u></button>
                        </form> 
                      
          
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
</body>
</html>