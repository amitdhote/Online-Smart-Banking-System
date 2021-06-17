<jsp:include page="header.jsp" />
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DbConfig"%>
<%@page import="java.sql.Connection"%>

<h3 class="text-center m-2 border-bottom p-2">Withdraw Module</h3>
<jsp:include page="message.jsp" />
<jsp:include page="searchsection.jsp" />
<div class="row">
    <div class="col-9 mx-auto">
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
        <div class="row mb-2">
            <div class="col-sm-3 p-0">
                <img src="../cpics/<%= rs.getString("pic") %>" class="img-thumbnail" style="width:100%;height:100%;">
            </div>
            <div class="col-sm-9">
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
                    <tr>
                        <th class="align-middle text-right" rowspan="2">Signature</th>
                        <th colspan="3"><img style="height:100px;width:200px;" src="../csign/<%= rs.getString("signature") %>"></th>
                    </tr>
                </table>
            </div>
        </div>

        <form method="post" action="../CheckWithdrawProcess">
            <input type="hidden" name="accno" value="<%= rs.getString("accno")%>" >
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <label>Transaction Date</label>
                        <input type="date" id="tdate" name="tdate" class="form-control">
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
                        <label>Withdraw Amount</label>
                        <input type="number" min="1" name="amount" class="form-control">
                    </div>
                </div>
            </div>
            <button class="btn btn-primary float-right">Withdraw</button>
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
    document.getElementById("tdate").valueAsDate = new Date();
</script>
<jsp:include page="footer.jsp" />