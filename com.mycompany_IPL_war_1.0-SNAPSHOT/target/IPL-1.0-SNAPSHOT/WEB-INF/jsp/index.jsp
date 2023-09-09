

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    </head>
    <style>
        body {
            background-image: url('https://i.ibb.co/h7MLHvg/Bg.jpg');
            color:white;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        .rn:hover{
            color: rgba(67, 67, 67);
        }

    </style>
    <style>
        /* Styles for the loader */
        #loader {
      display: flex;
      justify-content: center;
      align-items: center;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: #f1f1f1;
      z-index: 9999;
    }
    
    .loader-circle {
      display: inline-block;
      width: 50px;
      height: 50px;
      border-radius: 50%;
      border: 3px solid #3498db;
      border-top-color: transparent;
      animation: spin 1s infinite ease-in-out;
    }
    
    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }
    </style>
    <body>
        <div id="loader">
    <div class="loader-circle"></div>
  </div>
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-black">
                <div class="container">
                    <div class="ps-4" href="https://ibb.co/Fzb5C8R"><img src="https://i.ibb.co/m4C9ghf/x-1.jpg" alt=""
                                                                         width="300" border="0"></div>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                        <ul class="navbar-nav ms-auto m-2 mb-lg-0">
                            <form action="gotologin">
                                <li class="nav-item pe-4">
                                    <button class="nav-link active" aria-current="page" type="submit" >Login</button>
                                </li>
                            </form>
                            <form action="register">
                                <li class="nav-item pe-4">
                                    <button class="nav-link " aria-current="page" type="submit" >Register</button>
                                </li>
                            </form>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <h1 align="center " class="text-white mt-3 mb-3">Welcome to, <br>
            <img src="https://i.ibb.co/PjsNCzS/E-cell-x-IPL.png" class="" alt="Logo"
                 width="20% ">
            <br> IPL Auction 2023
        </h1>
        <div align="center" class="container all">

            <p style="font-size: 1.2em;" class="card-text">Join us as we embark on an exciting virtual journey of IPL 2023 Team Auction in the
                world of cricket. E-Cell, MITAOE is proud to present this unique event, where you can experience the
                thrill of an IPL auction from the comfort of your own home.</p>
            <a href="#rules" class="btn btn-warning">How to play? Checkout Rulebook</a>
            <br>
        </div>
        <div class="d-flex justify-content-center pt-3">
            <form action="gotologin">
                <div class=" lbtns">
                    <button class="btn btn-success me-3" aria-current="page" type="submit" >Login</button>
                </div>
            </form>
            <form action="register">
                <div class=" lbtns">
                    <button class="btn btn-success ms-3" aria-current="page" type="submit" >Register</button>
                </div>
            </form>
        </div>

        <section class="container text-white pb-3 mt-5 mb-3 rulebook" style="background: rgba(0, 0, 0, 0.8); padding-top: 10px; border-radius: 20px;  font-size: 1.2em;" id="rules">

            <h1 align="center"class="text-warning" style="">Rule Book</h1>
            <div class="p-3" >
                IPL Auction Registration and Bidding Rules: <br>
                Entry will start at 250/- Rs for a team of 1-5 members.
            </div>

            <div  class="p-3" >
                Registration Process: <br>
                a. Teams interested in participating in the IPL auction must register on the official website. <br>
                b. Each team should consist of 1-5 members. <br>
                c. The team leader will be responsible for the registration process and further communication with the E-cell. <br>
                D. Only one team member needs to register on the official website initially. Confirmation of other team members can be done later. <br>

            </div>
            <br>
            <div class="p-3" >
                Bidding for Selection: <br>
                a. The selection of the top 10 teams will be based on bidding. <br>
                b. Teams must place a bid to secure a spot in the physical auction. <br>
                c. The highest bidding teams (up to the top 10) will be selected for the physical auction. <br>
                d. Bidding prices will be paid by the teams at the time of bidding and proof of payment (screenshot) must be uploaded.
                E. The team with the highest bid will have the first preference for the team name.<br>


            </div>
            <div class="p-3" >

                Refund Policy:<br>
                a. Non-selected teams that do not make it into the top 10 will receive a full refund. (After Event)<br>
                b. The selected top 10 teams are not eligible for a refund.<br>
            </div>

            <div class="p-3" >

                Live Leaderboard:<br>
                a. A live leaderboard will be available on the official website, showing the bidding rankings.<br>
                b. Participants should regularly check the leaderboard to ensure their bid is sufficient to secure a place in the top 10.
            </div>
            <br>
            <div class="p-3" >
                Bid Amount and Increase:<br>
                a. The bidding will start at a minimum of Rs 250 for the first-time registration.<br>
                b. Teams can increase their bid to secure a higher position in the top 10.<br>
                c. The minimum bid increment per bid will be Rs 20.<br>

            </div>

            <div class="p-3" >

                Payment Settlement:<br>
                a. It is crucial to ensure that the paid bid amount and the bidding value match.<br>
                b. The organizer may contact teams to settle any discrepancies in the amount by the end of each day.<br>
                c. Failure to settle the amount as required will result in disqualification, and no refund will be given.<br>
            </div>

        </section>

        <h1 align="center" class="mt-5 pb-4">Our Sponsers</h1>
        <section  class="spons container d-flex">

            <div class="row">
                <div align="center" class="img  pb-3 col-lg-4">
                    <img src="https://i.ibb.co/1vvNY64/Sponser-1.png" alt="Sponser-1" height="200" width="350"
                         style="margin-left: -1rem;">
                    <h4 style="margin-left: 8rem;">वक्रतुंड मिसळ</h4>
                </div>
                <div align="center" class="img  pb-3 col-lg-4">
                    <img src="https://lh3.googleusercontent.com/aIbJTbPbW67ReMhQnmfCG4pQZ6_ZOpbnY2j7X2DoCRX9rBSx9E3E7eEv-hesVrKta1C9ZGI4ka3EGzYd7df15A=s0"
                         alt="Sponser-2" height="200" width="300" style="margin-left: 1.6rem;">
                    <h4 style="margin-left: 4.5rem;">Javed Habib Hair & Beauty</h4>
                </div>
                <div align="center" class=" img pb-3  col-lg-4">
                    <img src="https://i.ibb.co/g4XY3k7/crop.jpg" alt="crop" border="0" class=" " height="150" width="350" style="margin-left: 1.6rem;">

                    <h4 style="margin-left: 4.5rem;">Disha Academy</h4>
                </div>
            </div>
        </section>
        <style>
            .bi{
                padding: 20px;
                font-size: 1.5em;
                color: white;
            }
        </style>
        <footer class="bg-black">
            <h2 align="center" class="pt-2 ">Connect with us</h2>
            <div class="row pb-3">
                <div class=" d-flex justify-content-center p">
                    <a href="#" id="insta">
                        <i class="bi bi-instagram"></i>
                    </a>
                    </a>
                    <a href="#" id="linkedin">
                        <i class="bi bi-linkedin"></i>
                    </a>
                    </a>
                    <a href="#" id="yt">
                        <i class="bi bi-youtube"></i>
                    </a>
                </div>
            </div>
        </footer>

    </body>
    

    <!-- Your HTML content -->
    <!-- Place your <img>, CSS, and JavaScript files here -->

    <script>
       var loader = document.getElementById('loader');
    loader.style.display = 'flex';

    // Hide the loader when everything has finished loading
    window.addEventListener('load', function() {
      loader.style.display = 'none';
    });
    </script>
</html>