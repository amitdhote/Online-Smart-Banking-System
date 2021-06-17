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
    <body class="login">
        <a href="home" class="btn btn-sm btn-primary float-right m-2">Home</a>
        <div class="jumbotron text-white p-4" style="background-color: #0000005c;">
            <h2 class="text-center">Admin Login Screen</h2>
        </div>
        <div class="container">
            <jsp:include page="message.jsp"/>
            <div style="margin-top: 120px;"></div>
            <div class="row">
                <div class="offset-7 col-4 border p-3 text-center text-white">
                    <form method="post" action="Validate">
                        <div class="form-group">
                            <label>User ID</label>
                            <input type="text" name="userid" class="form-control"
                                   placeholder="Admin User ID">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="pwd" class="form-control"
                                   placeholder="Admin Password">
                        </div>
                        <input type="submit" value="Login" class="btn btn-primary btn-block">
                    </form>            
                </div>
            </div>

        </div>        
    </body>
</html>
