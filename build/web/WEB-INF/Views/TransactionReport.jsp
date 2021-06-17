<jsp:include page="header.jsp" />
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DbConfig"%>
<%@page import="java.sql.Connection"%>
<h3 class="text-center m-2 border-bottom p-2">Transactions Report</h3>
<jsp:include page="searchsection.jsp" />
<div class="row">
    <div class="col-10 mx-auto">
        <%
            if (request.getParameter("accno") != null) {
                String accno = request.getParameter("accno");
                Connection con = DbConfig.connect();
                final String sql = "select * from account a inner join customer c on a.cid=c.id where accno=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, accno);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
        %>            
        <table class="table table-bordered table-sm"> 
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
        <a href="AllTrans?accno=${param.accno}" class="btn btn-primary btn-sm float-right">All Transactions</a>               
        <h4 class="text-center">Last 10 transactions</h4>
        <table class="table table-bordered table-striped table-sm">
            <thead class="table-primary">
                <tr>
                    <th>Transaction Date</th>
                    <th>Particulars</th>
                    <th>Dr Amount</th>
                    <th>Cr Amount</th>                         
                </tr>
            </thead>
            <tbody>
                <%
                    ps = con.prepareStatement("select * from trans where accno=? order by tid desc limit 10");
                    ps.setString(1, rs.getString("accno"));
                    ResultSet rs2 = ps.executeQuery();
                    while (rs2.next()) {
                        int dr = rs2.getInt("dramount");
                        int cr = rs2.getInt("cramount");
                %>
                <tr>
                    <td><%= DbConfig.formatDate(rs2.getString("tdate")) %></td>
                    <td><%= rs2.getString("ttype")%></td>
                    <td><%= dr == 0 ? "" : dr%></td>
                    <td><%= cr == 0 ? "" : cr%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
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