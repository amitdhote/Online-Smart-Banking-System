<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bank.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="dash">
        <a href="home" class="btn btn-sm btn-primary float-right m-2">Home</a>
        <div class="jumbotron p-3 bg-transparent border-bottom border-primary">
            <h2 class="text-center">Customer Registration Screen</h2>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-10 mx-auto">
                    <jsp:include page="message.jsp" />                                        
                    <form method="post" enctype="multipart/form-data" action="RegisterProcess">
                        <div class="row">
                            <div class="col-sm-3">
                                <img src="images/image.png" class="img-thumbnail">
                                <button type="button" class="btn btn-info btn-block"><label style="width:100%;" for="pic">Upload</label></button>
                                <input type="file" class="d-none" name="pic" accept=".jpg,.png" id="pic">
                            </div>
                            <div class="col-sm-6">
                                <input type="hidden" name="from" value="open">
                                <div class="form-group">                
                                    <input type="text" name="cname" class="form-control"
                                           pattern="[A-Za-z ]{4,30}" placeholder="Customer Name">
                                </div>
                                <div class="form-group">                
                                    <input type="text" name="address" class="form-control"
                                           placeholder="Customer Address">
                                </div>
                                <div class="form-group">
                                    <label>Date of Birth</label>
                                    <input type="date" name="dob" class="form-control">                                   
                                </div>
                                <div class="form-group">                
                                    <input type="text" style="letter-spacing:0.5em;" name="adhar" 
                                           class="form-control" pattern="[0-9]{12,12}"
                                           placeholder="Adhar Number" maxlength="12">
                                </div>
                                <div class="form-group">                
                                    <input type="text" name="phone" class="form-control"
                                           style="letter-spacing: 0.3em;"
                                           placeholder="Phone Number" pattern="[6-9][0-9]{9,9}" maxlength="10">
                                </div>
                                <div class="form-group">                            
                                    <input type="email" name="email" class="form-control"
                                           required
                                           placeholder="Email Address">
                                </div>
                                <div class="form-group">
                                    <label>Upload Signature</label>
                                    <input type="file" accept=".jpg,.png,.jpeg" name="signature" class="form-control-file" required>
                                </div>
                                <div class="form-group">                
                                    <select name="gender" class="form-control">
                                        <option>--- Select Gender ---</option>
                                        <option>Male</option>
                                        <option>Female</option>
                                    </select>
                                </div>

                                <input type="submit" value="Register Customer" class="btn btn-primary btn-block">
                            </div>
                        </div>
                    </form>            
                </div>
            </div>

        </div>        
    </body>
</html>
