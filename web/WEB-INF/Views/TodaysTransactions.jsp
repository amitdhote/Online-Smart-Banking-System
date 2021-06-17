<jsp:include page="header.jsp" />
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DbConfig"%>
<%@page import="java.sql.Connection"%>
<h3 class="text-center m-2 border-bottom border-primary p-2">Today's Transactions Report</h3>

<table class="table table-bordered table-striped table-sm">
    <thead class="table-primary">
        <tr>
            <td>Account Number</td>
            <td>Particulars</td>
            <td>Dr Amount</td>
            <td>Cr Amount</td>                        
        </tr>
    </thead>
    <tbody>
        <%
            Connection con = DbConfig.connect();                
            PreparedStatement ps = con.prepareStatement("select * from trans where tdate=current_date() order by tid desc");            
            ResultSet rs2 = ps.executeQuery();
            while (rs2.next()) {
                int dr = rs2.getInt("dramount");
                int cr = rs2.getInt("cramount");
        %>
        <tr>
            <td><%= rs2.getString("accno")%></td>
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