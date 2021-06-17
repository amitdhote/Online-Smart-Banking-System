<%@page import="config.DbConfig"%>
<jsp:include page="nbheader.jsp" />

<h3 class="text-center border-bottom border-primary p-2">Electricity Bill Payment</h3>
<form method="post" action="../EBillPay"> 
    <%
        String accno = DbConfig
                .findAccountByCustID(session.getAttribute("cid").toString());
    %>
    <input type="hidden" name="accno" value="<%= accno %>" >
    <div class="row">
        <div class="col-sm-5 mx-auto">
            <jsp:include page="message.jsp" />            
            <div class="form-group">
                <label>Operator</label>
                <select required class="form-control">
                    <option value=""> -- Select State --</option>
                    <option>Haryana</option>
                    <option>Delhi</option>
                    <option>Utter Pradesh</option>
                    <option>Bihar</option>                    
                    <option>Rajasthan</option>                    
                    <option>Gujrat</option>                    
                </select>
            </div>
            <div class="form-group">
                <label>Account Number</label>
                <input type="text" name="eaccno" required placeholder="Account Number" class="form-control">
            </div>
            <div class="form-group">
                <label>Bill Amount</label>
                <input type="number" name="amount" required placeholder="Bill Amount" class="form-control">
            </div>
            <input type="submit" value="Pay Now" class="btn btn-primary float-right">
        </div>


    </div>
</form>
<jsp:include page="footer.jsp" />