<%-- 
    Document   : register
    Created on : May 21, 2023, 2:46:20 AM
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
                      <h3 class="mb-4 pb-1 pb-md-0 mb-md-5 px-md-2">Register Here</h3>
          
                      <form action="process_register" method="post" class="px-md-2">
          
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example1q">Your Team Name</label>
                            <input name="team_name" type="text" id="form3Example1q" class="form-control" placeholder="Eg. Immortals, playes, winnners, etc." required />
                        </div>
          
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example1q">Team Leader Name</label>
                            <input name="lead_name" type="text" id="form3Example1q" class="form-control" placeholder="Eg. Vedant Mane, Yashwant Gavali, etc." required/>
                        </div>
          
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example1q">Priority Team</label>
                            <select class="form-select" name="pteam" aria-label="Default select example" required>
                                <option selected value="Mumbai Indians">Mumbai Indians</option>
                                <option value="Chennai Super Kings">Chennai Super Kings</option>
                                <option value="Delhi Capitals">Delhi Capitals</option>
                                <option value="Gujarat Titans">Gujarat Titans</option>
                                <option value="Kolkata Knight Riders">Kolkata Knight Riders</option>
                                <option value="Royal Challengers Banglore">Royal Challengers Banglore</option>
                                <option value="Rajasthan Royals">Rajasthan Royals</option>
                                <option value="Lucknow Super Giants">Lucknow Super Giants</option>
                                <option value="Sunrises Hydrabad">Sunrises Hydrabad</option>
                                <option value="Sunrises Hydrabad">Punjab Kings</option>
                              </select>
                        </div>
          
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example1q">Phone no</label>
                            <input name="phone" type="number" class="form-control" maxlength="10" placeholder="Eg. 9372893759" title="Please enter a valid phone number (up to 10 digits)" required>
                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example1q">Email id</label>
                            <input type="email" id="form3Example1q" name="email" class="form-control" placeholder="Eg. ecell@mitaoe.ac.in" required/>
                        </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example1q">Password</label>
                            <input type="password" id="form3Example1q" name="pass" class="form-control" placeholder="*******" required/>
                        </div>
          
                        <div id="qrcode" align="center" class="p-3  qrsty">
                            
                    </div>
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form3Example1q">UPI Transaction ID</label>
                            <input type="number" id="form3Example1q" name="trans" class="form-control"  placeholder="your id you get after payment(base price)" required/>
                        </div>
                          
                        <button type="submit" class="btn btn-success btn-lg mb-1">Register</button>
          
                      </form>
                      <form action="gotologin" align="right">
                            If registered already<button type="submit" class="rlbtn" value=""><u> Login here </u></button>
                        </form> 
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
    </body>
<script>
    var qrCode = null; // initialize global variable to null
    var check = 0;
    generateQRCode();
    function generateQRCode() {

        // Get the input value
        var amount = 250;
        
        var upiId = "vedant.mane2510@oksbi";
        var qrCodeText = "upi://pay?pa=" + upiId + "&pn=E-Cell+IPL+Auction&am=" + 250 + "&cu=INR";
        var size = 250;
        // Generate QR code image
        if (qrCode === null) {
            qrCode = new QRCode(document.getElementById("qrcode"), {
                text: qrCodeText,
                width: size,
                height: size,
                colorDark: "#000000",
                colorLight: "#ffffff",
                correctLevel: QRCode.CorrectLevel.H
            });
        } else {
            qrCode.clear(); // remove existing QR code
            qrCode.makeCode(qrCodeText); // generate new QR code
        }

        $('.qr_title').addClass('showthis');

    }
</script>
</html>