<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DbConfig"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp" />
<h3 class="text-center m-2 border-bottom p-2">Balance Enquiry</h3>
<jsp:include page="searchsection.jsp" />
<div class="row">
    <div class="col-8 mx-auto">
        <%
            if (request.getParameter("accno") != null) {
                String accno = request.getParameter("accno");
                Connection con = DbConfig.connect();
                final String sql = "select * from account a inner join customer c on a.cid=c.id where accno=? and active='Y'";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, accno);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
        %>            
        <div class="alert alert-success text-center">
            <strong>Account Number Found</strong>                
        </div>
        <table class="table table-bordered">
            <tr>
                <th>Account Number</th>
                <th><%= rs.getString("accno") %></th>
            </tr>
            <tr>
                <th>Customer Name</th>
                <th><%= rs.getString("cname") %></th>
            </tr>
            <tr>
                <th>Gender</th>
                <th><%= rs.getString("gender") %></th>
            </tr>
            <tr>
                <th>Account Type</th>
                <th><%= rs.getString("atype") %></th>
            </tr>
            <tr class="table-success">
                <th>Balance Available</th>
                <th>&#8377; <%= rs.getString("bal") %></th>
            </tr>
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