<%@page import="config.DbConfig"%>
<jsp:include page="header.jsp" />
    <h2 class="text-center m-2">Welcome to Dashboard</h4>
    <div class="row">        
        <div class="col-3 p-2">
            <div class="p-4 text-white bg-primary text-right">
            <h4>Active Accounts</h4>
            <h5><%= DbConfig.countaccounts() %></h5>
            </div>
        </div>
        <div class="col-3 p-2">
            <div class="p-4 text-white bg-danger text-right">
            <h4>Today's Debit</h4>
            <h5>&#8377; <%= DbConfig.todaytrans("dr") %></h5>
            </div>
        </div>
        <div class="col-3 p-2">
            <div class="p-4 text-white bg-success text-right">
            <h4>Today's Credit</h4>
            <h5>&#8377; <%= DbConfig.todaytrans("cr") %></h5>
            </div>
        </div>
        <div class="col-3 p-2">
            <div class="p-4 text-white bg-info text-right">
            <h4>Cash in Hand</h4>
            <h5>&#8377; <%= DbConfig.todaytrans("cr")- DbConfig.todaytrans("dr") %></h5>
            </div>
        </div>
    </div>
<jsp:include page="footer.jsp" />