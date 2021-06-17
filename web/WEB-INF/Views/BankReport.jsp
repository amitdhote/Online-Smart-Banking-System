<%@page import="java.sql.*"%>
<%@page import="config.DbConfig"%>
<jsp:include page="header.jsp" />
<form class="form-inline" style="justify-content: center;">
    <label>Start Date</label>
    <input type="date" value="${param.from}" name="from" class="form-control mx-2">            
    <label>End Date</label>
    <input type="date" name="to" value="${param.to}" class="form-control mx-2">            
    <input name="search" value="Show Me" type="submit" class="btn btn-primary">            
</form>
<%
    if (request.getParameter("search") != null) {
%>
<table id="tbl" class="table table-bordered table-striped">
    <thead class="table-primary">
        <tr>
            <th>Transaction Date</th>
            <th>Account Number</th>
            <th>Particulars</th>
            <th>Dr Amount</th>
            <th>Cr Amount</th>                         
        </tr>
    </thead>
    <tbody>
        <%
            Connection con = DbConfig.connect();
            PreparedStatement ps = con.prepareStatement("select * from trans where tdate between ? and ?");
            ps.setString(1, request.getParameter("from"));
            ps.setString(2, request.getParameter("to"));
            ResultSet rs2 = ps.executeQuery();
            while (rs2.next()) {
                int dr = rs2.getInt("dramount");
                int cr = rs2.getInt("cramount");
        %>
        <tr>
            <td><%= DbConfig.formatDate(rs2.getString("tdate")) %></td>
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
<% }%>
<script>
$(function(){
    $("#tbl").dataTable({
        ordering:false               
    });    
});
</script>
<jsp:include page="footer.jsp" />