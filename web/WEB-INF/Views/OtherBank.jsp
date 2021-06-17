<%@page import="config.DbConfig"%>
<%@page import="java.sql.*"%>
<jsp:include page="nbheader.jsp" />

<h3 class="text-center border-bottom border-primary p-2">Other Bank Transfer</h3>
<jsp:include page="message.jsp" />
<div class="row">
    <div class="col-sm-6 mx-auto">
        <form method="post" action="../NBTransferProcess">
            <%
                String accno = DbConfig.findAccountByCustID(session.getAttribute("cid").toString());
            %>
            <input type="hidden" name="accno" value="<%= accno%>" >
            <div class="form-group">
                <label>Select Beneficiary</label>
                <select type="text" name="bname" class="form-control">
                    <option>---- Select Beneficiary ---</option>
                    <%
                        Connection con = DbConfig.connect();
                        String userid = session.getAttribute("userid").toString();
                        final String sql = "select * from beneficiary where userid=?";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ps.setString(1, userid);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                    %>
                    <option><%= rs.getString("bname") %></option>
                    <%
                        } %>
                </select></div> 
            <div  class="form-group">
                <label> Remarks </label>
                <input 
                    type = "text" name = "remarks" class="form-control">
            </div> 
            <div class="form-group">
                <label>Available Balance</label>
                <input type="text" id="recname" value="<%= DbConfig.findAccountBalance(accno)%>" readonly class="form-control">
            </div>
            <div class="form-group">
                <label> Transfer Amount</label> <input 
                    type = "number" min = "1" name = "amount" class="form-control">
            </div> <button id = "transfer" class="btn btn-primary float-right">Transfer Now</button> 
        </form> </div> </div> 
<jsp:include page = "footer.jsp"/>