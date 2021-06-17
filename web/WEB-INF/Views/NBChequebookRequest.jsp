<jsp:include page="nbheader.jsp" />
<%@page import="config.DbConfig"%>
<h3 class="text-center m-2 border-bottom p-2">Cheque Book Request</h3>
<jsp:include page="message.jsp" />
<div class="row">
    <div class="col-8 mx-auto">                   
        <form method="post" action="../SaveRequest">
            <%
                String accno = DbConfig
                        .findAccountByCustID(session.getAttribute("cid").toString());
            %>
            <input type="hidden" name="accno" value="<%= accno%>" >
            <input type="hidden" name="from" value="nb">
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <label>Request Date</label>
                        <input type="date" id="tdate" name="tdate" class="form-control">
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label>No. of Cheques</label>
                        <select name="qty" class="form-control">
                            <option>10</option>
                            <option>25</option>
                            <option>50</option>
                        </select>
                    </div>
                </div>
            </div>
            <button class="btn btn-primary float-right">Submit Request</button>
        </form>       
    </div>
</div>
<script>
    document.getElementById("tdate").valueAsDate = new Date();
</script>
<jsp:include page="footer.jsp" />