<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv='cache-control' content='no-cache,no-store,must-revalidate'>
        <meta http-equiv='expires' content='0'>
        <meta http-equiv='pragma' content='no-cache'>
        <title>Login Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bank.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="nbank">        
        <div class="jumbotron text-white p-3 border-bottom overflow-auto" style="background-color: #0000005c;">
            <a href="home" class="btn btn-sm btn-primary float-left m-1">Home</a>
            <form class="form-inline float-right" method="post" action="NBValidate">                
                <label>User ID</label>
                <input type="text" name="userid" required class="form-control form-control-sm mx-2"
                       placeholder="Net Banking User ID">                               
                <label>Password</label>
                <input type="password" name="pwd" required class="form-control form-control-sm mx-2"
                       placeholder="Net Banking Password">                
                <input type="submit" value="Login" class="btn btn-sm btn-success">
            </form>          
            <h4 class="text-center text-white">Welcome Net Banking Users</h4>
        </div>
        <div class="container">
            <jsp:include page="message.jsp"/>
            <div style="margin-top: 20px;"></div>            
            <div class="row">                     
                <div class="offset-6 col-6 p-0 border text-right text-white rounded" style="background-color: #0233679c;">
                    <h5 class="p-2 text-center rounded border-bottom" style="background-color: purple;">Net Banking Registration</h5>
                    <div class="p-3">
                        <form method="post" action="NBRegister">
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label-sm">Your Name</label>
                                <div class="col-sm-8">
                                    <input type="text" name="uname" required class="form-control form-control-sm"
                                           placeholder="Your Name">
                                </div>
                            </div>
                            <div class="form-group row">                
                                <label class="col-sm-4 col-form-label-sm">Adhar Number</label>
                                <div class="col-sm-8">
                                    <input type="text" style="letter-spacing:0.2em;font-weight: bold;" name="adhar" 
                                           class="form-control form-control-sm" required pattern="[0-9]{12,12}"
                                           placeholder="Adhar Number" maxlength="12">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-4 col-form-label-sm">Mobile Number</label>
                                <div class="col-sm-8">
                                    <input type="text" name="phone" class="form-control form-control-sm"
                                           style="letter-spacing: 0.1em;;font-weight: bold;"
                                           placeholder="Registered Phone Number" required pattern="[6-9][0-9]{9,9}" maxlength="10">
                                </div>
                            </div> 
                            <div class="form-group row">                
                                <label class="col-sm-4 col-form-label-sm">Account Number</label>
                                <div class="col-sm-8">
                                    <input type="text" name="accno" class="form-control form-control-sm"
                                           style="letter-spacing: 0.1em;;font-weight: bold;"
                                           placeholder="Your Account Number" required pattern="[0-9]{6,6}" maxlength="6">
                                </div>
                            </div>
                            <div class="form-group row">                            
                                <label class="col-sm-4 col-form-label-sm">User ID</label>
                                <div class="col-sm-8">
                                    <input type="text" name="userid" required class="form-control form-control-sm"
                                           placeholder="Create Net Banking User ID">
                                </div>
                            </div>
                            <div class="form-group row">                            
                                <label class="col-sm-4 col-form-label-sm">Password</label>
                                <div class="col-sm-8">
                                    <input type="password" name="pwd" required class="form-control form-control-sm"
                                           placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group row">                            
                                <label class="col-sm-4 col-form-label-sm">Confirm Password</label>
                                <div class="col-sm-8">
                                    <input type="password" name="cpwd" required class="form-control form-control-sm"
                                           placeholder="Confirm Password">
                                </div>
                            </div>
                            <input type="submit" value="Register" class=" btn-sm btn-success">
                        </form>          
                    </div>
                </div>                
            </div>

        </div>        
    </body>
</html>
