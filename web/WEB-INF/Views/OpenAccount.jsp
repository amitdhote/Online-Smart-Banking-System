<%@page import="java.sql.ResultSet"%>
<%@page import="config.DbConfig"%>
<%@page import="java.sql.Connection"%>
<jsp:include page="header.jsp" />
<h3 class="text-center">Open Customers Account</h3>
<div class="row">
    <div class="col-5 mx-auto">
        <jsp:include page="message.jsp" />
        <div class="card p-3">
            <form method="post" action="../OpenProcess">
                <div class="form-group">      
                    <label>Select Customer</label>
                    <select name="cid" class="form-control">
                        <option>--- Select Customer ---</option>
                        <%
                            Connection con = DbConfig.connect();
                            ResultSet rs = con.createStatement().executeQuery("select id,cname from customer where id not in(select cid from account)");
                            while (rs.next()) {
                        %>
                        <option value="<%= rs.getString("id") %>"><%= rs.getString("cname") %></option>
                        <% } 
                        con.close();%>
                    </select>
                </div>
                <div class="form-group">                
                    <label>Select Account Type</label>
                    <select name="actype" class="form-control">
                        <option>--- Select Account Type ---</option>
                        <option>Saving Account</option>
                        <option>Current Account</option>
                        <option>Term Deposit Account</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Opening Amount</label>
                    <input type="text" name="bal" required
                           class="form-control" pattern="[0-9]{0,10}"
                           placeholder="Opening Amount" maxlength="10">
                </div>            
                <input type="submit" value="Open Account" class="btn btn-primary btn-block">
            </form> 
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />