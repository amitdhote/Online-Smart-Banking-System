<%@page import="java.sql.*"%>
<%@page import="config.DbConfig"%>
<jsp:include page="nbheader.jsp" />
<%
    Connection con = DbConfig.connect();
    String cid = session.getAttribute("cid").toString();
    String uname = session.getAttribute("uname").toString();
    ResultSet rs = con.createStatement().executeQuery("select * from account where cid=" + cid);
    rs.next();
%>  
<h4 class="text-center m-2">Welcome <%= uname%></h4>

<h4 class="text-right">Current Available Balance : &#8377; <%= rs.getString("bal")%></h4>


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
            
            PreparedStatement ps = con.prepareStatement("select * from trans where accno=? order by tid desc limit 10");
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
<jsp:include page="footer.jsp" />