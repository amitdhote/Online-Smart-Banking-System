<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">        
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv='cache-control' content='no-cache,no-store,must-revalidate'>
        <meta http-equiv='expires' content='0'>
        <meta http-equiv='pragma' content='no-cache'>
        <title>Admin Dashboard</title>
        <link rel="icon" href="../images/bank.jpg">
        <link href="../css/all.min.css" rel="stylesheet" type="text/css">                
        <link href="../css/bank.css" rel="stylesheet" type="text/css"/>                
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../css/datatables.css" rel="stylesheet" type="text/css"/>
        <link href="../css/sb-admin.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <%
            if (session.getAttribute("userid") == null) {
                session.setAttribute("error", "Please login first");
                response.sendRedirect("Login");
            }
        %>
    </head>
    <body>
        <nav class="navbar d-flex navbar-expand navbar-dark static-top justify-content-between" style="background-color: #062c54">
            <div class="navbar-nav">
                <a class="navbar-brand mr-2" href="#">
                    <img src="../images/bank.jpg" class="rounded-circle border border-white" alt="Logo" style="width:25px;">                
                   Online Smart  Banking
                </a>                
                <button class="btn btn-sm ml-4 text-white order-1 order-sm-0" 
                        id="sidebarToggle" href="#">
                    <i class="fas fa-bars"></i>
                </button>
            </div> 
            <div class="nav-item dropdown">
                <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdownMenuLink" 
                   data-toggle="dropdown">
                    Welcome Amit Dhote <i class="fa fa-user"></i>
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#content3">Profile</a>                              
                    <a class="dropdown-item" href="ChangePwd">Change Password</a>
                    <a class="dropdown-item" href="Logout">Logout</a>
                </div>
            </div>

        </nav>
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="sidebar navbar-nav"  style="background-color: #110148">
                <li class="nav-item active">
                    <a class="nav-link" href="AdminHome">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Admin Dashboard</span>
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Customers</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">          
                        <a class="dropdown-item" href="AddCustomer">New Customer</a>
                        <a class="dropdown-item" href="AllCustomers">List All</a>                        
                    </div>
                </li>                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Accounts</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">          
                        <a class="dropdown-item" href="AllAccounts">List All</a>
                        <a class="dropdown-item" href="OpenAccount">Open Account</a>
                        <a class="dropdown-item" href="EditCustomer">Update Information</a>                                  
                        <a class="dropdown-item" href="CloseAccount">Close Account</a>          
                        <a class="dropdown-item" href="Reactivate">Reactivate Account</a>          
                    </div>
                </li>                                                     
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Transactions</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">          
                        <a class="dropdown-item" href="Deposit">Deposit</a>
                        <a class="dropdown-item" href="Withdrawal">Withdraw</a>
                        <a class="dropdown-item" href="TransferAmount">Transfer</a>          
                        <a class="dropdown-item" href="BalanceEnq">Balance Enquiry</a>          
                        <a class="dropdown-item" href="CheckDeposit">Check Deposit</a>          
                        <a class="dropdown-item" href="CheckWithdrawal">Check Withdrawal</a>
                        <a class="dropdown-item" href="TransactionReport">Passbook</a>
                    </div>
                </li>  
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Requests</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">          
                        <a class="dropdown-item" href="RequestChequebook">New Cheque Book</a>
                        <a class="dropdown-item" href="ProcessRequest">Process Request</a>
                        <a class="dropdown-item" href="RequestReports">Reports</a>                                  
                    </div>
                </li>  
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Reports</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">          
                        <a class="dropdown-item" href="TodaysTransactions">Todays Transactions</a>
                        <a class="dropdown-item" href="BankReport">Bank Report</a>                                  
                    </div>
                </li>                                
            </ul>

            <div id="content-wrapper" class="dash">

                <div class="container-fluid">