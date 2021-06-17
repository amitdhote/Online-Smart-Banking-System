<%@page import="config.DbConfig"%>
<jsp:include page="nbheader.jsp" />

<h3 class="text-center border-bottom border-primary p-2">Mobile Recharge</h3>
<form method="post" action="../RechargeProcess"> 
    <%
        String accno = DbConfig
                .findAccountByCustID(session.getAttribute("cid").toString());
    %>
    <input type="hidden" name="accno" value="<%= accno %>" >
    <div class="row">
        <div class="col-sm-5 mx-auto">
            <jsp:include page="message.jsp" />
            <div class="form-group">
                <label>Enter Mobile Number</label>
                <input type="text" name="mobile" required placeholder="Mobile Number" class="form-control">
            </div>
            <div class="form-group">
                <label>Operator</label>
                <select required name="operator" class="form-control">
                    <option value=""> -- Select Operator --</option>
                    <option>Airtel</option>
                    <option>Reliance Jio</option>
                    <option>Vodafone Idea</option>
                    <option>BSNL</option>                    
                </select>
            </div>
            <div class="form-group">
                <label>Enter Amount</label>
                <input type="number" name="amount" required placeholder="Recharge Amount" class="form-control">
            </div>
            <input type="submit" value="Recharge Now" class="btn btn-primary float-right">
        </div>


    </div>
</form>
<jsp:include page="footer.jsp" />