<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv='cache-control' content='no-cache,no-store,must-revalidate'>
        <meta http-equiv='expires' content='0'>
        <meta http-equiv='pragma' content='no-cache'>
        <title>Net Banking Dashboard</title>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bank.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery-3.5.1.js" type="text/javascript"></script>
        <script src="../js/bootstrap.js" type="text/javascript"></script>
        <style>
            .list-group-item-action{
                background-color: transparent;
                border-bottom: 1px solid black;
                padding:8px;
            }
            .list-group-item-action:hover{
                background-color: #05115a7d;
                color:white;                
            }
        </style>
        <%
            if (session.getAttribute("userid") == null) {
                session.setAttribute("error", "Please login first");
                response.sendRedirect("Login");
            }
        %>
    </head>
    <body class="dash">
        <div class="jumbotron p-3 mb-0 bg-dark text-white rounded-0">
            <h2 class="text-center">Net Banking Dashboard</h2>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2 bg-transparent p-0 border-right border-primary position-fixed" style="height:calc(100vh - 80px)">
                    <div class="list-group list-group-flush">
                        <a href="CustomerHome" class="list-group-item list-group-item-action">Home</a>                                    
                        <a href="OnlinePayments" class="list-group-item list-group-item-action">Online Payments</a>                                                            
                        <a href="OnlineTransfer" class="list-group-item list-group-item-action">Online Transfer</a>
                        <a href="NBChequebookRequest" class="list-group-item list-group-item-action">Request Cheque Book</a>
                        <a href="StatusChequeBook" class="list-group-item list-group-item-action">Cheque Book Status</a>
                        <a href="Beneficiary" class="list-group-item list-group-item-action">Beneficiary</a>
                        <a href="CustomerReport" class="list-group-item list-group-item-action">Report</a>                                                
                        <a href="NBChangePwd" class="list-group-item list-group-item-action">Change Password</a>
                        <a href="Logout" class="list-group-item list-group-item-action">Logout</a>
                    </div>
                </div>
                <div class="col-sm-10" style="margin-left: 16.67%">

