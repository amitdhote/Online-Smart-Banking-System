<%@page import="config.DbConfig"%>
<%@page import="java.sql.*"%>
<jsp:include page="nbheader.jsp" />

<h3 class="text-center border-bottom border-primary p-2">Beneficiary</h3>
<jsp:include page="message.jsp" />
<div class="row">
    <div class="col-sm-8">        
        <h4 class="text-center p-2">All Beneficiary</h4>
        <table class="table table-bordered table-sm">
            <thead>
                <tr>
                    <th>Sr.no.</th>
                    <th>Beneficiary Name</th>
                    <th>Bank Name</th>
                    <th>Account Number</th>
                    <th>Max Limit</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection con = DbConfig.connect();
                    final String sql = "select * from beneficiary where userid='"+session.getAttribute("userid").toString()+"'";                    
                    ResultSet rs = con.createStatement().executeQuery(sql);
                    int counter=1;
                    while (rs.next()) {                        
                %>
                <tr>
                    <td><%= counter++ %></td>
                    <td><%= rs.getString("bname") %></td>
                    <td><%= rs.getString("bankname") %></td>
                    <td><%= rs.getString("accno") %></td>
                    <td>&#8377; <%= rs.getString("maxlimit") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <div class="col-sm-4">
        <h4 class="text-center p-2">Add Beneficiary</h4>
        <form method="post" action="../AddBeneficiary">
            <input type="hidden" name="userid" value="${sessionScope.userid}">
            <div class="form-group">
                <input type="text" required name="bname" placeholder="Beneficiary Name" 
                       class="form-control">
            </div>
            <div class="form-group">
                <input type="text" required name="bank" placeholder="Bank Name" 
                       class="form-control">
            </div>
            <div class="form-group">
                <input type="text" required name="ifsc" placeholder="Bank IFSC Code" 
                       class="form-control">
            </div>
            <div class="form-group">
                <input type="text" required pattern="[0-9]{5,15}" name="accno" placeholder="Account Number" 
                       class="form-control">
            </div>
            <div class="form-group">
                <input type="number" required name="maxlimit" placeholder="Maximum Limit" 
                       class="form-control">
            </div>
            <input type="submit" value="Add Beneficiary" class="btn btn-primary float-right">
        </form>
    </div>    
</div>

<jsp:include page="footer.jsp" />