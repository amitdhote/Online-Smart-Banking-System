<%@page import="java.sql.ResultSet"%>
<%@page import="config.DbConfig"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp" />
<h3 class="text-center m-2 border-bottom p-2">All Accounts List</h3>
<table class="table table-bordered table-sm table-striped">
    <thead class="table-dark">
        <tr>
            <th>Customer ID</th>
            <th>Customer Name</th>
            <th>Account Number</th>
            <th>Account Type</th>
            <th>Available Balance</th>    
            <th>Active</th>
        </tr>
    </thead>
    <tbody>
        <%
            Connection con = DbConfig.connect();
            ResultSet rs = con.createStatement().executeQuery("select * from account a inner join customer c "
                    + "on a.cid=c.id");
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("cid")%></td>
            <td><%= rs.getString("cname")%></td>
            <td><%= rs.getString("accno")%></td>
            <td><%= rs.getString("atype")%></td>
            <td>&#8377; <%= rs.getString("bal")%></td> 
            <td><%= rs.getString("active").equals("Y")?"Active":"Closed" %></td>
        </tr>
        <% }
            con.close();
        %>
    </tbody>
</table>
<jsp:include page="footer.jsp" />