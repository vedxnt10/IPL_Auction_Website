<%@page import="java.sql.*"%>
<%@page import="PackControl.Connections"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
        
    Connection con=(Connection) request.getAttribute("con");
    int id=(int)request.getAttribute("id");
    String tn = (String)request.getAttribute("tn");
    PreparedStatement stmt = con.prepareStatement("SELECT * FROM TEAMS where id=? ");
    stmt.setInt(1, id);
    ResultSet rs = stmt.executeQuery();
    
    String tl= null;
    String ta= null;
    String pt= null;
    int ya1 = 0;
    
    while (rs.next()) {
        ta = rs.getString("total_amount");
//        tn = rs.getString("team_name");
        tl = rs.getString("team_lead");
        pt = rs.getString("priority_team");
        
    }
    int i = 0;
    String times[] = new String[500];
    String dates[] = new String[500];
    int bids[] = new int[500];
    String ptb[] = new String[500];
    
 PreparedStatement stmt2 = con.prepareStatement("SELECT * from HISTORY where ID=? AND TEAM_NAME=?");
    stmt2.setInt(1, id);
    stmt2.setString(2, tn);
    
    ResultSet rs2 = stmt2.executeQuery();
    while (rs2.next()) {
        times[i] = rs2.getString("TIMES");
        dates[i] = rs2.getString("DATES");
        bids[i] = rs2.getInt("AMOUNT");
        ptb[i] = rs2.getString("PRIORITY_TEAM");
        i++;
    }
    
%>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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

    .card {
        background: rgba(255, 255, 255, 0.1);
        color: white;
        border-radius: 10px;
    }

    .mons {
        background: #000;
        border-radius: 50%;
        font-size: 5em;
        display: flex;

        width: fit-content;
        aspect-ratio: 1;
    }

    /* .mons span {
        margin: auto;
        justify-content: center;
    } */
    .card-body {
        display: flex;
        justify-content: space-evenly;
        align-items: center;
    }

    .high {
        background: yellow;
        color: black;
        padding: 1px 5px;
        font-weight: 700;
        border-radius: 20px;
    }

    .display-6 {
        font-size: 1.2em;
        font-weight: 700;
    }

    .table {
        background: rgba(255, 255, 255, 0.5);
        border-radius: 10px;
    }

    thead th {
        color: yellow;
        font-size: 1.2em;
    }

    tbody tr {
        font-size: 1em;
    }

    @media only screen and (max-width: 435px) {
        thead th {
            font-size: 1em;
        }

        .display-6 {
            font-size: 1em;
        }
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
                                    <button class="nav-link active" aria-current="page" type="submit" >Dashboard</button>
                                </li>
                            </form>
                            <form action="addbid" method="post">
                                <li class="nav-item pe-4">
                                    <input type="hidden" name="tn" value="<%=tn%>" />
                                    <input type="hidden" name="id" value="<%=id%>" />
                                    <button class="nav-link " aria-current="page" type="submit" >Add Bid</button>
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
    <style>
        .info{
            font-size: 2em;
            color: yellow;
        }
    </style>
    <div class=" container info mt-5 mb-5">
        <div class="row">
            
        <div align="center" class="col-md-6">Team name : <%=tn%></div>
        <div align="center" class="col-md-6">Team Lead : <%=tl%></div>
        
        </div>
    </div>
    
    <h1 align="center" class="text-white mt-3 mb-3">Your History</h1>
    <div align="center" class="bid-history container ">
        <div class="row">

            <div class="col-12">
                <div class="card container" style="width: 100%;">
                    <div class="card-body row">
                        <div class="money col-md-4 mt-2 display-6 mb-2">Total Bid <span class="high"> <i
                                    class="bi bi-currency-rupee"></i><%=ta%></span> </div>
                        <div class="logo col-md-4 mt-2 mb-2"><img src="https://i.ibb.co/tJC7HMc/x-1-removebg-preview.png" width="100%" alt=""></div>
                        <div class="team col-md-4 mt-2 display-6 mb-2">Priority Team <span class="high"><%=pt%></span></div>
                    </div>
                </div>
            </div>
        </div>

        <h3 align="left" class="mt-5 text-white mt-3 mb-3">All Transactions</h3>
        <div align="center" class="allhist">

            <table class="table table-borderless text-center text-light">
                <thead>
                    <tr>
                        <th scope="col">Date</th>
                        <th scope="col">Bid</th>
                        <th scope="col">Priority Team</th>
                    </tr>
                </thead>
                <% for(int p=i-1;p>=0;p--){ %>
                <tbody>
                    <tr>
                        <td class="pb-3"><%=dates[p]%></td>
                        <td class="pb-3"><%=bids[p]%></td>
                        <td class="pb-3"><%=ptb[p]%></td>
                    </tr>
                </tbody>
                <%}%>
            </table>
        </div>
</body>

</html>