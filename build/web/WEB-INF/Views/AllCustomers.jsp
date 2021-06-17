<%@page import="java.sql.ResultSet"%>
<%@page import="config.DbConfig"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp" />
<h3 class="text-center m-2">All Customers</h3>
<table class="table table-bordered table-sm">
    <thead class="table-dark">
        <tr>
            <th>Customer ID</th>
            <th>Customer Name</th>
            <th>Address</th>
            <th>Gender</th>
            <th>Adhar ID</th>
            <th>Phone No.</th>
            <th>Email Address</th>            
        </tr>
    </thead>
    <tbody>
        <%
            Connection con = DbConfig.connect();
            ResultSet rs = con.createStatement().executeQuery("select * from customer");
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("id")%></td>
            <td><%= rs.getString("cname")%></td>
            <td><%= rs.getString("address")%></td>
            <td><%= rs.getString("gender")%></td>
            <td style="letter-spacing: 0.1em;"><%= rs.getString("adhar")%></td>
            <td><%= rs.getString("phone")%></td>
            <td><%= rs.getString("email")%></td>            
        </tr>
        <% }
            con.close();
        %>
    </tbody>
</table>
<jsp:include page="footer.jsp" />