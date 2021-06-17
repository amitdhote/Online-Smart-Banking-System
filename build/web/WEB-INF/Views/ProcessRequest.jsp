<jsp:include page="header.jsp" />
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DbConfig"%>
<%@page import="java.sql.Connection"%>

<h3 class="text-center m-2 border-bottom p-2">Pending Requests</h3>
<div class="container">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Request ID</th>
                <th>Description</th>
                <th>Request Date</th>
                <th>No. of Cheques</th>
                <th>Operation</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection con = DbConfig.connect();
                PreparedStatement ps = con.prepareStatement("select * from requests where status='Pending'");
                ResultSet rs2 = ps.executeQuery();
                while (rs2.next()) {
            %>
            <tr>
                <td><%= rs2.getString("rid")%></td>
                <td><%= rs2.getString("description")%></td>
                <td><%= rs2.getString("rdate")%></td>
                <td><%= rs2.getString("qty")%></td>
                <td>
                    <a href="../ProcessReq?rid=<%= rs2.getString("rid")%>&op=y" class="btn btn-primary btn-sm">Confirm</a>
                    <a href="../ProcessReq?rid=<%= rs2.getString("rid")%>&op=n" class="btn btn-danger btn-sm">Cancel</a>
                </td>
            </tr>
            <% }
                con.close();
            %>
        </tbody>
    </table>
</div>
<jsp:include page="footer.jsp" />