<jsp:include page="header.jsp" />
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DbConfig"%>
<%@page import="java.sql.Connection"%>

<h3 class="text-center m-2 border-bottom p-2">Check Deposit Module</h3>
<jsp:include page="message.jsp" />
<jsp:include page="searchsection.jsp" />
<div class="row">
    <div class="col-8 mx-auto">
        <%
            if (request.getParameter("accno") != null) {
                String accno = request.getParameter("accno");
                Connection con = DbConfig.connect();
                final String sql = "select * from account a inner join customer c "
                        + "on a.cid=c.id where accno=? and active='Y'";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, accno);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
        %>            
        <table class="table table-bordered">
            <tr>
                <th>Account Number</th>
                <th><%= rs.getString("accno")%></th>
                <th>Customer Name</th>
                <th><%= rs.getString("cname")%></th>
            </tr>
            <tr class="table-success">
                <th>Account Type</th>
                <th><%= rs.getString("atype")%></th>
                <th>Balance Available</th>
                <th>&#8377; <%= rs.getString("bal")%></th>
            </tr>            
        </table>
            <form method="post" action="../CheckDepositProcess">
            <input type="hidden" name="accno" value="<%= rs.getString("accno") %>" >
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <label>Transaction Date</label>
                        <input type="date" id="tdate" name="tdate" class="form-control">
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label>Check Bank Name</label>
                        <input type="text" name="bank" class="form-control">
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label>Check Number</label>
                        <input type="number" pattern="[0-9]{6,6}" name="chkno" class="form-control">
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label>Check Amount</label>
                        <input type="number" min="1" name="amount" class="form-control">
                    </div>
                </div>
            </div>
            <button class="btn btn-primary float-right">Deposit</button>
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
<script>
    document.getElementById("tdate").valueAsDate=new Date();
</script>
<jsp:include page="footer.jsp" />