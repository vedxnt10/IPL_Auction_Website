<%-- 
    Document   : addbid
    Created on : May 21, 2023, 3:53:15 AM
    Author     : Yash
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
Connection con=(Connection)request.getAttribute("con");

int id=(int)request.getAttribute("id");
    String tn = (String)request.getAttribute("tn");
%>
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

    .forf {
        color: white;
        font-size: 1.5em;
    }

    .gpay #qrcode,
    .gpay .qr_title {
        display: flex;
        color: white;
        margin: auto;
        justify-content: center;
        align-items: center;
    }

    .bid-all {
        margin-top: 100px;
    }

    .qr_title {
        display: none;
    }

    .showthis {
        display: block;
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
                            
                            <form action="dashboard" method="post">
                                <li class="nav-item pe-4">
                                    <input type="hidden" name="tn" value="<%=tn%>" />
                                    <input type="hidden" name="id" value="<%=id%>" />
                                    <button class="nav-link " aria-current="page" type="submit" >Dashboard</button>
                                </li>
                            </form>
                            <form action="addbid" method="post">
                                <li class="nav-item pe-4">
                                    <input type="hidden" name="tn" value="<%=tn%>" />
                                    <input type="hidden" name="id" value="<%=id%>" />
                                    <button class="nav-link active" aria-current="page" type="submit" >Add Bid</button>
                                </li>
                            </form>
                            <form action="leaderboard" method="post">
                                <li class="nav-item pe-4">
                                    <input type="hidden" name="tn" value="<%=tn%>" />
                                    <input type="hidden" name="id" value="<%=id%>" />
                                    <button class="nav-link " aria-current="page" type="submit" >LeaderBoard</button>
                                </li>
                            </form>
                            <form action="logout" method="post">
                                <li class="nav-item pe-4">
                                    <input type="hidden" name="tn" value="<%=tn%>" />
                                    <input type="hidden" name="id" value="<%=id%>" />
                                    <button class="nav-link " aria-current="page" type="submit" >Logout</button>
                                </li>
                            </form>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
    <div class="bid-all container">
        <%
        
        %>
        <div class="row">
            <div class="col-md-6">
                <div class="gpay">
                    <div class="qr_title mt-3 mb-3"><h3>QR will Appear here, scan to pay the amount</h3></div>
                    <div id="qrcode" class="p-3  qrsty">
                    </div>
                    <img src="" alt="">
                </div>
                <style>
                    .qrsty{
                       width: fit-content; 
                       background: white;
                       
                    }
                </style>
            </div>
            <div class="col-md-6 bid-form order-first">
                <form action="bidadded" method="post" enctype="multipart/form-data">
                    <div class="form-row ">
                        <div class="col-12 forf mb-3">
                            <label for="validationDefault01">Bid Amount</label>
                            <input type="number" id="amount" min="20" name="amount" class="form-control"
                                id="validationDefault01" placeholder="" required>
                        </div>
                        <style>
                            .pt{
                                font-size: 1.5em;
                            }
                        </style>
                        <button type="button" class="btn btn-outline-success " onclick="generateQRCode()">Generate QR
                            Code</button>
                        <div class="form-outline mb-4">
                            <label for="validationDefault01" class="text-white pt mt-4">Priority Team</label>
                            <select name="pteam" class="form-select" aria-label="Default select example" required>
                                <option selected value="Mumbai Indians">Mumbai Indians</option>
                                <option value="Chennai Super Kings">Chennai Super Kings</option>
                                <option value="Delhi Capitals">Delhi Capitals</option>
                                <option value="Gujarat Titans">Gujarat Titans</option>
                                <option value="Kolkata Knight Riders">Kolkata Knight Riders</option>
                                <option value="Royal Challengers Banglore">Royal Challengers Banglore</option>
                                <option value="Rajasthan Royals">Rajasthan Royals</option>
                                <option value="Lucknow Super Giants">Lucknow Super Giants</option>
                                <option value="Sunrises Hydrabad">Sunrises Hydrabad</option>
                                <option value="Punjab Kings">Punjab Kings</option>
                              </select>
                        </div>
                        <div class="mt-5 col-12 forf mb-3">
                            <label for="validationDefault02">UPI Transaction Id</label>
                            <input type="number" name="trans" class="form-control" id="validationDefault02" placeholder="your upi transaction" required>
                        </div>
                        
                        <div class="mt-5 col-12 forf mb-3">
                            <input type="hidden" class="form-control" name="id" value="<%=id%>" id="validationDefault02" placeholder="" >
                        </div>
                        <div class="mt-5 col-12 forf mb-3">
                            <input type="hidden" class="form-control" name="tn" value="<%=tn%>" id="validationDefault02" placeholder="" >
                        </div>
                        
                        <button class="btn btn-outline-success" type="submit">Bid Amount</button>
                </form>
            </div>
        </div>
                        <%%>
                        <div align="center"> You can bid after your entry is confirmed</div>
                        <%%>
    </div>
                        

</body>
<script>
    var qrCode = null; // initialize global variable to null
    var check = 0;
    function generateQRCode() {


        // Get the input value
        var amount = document.getElementById("amount").value;
        console.log(amount);
        if (amount === null || amount < 20 || amount === "") {
            alert("Please enter a valid amount.");
            return;
        }

        var upiId = "vedant.mane2510@oksbi";
        var qrCodeText = "upi://pay?pa=" + upiId + "&pn=E-Cell+IPL+Auction&am=" + amount + "&cu=INR";
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