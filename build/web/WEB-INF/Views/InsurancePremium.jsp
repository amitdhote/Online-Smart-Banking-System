<%@page import="config.DbConfig"%>
<jsp:include page="nbheader.jsp" />

<h3 class="text-center border-bottom border-primary p-2">Insurance Premium Payment</h3>
<form method="post" action="../PremiumPayment"> 
    <%
        String accno = DbConfig
                .findAccountByCustID(session.getAttribute("cid").toString());
    %>
    <input type="hidden" name="accno" value="<%= accno %>" >
    <div class="row">
        <div class="col-sm-5 mx-auto">
            <jsp:include page="message.jsp" />
            
            <div class="form-group">
                <label>Insurance Company</label>
                <select required name="company" class="form-control">
                    <option value=""> -- Select Company --</option>
                    <option>LIC</option>
                    <option>ICICI Insurance</option>
                    <option>SBI Insurance</option>
                    <option>HDFC Life Insurance</option>                    
                </select>
            </div>
            <div class="form-group">
                <label>Enter Policy Number</label>
                <input type="text" name="pno" required placeholder="Policy Number" class="form-control">
            </div>
            <div class="form-group">
                <label>Enter Premium</label>
                <input type="number" name="amount" required placeholder="Premium Amount" class="form-control">
            </div>
            <input type="submit" value="Pay Now" class="btn btn-primary float-right">
        </div>


    </div>
</form>
<jsp:include page="footer.jsp" />