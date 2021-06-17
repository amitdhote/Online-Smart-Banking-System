<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DbConfig"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp" />
<h3 class="text-center m-2 border-bottom p-2">Update Customer Information</h3>
<jsp:include page="searchsection.jsp" />
<div class="row">
    <div class="col-10 mx-auto">
        <jsp:include page="message.jsp" />
        <%
            if (request.getParameter("accno") != null) {
                String accno = request.getParameter("accno");
                Connection con = DbConfig.connect();
                final String sql = "select * from account a inner join customer c on a.cid=c.id where accno=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, accno);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String profile="../images/image.png";    
                    if(rs.getString("pic")!=null){
                        profile="../cpics/"+rs.getString("pic");    
                    }
                    String sign="../images/image.png";    
                    if(rs.getString("signature")!=null){
                        sign="../csign/"+rs.getString("signature");    
                    }
        %>     
        <form action="../UpdateProcess" method="post" enctype="multipart/form-data">
            <input type="hidden" name="cid" value="<%= rs.getString("cid")%>">
            <table class="table table-bordered border-primary">            
                <tr>
                    <th>Account Number</th>
                    <th><%= rs.getString("accno")%></th>
                    <th>Account Type</th>
                    <th><%= rs.getString("atype")%></th>
                </tr>
                <tr>
                    <th>Balance Available</th>
                    <th>&#8377; <%= rs.getString("bal")%></th>
                    <th>Account Active</th>
                    <th><%= rs.getString("active")%></th>
                </tr>
                <tr>
                    <th>Customer Photo</th>
                    <th><label for="pic">
                            <img src="<%= profile %>" style="height:100px;" class="img-thumbnail">
                        </label>
                        <input type="file" accept=".jpg,.jpeg,.png" name="pic" id="pic" class="d-none"></th>
                    <th>Customer Signature</th>
                    <th><label for="sign">
                            <img src="<%= sign %>" style="height:100px;" class="img-thumbnail">
                        </label>
                        <input type="file" accept=".jpg,.jpeg,.png" name="sign" id="sign" class="d-none"></th>
                </tr>
                <tr>
                    <th>Customer Name</th>
                    <th><input type="text" class="form-control" 
                               name="cname"
                               value="<%= rs.getString("cname")%>"></th>
                    <th>Customer Address</th>
                    <th><input type="text" class="form-control" 
                               name="address"
                               value="<%= rs.getString("address")%>"></th>
                </tr>
                <tr>
                    <th>Gender</th>
                    <th><input type="text" class="form-control" 
                               name="gender"
                               value="<%= rs.getString("gender")%>"></th>
                    <th>Phone Number</th>
                    <th><input type="text" class="form-control" 
                               name="phone"
                               value="<%= rs.getString("phone")%>"></th>
                </tr>
                <tr>
                    <th>ADHAR ID</th>
                    <th><input type="text" class="form-control" 
                               name="adhar"
                               value="<%= rs.getString("adhar")%>"></th>
                    <th>Email ID</th>
                    <th><input type="email" class="form-control" 
                               name="email"
                               value="<%= rs.getString("email")%>"></th>
                </tr>                        
            </table>
            <input type="submit" value="Update Information" class="btn btn-primary float-right">
        </form>
        <%
        } else {
        %>
        <div class="alert alert-danger text-center">
            <strong>Invalid Account Number</strong>
        </div>
        <%
                }
            }
        %>

    </div>
</div>
<jsp:include page="footer.jsp" />